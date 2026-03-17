# Developer AI Platform

An **internal developer AI platform** that automates engineering workflows, reasons over events from GitHub/Jira/Jenkins/Confluence/Gmail/Slack, understands repository relationships via a knowledge graph, and answers engineering questions through semantic search.

The platform runs **locally** with three managed services:

- **IronClaw** — a Rust-based reasoning engine (port 3000) that handles task planning, tool selection, and summarization through structured API endpoints (`/interpret`, `/plan`, `/select-tools`, `/summarize`). It is the platform's decision-making core.
- **Cloudflare Tunnel** — exposes the local Event Gateway to the internet so external services can deliver webhooks.
- **Python backend** (port 8080) — FastAPI Event Gateway, workflow engine, orchestrator, knowledge graph, and dashboard API.

When IronClaw is unavailable, the platform falls back to a cloud LLM via **OpenRouter** (or any OpenAI-compatible API). This provides approximate equivalents of IronClaw's capabilities by prompting a language model, but IronClaw is the primary and preferred reasoning path.

This is the **macOS** edition with POSIX-friendly paths, Bash scripts, and macOS-compatible setup.

---

## Architecture

```
                          External Services
    GitHub    Slack    Jira    Jenkins    Confluence    Gmail
        │       │       │         │            │          │
        └───────┴───────┴─────────┴────────────┴──────────┘
                                    │
                        Cloudflare Tunnel (auto-started)
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Event Gateway (FastAPI :8080)                  │
│  /webhooks/github | slack | jira | jenkins | gmail               │
│  Standardized events → { event_id, source, type, actor, payload } │
└─────────────────────────────────────────────────────────────────┘
                                    │
                    ┌───────────────┼───────────────┐
                    ▼               ▼               ▼
            ┌─────────────┐  ┌─────────────┐  ┌─────────────┐
            │ Event Store │  │  Redis      │  │ Workflow    │
            │ (PostgreSQL)│  │  Event Bus │  │ Engine      │
            └─────────────┘  └─────────────┘  └─────────────┘
                    │               │               │
                    └───────────────┼───────────────┘
                                    ▼
┌─────────────────────────────────────────────────────────────────┐
│              IronClaw Reasoning Engine (Rust :3000)               │
│  /interpret  /plan  /select-tools  /summarize                    │
│                                                                   │
│  Auto-started by the platform.                                    │
│  If unavailable → OpenRouter LLM fallback (cloud)                │
└─────────────────────────────────────────────────────────────────┘
                                    │
                                    ▼
┌─────────────────────────────────────────────────────────────────┐
│                  Capability Registry & Orchestrator              │
│  github.* | slack.* | jira.* | jenkins.* | gmail.* | confluence.*│
│  knowledge.search | find_repo | trace_commit | explain_system     │
└─────────────────────────────────────────────────────────────────┘
                                    │
        ┌───────────────────────────┼───────────────────────────┐
        ▼                           ▼                           ▼
┌───────────────┐         ┌─────────────────┐         ┌─────────────────┐
│ Knowledge     │         │ Repository      │         │ Embeddings      │
│ Graph         │         │ Intelligence    │         │ (pgvector)      │
│ Nodes & Edges │         │ Indexer         │         │ Semantic search │
└───────────────┘         └─────────────────┘         └─────────────────┘
        │                           │                           │
        └───────────────────────────┴───────────────────────────┘
                                    │
                                    ▼
                        PostgreSQL / SQLite
                                    │
                                    ▼
                        Web Dashboard (Next.js :3001)
```

---

## How IronClaw and OpenRouter Relate

| | IronClaw | OpenRouter |
|---|---|---|
| **What** | Rust binary providing structured reasoning endpoints | Cloud LLM API gateway (Claude, GPT, etc.) |
| **Runs** | Locally as a child process (auto-started) | Cloud — requires API key and internet |
| **Endpoints** | `/interpret`, `/plan`, `/select-tools`, `/summarize` | OpenAI-compatible `/chat/completions` |
| **Role** | Primary reasoning engine — task planning, tool selection, interpretation | Fallback — approximates IronClaw by prompting an LLM |
| **When used** | Always, when available | Automatically, when IronClaw is unreachable |

IronClaw is **not** an LLM API. It is a dedicated reasoning engine with structured input/output contracts. OpenRouter provides general-purpose LLM access as a degraded fallback path.

---

## System Components

| Component | Description |
|-----------|-------------|
| **Event Gateway** | FastAPI webhook server; converts source-specific payloads into standardized events; stores events in PostgreSQL |
| **Event Bus** | Redis-backed queue for durable event delivery; workers consume events; in-memory fallback when Redis unavailable |
| **Event Store** | PostgreSQL (or SQLite) tables for events with `event_id`, `source`, `type`, `timestamp`, `actor`, `payload` |
| **Workflow Engine** | YAML-defined workflows; triggers on event types (e.g. `jenkins.build.failed`); executes tool sequences |
| **Capability Registry** | Registry of tools with name, description, JSON schema, handler; used by IronClaw for tool selection |
| **IronClaw Runtime** | Rust reasoning engine (auto-started); task planning, tool selection, summarization; Python orchestrator executes returned tool calls |
| **Cloudflare Tunnel** | Auto-started `cloudflared` process; exposes `localhost:8080` to a public hostname for webhook delivery |
| **Knowledge Graph** | Engineering relationship graph (repos, files, commits, PRs, issues, pipelines, docs, engineers); stored in PostgreSQL |
| **Repository Intelligence Indexer** | Ingesters for GitHub, Jira, Confluence, Jenkins; stores artifacts as documents |
| **Embeddings** | pgvector/JSON embeddings for semantic search over code, PRs, Jira comments, Confluence pages |
| **Knowledge Tools** | `knowledge.search`, `knowledge.find_repo`, `knowledge.trace_commit`, `knowledge.find_related_docs`, `knowledge.explain_system` |

---

## Prerequisites

| Software | Install Command | Verify |
|----------|-----------------|--------|
| **Python 3.10+** | `brew install python@3.13` | `python3 --version` |
| **Node.js 18+** | `brew install node@20` | `node --version` |
| **cloudflared** | `brew install cloudflare/cloudflare/cloudflared` | `cloudflared --version` |
| **IronClaw** | Install from IronClaw releases; must be on PATH | `ironclaw --version` |
| **PostgreSQL** (optional) | `brew install postgresql@16` | `psql --version` |
| **Redis** (optional) | `brew install redis` | `redis-cli ping` |

- **IronClaw** auto-starts with the platform. If the `ironclaw` binary is not on PATH, the platform logs a warning and uses OpenRouter as a fallback.
- **cloudflared** auto-starts with the platform when `WEBHOOK_BASE_URL` is set in `.env`. If `cloudflared` is not installed, the platform runs without a webhook tunnel.
- **SQLite** is the default database when `DATABASE_URL` is not set. The event bus uses in-memory mode when Redis is unavailable.

---

## Quick Start

```bash
# Clone or download the project
cd ~/Developer/Mac-developer-platform-agent

# Create venv and install dependencies
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# Copy and edit environment
cp .env.example .env
nano .env  # or: open -e .env

# Start the full platform (IronClaw + Cloudflare Tunnel + backend)
python3 -m backend.main run

# In another terminal: frontend dashboard
cd frontend && npm install && npm run dev
```

Open http://localhost:8080 (API) and http://localhost:3001 (dashboard).

---

## Manual Setup

### 1. Virtual Environment

```bash
python3 -m venv .venv
source .venv/bin/activate
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
pip install -r requirements-dev.txt
```

### 3. Configure Environment

```bash
cp .env.example .env
nano .env
```

**IronClaw and LLM configuration:**

| Variable | Description |
|---------|-------------|
| `IRONCLAW_URL` | IronClaw service address (default `http://localhost:3000`) |
| `OPENROUTER_API_KEY` | From [openrouter.ai](https://openrouter.ai) — used only as fallback when IronClaw is unavailable |
| `OPENROUTER_MODEL` | Fallback model, e.g. `anthropic/claude-sonnet-4` |

**Webhook tunnel:**

| Variable | Description |
|---------|-------------|
| `WEBHOOK_BASE_URL` | Public URL for webhook delivery, e.g. `https://claw.yourdomain.com`. When set, `cloudflared` auto-starts. |
| `WEBHOOK_HOST` | Backend bind address (default `127.0.0.1`) |
| `WEBHOOK_PORT` | Backend port (default `8080`) |

**Slack:**

| Variable | Description |
|---------|-------------|
| `SLACK_BOT_TOKEN` | From [api.slack.com/apps](https://api.slack.com/apps) |
| `SLACK_SIGNING_SECRET` | Webhook signing secret |

**GitHub:**

| Variable | Description |
|---------|-------------|
| `GITHUB_TOKEN` | Personal access token or GitHub App token |
| `GITHUB_WEBHOOK_SECRET` | Secret for verifying webhook signatures |

**Jira:**

| Variable | Description |
|---------|-------------|
| `JIRA_URL`, `JIRA_USER`, `JIRA_API_TOKEN` | Jira Cloud API credentials |
| `JIRA_WEBHOOK_SECRET` | Optional webhook secret |

**Jenkins:**

| Variable | Description |
|---------|-------------|
| `JENKINS_URL`, `JENKINS_USER`, `JENKINS_API_TOKEN` | Jenkins API credentials |
| `JENKINS_WEBHOOK_SECRET` | Optional webhook token |

**Confluence:**

| Variable | Description |
|---------|-------------|
| `CONFLUENCE_URL`, `CONFLUENCE_USER`, `CONFLUENCE_API_TOKEN` | Confluence Cloud API credentials |

**Gmail:**

| Variable | Description |
|---------|-------------|
| `GMAIL_CREDENTIALS_FILE` | Path to OAuth2 credentials JSON |
| `GMAIL_TOKEN_FILE` | Path to saved token JSON |

**Additional integrations (optional):**

| Variable | Description |
|---------|-------------|
| `OUTLOOK_ACCESS_TOKEN` | Microsoft Graph API OAuth2 token |
| `ZOHO_ACCESS_TOKEN`, `ZOHO_ACCOUNT_ID` | Zoho Mail API |
| `X_BEARER_TOKEN` | X (Twitter) API v2 bearer token |
| `LINKEDIN_ACCESS_TOKEN` | LinkedIn OAuth2 access token |

**Infrastructure (optional):**

| Variable | Description |
|---------|-------------|
| `DATABASE_URL` | e.g. `postgresql://claw:claw@localhost:5432/clawagent` (SQLite fallback if unset) |
| `REDIS_URL` | e.g. `redis://localhost:6379/0` (in-memory fallback if unset) |
| `OPENAI_API_KEY` | For embeddings / semantic search |
| `EMBEDDING_PROVIDER` | `openai` (default) or `ollama` for local embeddings |

### 4. (Optional) PostgreSQL

```bash
brew install postgresql@16
brew services start postgresql@16
createuser -s claw
createdb -O claw clawagent
```

If skipped, SQLite is used (`data/platform.db`).

### 5. Start the Platform

```bash
source .venv/bin/activate
python3 -m backend.main run
```

This single command:
1. **Starts IronClaw** — launches the `ironclaw` binary as a child process and waits for its health endpoint. If `ironclaw` is not on PATH, logs a warning and continues with OpenRouter fallback.
2. **Initializes the database** — creates all tables (events, workflows, knowledge graph, documents, embeddings, chat sessions).
3. **Loads workflows** — reads YAML files from `backend/workflows/` and subscribes to event triggers.
4. **Starts Cloudflare Tunnel** — launches `cloudflared` when `WEBHOOK_BASE_URL` is set. Uses `~/.cloudflared/config.yml` for named tunnels or falls back to a quick tunnel.
5. **Starts the FastAPI server** on port 8080.

All child processes (IronClaw, cloudflared) are **automatically stopped** when the backend exits (Ctrl+C, crash, or normal shutdown). Child processes are managed via `start_new_session` and `os.killpg` for reliable cleanup on macOS.

**CLI flags:**

| Flag | Effect |
|------|--------|
| `--no-ironclaw` | Skip IronClaw auto-start; use OpenRouter only |
| `--no-tunnel` | Skip Cloudflare Tunnel auto-start |
| `--host`, `-h` | Bind address (default `127.0.0.1`, overridden by `WEBHOOK_HOST`) |
| `--port`, `-p` | Port (default `8080`, overridden by `WEBHOOK_PORT`) |
| `--reload` | Auto-reload on code changes (development) |

**All CLI commands:**

| Command | Description |
|---------|-------------|
| `python3 -m backend.main run` | Full platform: IronClaw + Cloudflare Tunnel + workflows + knowledge + webhooks |
| `python3 -m backend.main run --no-ironclaw` | Full platform without IronClaw (OpenRouter only) |
| `python3 -m backend.main run --no-tunnel` | Full platform without Cloudflare Tunnel (local only) |
| `python3 -m backend.main webhook-server` | Webhooks only (no orchestrator, no child processes) |
| `python3 -m backend.main index` | Run repository intelligence indexers |
| `python3 -m backend.main reindex-embeddings` | Regenerate embeddings for all documents |

**Index examples:**

```bash
python3 -m backend.main index --github owner/repo1 --github owner/repo2 --jira PROJECT --confluence SPACE
python3 -m backend.main index --jenkins
```

### 6. Start the Dashboard

```bash
cd frontend
npm install
npm run dev
```

Open http://localhost:3001.

### 7. Log Files

Child process output is written to log files in the `data/` directory:

| File | Contents |
|------|----------|
| `data/ironclaw.log` | IronClaw stdout/stderr (when started by the platform) |
| `data/cloudflared.log` | Cloudflare Tunnel stdout/stderr (when started by the platform) |
| `data/platform.db` | SQLite database (when PostgreSQL is not configured) |

---

## Webhook Configuration (Cloudflare Tunnel)

The platform runs locally but external services (GitHub, Slack, Jira, Jenkins, Gmail) need a public URL to deliver webhooks. The platform uses [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/) to expose the local Event Gateway securely — no open ports, no NAT configuration.

**The tunnel auto-starts when `WEBHOOK_BASE_URL` is set in `.env`.** You only need the manual steps below for initial setup.

### Install `cloudflared`

```bash
brew install cloudflare/cloudflare/cloudflared
cloudflared --version
```

### Option A: Quick Tunnel (no Cloudflare account required)

For development and testing. Set in `.env`:

```ini
WEBHOOK_BASE_URL=https://will-be-printed-on-startup.trycloudflare.com
```

If no `~/.cloudflared/config.yml` exists, the platform launches a quick tunnel automatically and prints the URL.

### Option B: Named Tunnel (persistent, recommended)

A named tunnel gives you a stable hostname. This is one-time setup.

**1. Authenticate:**

```bash
cloudflared tunnel login
```

**2. Create the tunnel:**

```bash
cloudflared tunnel create dev-platform
```

**3. Configure DNS:**

```bash
cloudflared tunnel route dns dev-platform claw.yourdomain.com
```

**4. Create `~/.cloudflared/config.yml`:**

```yaml
tunnel: <tunnel-uuid>
credentials-file: /Users/YourName/.cloudflared/<tunnel-uuid>.json

ingress:
  - hostname: claw.yourdomain.com
    service: http://localhost:8080
  - service: http_status:404
```

**5. Set in `.env`:**

```ini
WEBHOOK_BASE_URL=https://claw.yourdomain.com
```

From now on, `python3 -m backend.main run` will automatically launch the named tunnel.

### Register Webhooks with Services

| Service | Webhook URL | Notes |
|---------|-------------|-------|
| GitHub | `https://claw.yourdomain.com/webhooks/github` | Repo Settings → Webhooks; set `GITHUB_WEBHOOK_SECRET` |
| Slack | `https://claw.yourdomain.com/webhooks/slack` | App Event Subscriptions; set `SLACK_SIGNING_SECRET` |
| Jira | `https://claw.yourdomain.com/webhooks/jira` | Jira Settings → System → WebHooks |
| Jenkins | `https://claw.yourdomain.com/webhooks/jenkins` | Job post-build actions |
| Gmail | `https://claw.yourdomain.com/webhooks/gmail` | Google Cloud Pub/Sub push subscription |

### Verify the Tunnel

```bash
curl -s https://claw.yourdomain.com/health | python3 -m json.tool
```

Expected response:

```json
{"status": "ok", "platform": "developer-ai", "version": "2.0.0", "timestamp": "..."}
```

### Troubleshooting

If webhooks aren't getting through:

1. **Check cloudflared is running:** Look for `Cloudflare Tunnel started (pid ...)` in the startup logs.
2. **Check for stale connectors:** `cloudflared tunnel cleanup dev-platform` purges old connections from previous runs.
3. **Check logs:** `data/cloudflared.log` has the tunnel process output.
4. **Stale processes:** If you see multiple `cloudflared` processes (`ps aux | grep cloudflared`), kill the stale ones — Cloudflare load-balances across all connectors for a tunnel, and stale ones cause intermittent failures.

---

## Using the Agent

### Slack Commands

| What You Type | What Happens |
|---------------|--------------|
| `@claw summarize today's PRs` | Fetches PRs from GitHub and posts a summary |
| `@claw investigate Jenkins build 1234` | Fetches logs, analyzes failure, explains what broke |
| `@claw create Jira ticket from this email` | Reads email thread and creates a Jira ticket |
| `@claw trace commit abc123` | Traces commit through PRs and Jira issues (knowledge graph) |

### Dashboard (localhost:3001)

| Page | What It Shows |
|------|---------------|
| **Status** | Platform health, IronClaw status, event/workflow/document/node counts |
| **Logs** | Platform activity logs |
| **Events** | Webhook events and agent events |
| **Workflows** | Workflow definitions |
| **Runs** | Workflow execution history |
| **Tools** | Registered capabilities with JSON schemas |
| **Conversations** | Agent conversation history |
| **Chat** | Interactive chat with the agent (session-based) |
| **Feeds & Email** | X/Twitter, LinkedIn feeds; Outlook, Zoho inbox |
| **Markets** | Crypto, stock, and commodity market data |

### API Endpoints

**Health & Status:**

| Endpoint | Purpose |
|----------|---------|
| `GET /health` | Platform health check |
| `GET /api/status` | Detailed status: IronClaw health, event/workflow/document/node counts |

**Events:**

| Endpoint | Purpose |
|----------|---------|
| `POST /webhooks/github` | GitHub webhook receiver |
| `POST /webhooks/slack` | Slack webhook receiver |
| `POST /webhooks/jira` | Jira webhook receiver |
| `POST /webhooks/jenkins` | Jenkins webhook receiver |
| `POST /webhooks/gmail` | Gmail webhook receiver |
| `GET /api/events` | List events (filterable by source, type) |
| `GET /api/events/{event_id}` | Single event detail |

**Workflows:**

| Endpoint | Purpose |
|----------|---------|
| `GET /api/workflows` | List workflow definitions |
| `GET /api/workflow-runs` | List workflow execution history |

**Tools & Agent:**

| Endpoint | Purpose |
|----------|---------|
| `GET /api/tools` | List registered capabilities |
| `POST /api/chat` | Send message to agent (simple) |
| `GET /api/conversations` | List agent conversations |

**Chat Sessions:**

| Endpoint | Purpose |
|----------|---------|
| `POST /api/chat/new` | Create a new chat session |
| `GET /api/chat/sessions` | List all chat sessions |
| `GET /api/chat/{session_id}/messages` | Get messages for a session |
| `POST /api/chat/{session_id}/send` | Send message in a session |
| `DELETE /api/chat/{session_id}` | Delete a chat session |

**Knowledge & Documents:**

| Endpoint | Purpose |
|----------|---------|
| `GET /api/knowledge/nodes` | List knowledge graph nodes |
| `GET /api/knowledge/nodes/{node_id}` | Single node with edges |
| `GET /api/knowledge/edges` | List knowledge graph edges |
| `GET /api/documents` | List indexed documents |
| `GET /api/documents/{doc_id}` | Single document detail |

**Model Configuration:**

| Endpoint | Purpose |
|----------|---------|
| `GET /api/model/config` | Current IronClaw/LLM configuration and status |
| `POST /api/model/config` | Update model configuration |

**Integrations & Data:**

| Endpoint | Purpose |
|----------|---------|
| `GET /api/markets` | Crypto, stocks, commodities market data |
| `GET /api/markets/history` | Market price history |
| `GET /api/feeds/x` | X/Twitter feed |
| `GET /api/feeds/linkedin` | LinkedIn feed |
| `GET /api/integrations/outlook/inbox` | Outlook inbox |
| `GET /api/integrations/zoho/inbox` | Zoho Mail inbox |
| `GET /api/integrations/config` | Integration connection status |

**Logs:**

| Endpoint | Purpose |
|----------|---------|
| `GET /api/logs` | Platform activity logs |

---

## Workflows

Workflows are YAML files in `backend/workflows/`. Trigger format:

```yaml
name: Jenkins Failure Alert
trigger:
  type: jenkins.build.failed
description: Fetch logs, summarize, notify Slack
actions:
  - tool: jenkins.fetch_build_logs
    args:
      job: "{{ job_name }}"
      build_number: "{{ build_number }}"
  - tool: agent.summarize_logs
    args:
      text: "{{ build_log }}"
  - tool: slack.send_message
    args:
      channel: "#dev-notifications"
      text: "Build failed: {{ summary }}"
```

**Built-in workflows:**

| Workflow | Trigger | Actions |
|----------|---------|---------|
| PR Opened | `github.pull_request.opened` | Summarize PR → Slack → Link Jira |
| Jenkins Failure | `jenkins.build.failed` | Fetch logs → Summarize → Alert Slack |
| Jira Created | `jira.issue.created` | Create GitHub issue → Slack → Update Jira |

---

## Knowledge Graph

The graph models engineering relationships:

**Node types:** `repository`, `file`, `commit`, `pull_request`, `jira_issue`, `pipeline`, `documentation`, `engineer`

**Edge types:** `repo_contains_file`, `file_modified_by_commit`, `commit_part_of_pr`, `pr_links_to_issue`, `repo_deployed_by_pipeline`, `authored_by`, `reviewed_by`, `assigned_to`

**Knowledge tools (available to IronClaw):**

| Tool | Purpose |
|------|---------|
| `knowledge.search` | Semantic search across indexed documents |
| `knowledge.find_repo` | Repository details and relationships |
| `knowledge.trace_commit` | Commit → PRs → Jira issues → files |
| `knowledge.find_related_docs` | Related documentation |
| `knowledge.explain_system` | Explain a system using graph + docs |

---

## Running Tests

```bash
# All tests
python3 -m pytest tests/ -v

# Platform unit tests
python3 -m pytest tests/unit/ -v

# Platform integration tests
python3 -m pytest tests/integration/ -v

# With coverage
python3 -m pytest tests/ -v --cov=backend --cov-report=html
```

Or use the test script:

```bash
./scripts/test.sh              # All tests
./scripts/test.sh --unit       # Unit only
./scripts/test.sh --integration # Integration only
./scripts/test.sh --deployment  # Deployment only
./scripts/test.sh --coverage    # With coverage report
```

**Test categories:**

| Category | Location | What It Tests |
|----------|----------|---------------|
| **Unit** | `tests/unit/` | Models, graph, event bus, workflows, IronClaw client, embeddings, orchestrator, memory, knowledge tools |
| **Integration** | `tests/integration/` | Webhook → event store, dashboard reads, knowledge pipeline, orchestrator pipeline, workflow triggers |
| **Deployment** | `tests/deployment/` | macOS paths, health, DB, environment |

---

## Project Structure

```
Mac-developer-platform-agent/
│
├── backend/
│   ├── main.py                CLI entry point; manages IronClaw + cloudflared child processes
│   ├── agent/                 IronClaw client, orchestrator, memory
│   ├── integrations/          GitHub, Slack, Jira, Jenkins, Confluence, Gmail
│   ├── database/              SQLAlchemy models (events, workflows, knowledge graph, documents, embeddings, chat)
│   ├── events/                Redis-backed event bus
│   ├── workflows/             YAML loader, engine, workflow definitions
│   ├── webhooks/              FastAPI Event Gateway + dashboard API + chat/market/feed endpoints
│   ├── knowledge/             Graph, indexer, embeddings, query tools
│   ├── tools/                 Capability registry
│   └── security/              Secrets, webhook verification, redaction
│
├── frontend/                  Next.js 14 dashboard (port 3001)
├── config/                    config.yaml
├── data/                      SQLite DB, ironclaw.log, cloudflared.log (created at runtime)
├── scripts/                   Bash (setup, start, stop, test, build)
├── tests/                     Unit, integration, deployment tests
├── packaging/                 PyInstaller spec, launcher, portable README
├── requirements.txt           Python dependencies
├── requirements-dev.txt       Dev/test dependencies
├── .env.example               Environment template
├── architecture_decisions.md  ADR log
└── README.md
```

---

## Stopping Services

Press **Ctrl+C** in the terminal running `python3 -m backend.main run`. IronClaw and cloudflared are stopped automatically via process group signals.

Or use the stop script:

```bash
./scripts/stop.sh
```

---

## Security

- API keys and tokens go in `.env` — never in code.
- `.env` is in `.gitignore`.
- Webhooks are verified with HMAC-SHA256 where supported.
- Secrets are redacted from logs via `RedactingFilter`.
- Do not log tokens or credentials.

---

## Packaged Executable

To build a distributable binary:

```bash
./scripts/build.sh
```

Produces `dist/ClawAgent` and `dist/ClawAgent-Portable/`.

The build script automatically detects Apple Silicon (`arm64`) vs Intel (`x86_64`) and downloads the correct IronClaw binary.

---

## Differences from Windows Version

| Aspect | Windows | macOS |
|--------|---------|-------|
| Package manager | winget / chocolatey | Homebrew |
| Scripts | PowerShell (`.ps1`) | Bash (`.sh`) |
| Paths | `C:\Users\you\...` | `/Users/you/...` |
| Python | `python` | `python3` |
| Venv activation | `.venv\Scripts\Activate.ps1` | `source .venv/bin/activate` |
| Child process mgmt | `CREATE_NEW_PROCESS_GROUP` | `start_new_session` + `os.killpg` |
| App data fallback | `%LOCALAPPDATA%\ClawAgent` | `~/Library/Application Support/ClawAgent` |
| IronClaw binary | `ironclaw-x86_64-pc-windows-msvc` | `ironclaw-aarch64-apple-darwin` / `ironclaw-x86_64-apple-darwin` |
| Build output | `ClawAgent.exe` | `ClawAgent` (Unix binary) |
| Default DB | SQLite in `data/platform.db` | Same |
