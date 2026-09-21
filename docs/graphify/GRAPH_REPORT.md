# Graph Report - MacOS-developer-platform-agent  (2026-09-21)

## Corpus Check
- 103 files · ~178,597 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1053 nodes · 1997 edges · 89 communities (60 shown, 29 thin omitted)
- Extraction: 92% EXTRACTED · 8% INFERRED · 0% AMBIGUOUS · INFERRED: 151 edges (avg confidence: 0.91)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- load_workflow()
- package.json
- IronClawClient
- main.py
- test_knowledge_tools.py
- ConversationMemory
- models.py
- secrets.py
- _cosine_similarity()
- create_app()
- EmbeddingStore
- init_db()
- test_redis_event_bus.py
- EventBus
- TestMacOSPaths
- os
- test_platform_models.py
- github_integration.py
- compilerOptions
- types.py
- api.ts
- fetchApi()
- ToolSchema
- markets/page.tsx
- test_event_gateway.py
- Orchestrator
- gmail.py
- jira_integration.py
- KnowledgeGraph
- WorkflowEngine
- test_knowledge_graph.py
- get_session()
- confluence.py
- jenkins.py
- ToolRegistry
- _log_event()
- app/page.tsx
- slack.py
- Any
- GitHubIndexer
- graphify_pipeline.py
- TestEnvironment
- asyncio
- test_backend_orchestrator.py
- .run_workflow()
- chat/page.tsx
- test_environment.py
- SlackCommandGateway
- RepositoryIntelligenceIndexer
- verify_webhook_signature()
- Any
- _load_model_config()
- react
- ModelSelector.tsx
- TestServiceHealth
- full_app()
- TestDashboardAPI
- pytest
- logs/page.tsx
- workflow-runs/page.tsx
- sys
- TestDashboardReadsWebhookData
- TestNodeOperations
- _register_tools()
- JenkinsIndexer
- next.config.js
- start.sh
- TestSlackWebhook
- agent/__init__.py
- database/__init__.py
- events/__init__.py
- backend/__init__.py
- integrations/__init__.py
- knowledge/__init__.py
- security/__init__.py
- tools/__init__.py
- webhooks/__init__.py
- _now_iso()
- workflows/__init__.py
- next-env.d.ts
- build.sh
- setup.sh
- stop.sh
- test.sh

## God Nodes (most connected - your core abstractions)
1. `get_session()` - 68 edges
2. `create_app()` - 65 edges
3. `init_db()` - 45 edges
4. `KnowledgeGraph` - 37 edges
5. `EventBus` - 30 edges
6. `_register_tools()` - 28 edges
7. `ToolSchema` - 25 edges
8. `EmbeddingStore` - 24 edges
9. `ToolRegistry` - 23 edges
10. `fetchApi()` - 22 edges

## Surprising Connections (you probably didn't know these)
- `orchestrator()` --uses--> `Orchestrator`  [INFERRED]
  tests/unit/test_backend_orchestrator.py → backend/agent/orchestrator.py
- `TestWebhookToEventStore` --uses--> `Event`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py
- `TestGitHubWebhook` --uses--> `Event`  [INFERRED]
  tests/unit/test_event_gateway.py → backend/database/models.py
- `TestWorkflowTriggerPipeline` --uses--> `WorkflowRun`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py
- `TestWorkflowEngine` --uses--> `WorkflowRun`  [INFERRED]
  tests/unit/test_workflow_engine.py → backend/database/models.py

## Import Cycles
- None detected.

## Communities (89 total, 29 thin omitted)

### Community 0 - "load_workflow()"
Cohesion: 0.07
Nodes (25): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), Any, Path, Workflow loader - load YAML workflow definitions from disk. Supports the new…, Single action in a workflow. (+17 more)

### Community 1 - "package.json"
Cohesion: 0.05
Nodes (36): dependencies, next, react, react-dom, recharts, devDependencies, autoprefixer, postcss (+28 more)

### Community 2 - "IronClawClient"
Cohesion: 0.09
Nodes (19): AsyncClient, IronClawClient, Any, Interpret user message. Returns: - content: str (assistant text) - tool_calls:…, Decompose a goal into an ordered list of steps with tool selections. Returns: -…, Given a task description and available tools, select the best tools to use.…, Summarize text. Uses IronClaw or OpenRouter., HTTP client for IronClaw runtime gateway. Env: IRONCLAW_URL,… (+11 more)

### Community 3 - "main.py"
Cohesion: 0.07
Nodes (37): asyncio, atexit, Event Bus with Redis backing and in-memory fallback. Supports wildcard topic…, _build_ironclaw(), cli(), index(), main(), Path (+29 more)

### Community 4 - "test_knowledge_tools.py"
Cohesion: 0.06
Nodes (20): KnowledgeTools, Any, Knowledge query tools that can be registered in the capability registry., Semantic search across all indexed engineering documents., Find a repository and its relationships (files, pipelines, engineers)., Trace a commit through PRs, Jira issues, and modified files., Find documentation related to a repository, file, or issue., Explain a system or component by combining graph data and document search.… (+12 more)

### Community 5 - "ConversationMemory"
Cohesion: 0.08
Nodes (22): ConversationMemory, Any, Persists and retrieves conversation messages from the database., Persist a conversation message., Retrieve recent messages for a conversation., Get messages in format suitable for LLM chat API., env_secrets(), event_bus() (+14 more)

### Community 6 - "models.py"
Cohesion: 0.10
Nodes (26): AgentConversation, AgentLog, AgentMemory, CachedSummary, ChatMessage, ChatSession, SQLAlchemy ORM models for the Developer AI Platform. Includes: Event Store,…, Persistent key-value memory for the agent. (+18 more)

### Community 7 - "secrets.py"
Cohesion: 0.09
Nodes (20): AppSecrets, get_secrets(), Backend secrets management, webhook verification, and redaction. Uses pydantic-…, Logging filter that redacts secrets from log records., Application secrets loaded from environment., Return cached AppSecrets instance., Redact known secret patterns from text., redact() (+12 more)

### Community 8 - "_cosine_similarity()"
Cohesion: 0.09
Nodes (16): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), Any, Generate and store embeddings for a document. If text is not provided, reads…, Semantic search across all indexed documents. Returns ranked results with… (+8 more)

### Community 9 - "create_app()"
Cohesion: 0.08
Nodes (17): create_app(), api_chat_delete(), api_chat_messages(), api_chat_sessions(), api_conversations(), api_document_detail(), api_documents(), api_event_detail() (+9 more)

### Community 10 - "EmbeddingStore"
Cohesion: 0.15
Nodes (15): Document, Embedding, Ingested document from any source (code, PR, Jira, Confluence, Jenkins)., Vector embedding for semantic search. Uses pgvector on PostgreSQL, JSON array…, EmbeddingStore, Embedding Store - Semantic search using pgvector on PostgreSQL (JSON array…, Manages document embeddings for semantic search., math (+7 more)

### Community 11 - "init_db()"
Cohesion: 0.16
Nodes (12): Event, _get_database_url(), get_engine(), init_db(), Standardized event from any webhook or internal source., sqlalchemy, deployment, fixture (+4 more)

### Community 12 - "test_redis_event_bus.py"
Cohesion: 0.13
Nodes (8): bus(), _no_redis(), asyncio, fixture, Unit tests for the Redis-backed Event Bus (in-memory fallback mode)., Test in-memory fallback when Redis is unavailable., TestEventBusFallback, handler()

### Community 13 - "EventBus"
Cohesion: 0.15
Nodes (9): EventBus, _consume(), Any, Dispatch event to all matching local handlers., Start consuming events from Redis stream in background., Async event bus with Redis stream backing and wildcard subscription support.…, Lazily connect to Redis., Publish an event to Redis stream and invoke local handlers. Event must have… (+1 more)

### Community 14 - "TestMacOSPaths"
Cohesion: 0.10
Nodes (10): deployment, Verify backend/main.py uses start_new_session for subprocess management., Verify the database module can create data directories on macOS., Verify workflow directory glob works on macOS., Verify the packaged launcher falls back to ~/Library/Application Support., Scan all .py files for hardcoded Windows-specific paths., Ensure no CREATE_NEW_PROCESS_GROUP or other Windows-only subprocess flags., Verify key modules use pathlib.Path instead of os.path.join. (+2 more)

### Community 15 - "os"
Cohesion: 0.18
Nodes (12): IronClawClient - HTTP client for IronClaw Rust reasoning engine. IronClaw runs…, ConversationMemory - Backend conversation persistence via SQLAlchemy. Stores…, Backend Orchestrator - Coordinates IronClaw/LLM and tools, persists…, SlackCommandGateway - Handles Slack app_mention events, routes to orchestrator.…, Knowledge Graph - Engineering relationship graph stored in PostgreSQL. Node…, Repository Intelligence Indexer. Ingests data from GitHub, Jira, Confluence,…, Knowledge Query Tools - Exposed as capabilities for IronClaw to answer…, httpx (+4 more)

### Community 16 - "test_platform_models.py"
Cohesion: 0.18
Nodes (14): Base, KnowledgeEdge, KnowledgeNode, Node in the engineering knowledge graph., Edge (relationship) in the engineering knowledge graph., Workflow execution records., WorkflowRun, DeclarativeBase (+6 more)

### Community 17 - "github_integration.py"
Cohesion: 0.19
Nodes (17): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), Any, GitHub integration - create_issue, summarize_pull_request, comment_on_pr,… (+9 more)

### Community 18 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 19 - "types.py"
Cohesion: 0.17
Nodes (10): AgentEvent, EventSource, Event types for the backend event bus., Event payload for the event bus., dataclasses, Enum, str, Unit tests for EventSource and AgentEvent. (+2 more)

### Community 20 - "api.ts"
Cohesion: 0.19
Nodes (13): EventsPage(), payloadPreview(), ToolsPage(), WorkflowsPage(), Event, fetchEvents(), fetchTools(), fetchWorkflows() (+5 more)

### Community 21 - "fetchApi()"
Cohesion: 0.17
Nodes (12): FeedsPage(), Tab, EmailMessage, FeedPost, FeedResponse, fetchApi(), fetchIntegrationsConfig(), fetchLinkedInFeed() (+4 more)

### Community 22 - "ToolSchema"
Cohesion: 0.20
Nodes (9): Tool registry for the backend orchestrator. Registers tools with JSON Schema…, JSON Schema for a tool's parameters., Registered tool with handler and schema., Register a tool by name., ToolEntry, ToolSchema, Unit tests for backend tools/registry module., TestToolEntry (+1 more)

### Community 23 - "markets/page.tsx"
Cohesion: 0.18
Nodes (14): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+6 more)

### Community 24 - "test_event_gateway.py"
Cohesion: 0.13
Nodes (9): client(), fixture, Unit tests for the Event Gateway (webhook server)., _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook (+1 more)

### Community 25 - "Orchestrator"
Cohesion: 0.22
Nodes (8): Orchestrator, Any, Execute a registered tool and return its result., Backend orchestrator with IronClaw client and tool registry., Build message list from history + new user message., Process user message: send to IronClaw, parse tool calls, execute, persist.…, Store tool output in database., TestOrchestratorPipeline

### Community 26 - "gmail.py"
Cohesion: 0.24
Nodes (12): _get_credentials_path(), _get_service(), _get_token_path(), Any, Path, Gmail integration - read_emails, summarize_thread, send_email,…, Get Gmail API service (lazy import)., Read emails matching query. (+4 more)

### Community 27 - "jira_integration.py"
Cohesion: 0.28
Nodes (12): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), Any, Jira integration - create_ticket, update_ticket, link_github_issue,…, Create a Jira ticket. (+4 more)

### Community 28 - "KnowledgeGraph"
Cohesion: 0.17
Nodes (7): KnowledgeGraph, Add an edge. Returns True if created, False if already exists., Get graph statistics., Interface over the PostgreSQL-backed knowledge graph., Create or update a node. Returns node_id., ConfluenceIndexer, Index Confluence documentation pages.

### Community 29 - "WorkflowEngine"
Cohesion: 0.21
Nodes (6): Executes YAML-defined workflows triggered by events., WorkflowEngine, asyncio, TestWorkflowTriggerPipeline, asyncio, TestWorkflowEngine

### Community 30 - "test_knowledge_graph.py"
Cohesion: 0.17
Nodes (6): graph(), fixture, Unit tests for the Knowledge Graph., _sqlite_in_memory(), TestEdgeOperations, TestGraphQueries

### Community 31 - "get_session()"
Cohesion: 0.23
Nodes (6): get_session(), Create or update a document. Returns doc_id., _upsert_document(), Session, sessionmaker, TestWebhookToEventStore

### Community 32 - "confluence.py"
Cohesion: 0.26
Nodes (11): _api(), create_page(), _get_config(), Any, Confluence integration - search_docs, summarize_page, create_page., Call Confluence REST API., Search Confluence using CQL., Fetch a page and return a text summary (title + body excerpt). (+3 more)

### Community 33 - "jenkins.py"
Cohesion: 0.26
Nodes (11): _api(), fetch_build_logs(), get_build_status(), _get_config(), Any, Jenkins integration - trigger_build, get_build_status, fetch_build_logs., Call Jenkins API (crumb may be required)., Trigger a Jenkins build. Returns build queue info. (+3 more)

### Community 34 - "ToolRegistry"
Cohesion: 0.23
Nodes (6): Register knowledge query tools in the capability registry., _register_knowledge_tools(), Registry of tools available to the orchestrator., List all registered tool names., ToolRegistry, TestBackendToolRegistry

### Community 35 - "_log_event()"
Cohesion: 0.32
Nodes (12): github_webhook(), gmail_webhook(), jenkins_webhook(), jira_webhook(), slack_webhook(), _log_event(), _make_event(), _persist_event() (+4 more)

### Community 36 - "app/page.tsx"
Cohesion: 0.23
Nodes (10): integrationNames, StatusPage(), StatusValue, toStatus(), Status, StatusCard(), StatusCardProps, statusDotClass() (+2 more)

### Community 37 - "slack.py"
Cohesion: 0.27
Nodes (10): _api(), _get_token(), Any, Slack integration - send_message, read_channel_history, respond_to_command., Send a message to a channel (optionally in a thread)., Read recent messages from a channel., Respond to a Slack slash command using the response_url., read_channel_history() (+2 more)

### Community 38 - "Any"
Cohesion: 0.31
Nodes (5): Any, Get neighboring nodes. direction: out, in, both., Trace a commit through the graph: commit → PR → Jira issues → repo., Find documentation nodes related to any entity., Find a repository node by name or external ID.

### Community 39 - "GitHubIndexer"
Cohesion: 0.18
Nodes (6): _github_headers(), GitHubIndexer, JiraIndexer, Index Jira issues into documents and knowledge graph., Index GitHub repositories, files, commits, and pull requests., Index a repository: metadata, files (tree), recent commits, open PRs.

### Community 40 - "graphify_pipeline.py"
Cohesion: 0.18
Nodes (9): graphify_analyze, graphify_build, graphify_cluster, graphify_detect, graphify_export, graphify_extract, graphify_llm, graphify_report (+1 more)

### Community 42 - "asyncio"
Cohesion: 0.27
Nodes (3): asyncio, TestOrchestratorExecuteTool, TestOrchestratorHandleMessage

### Community 43 - "test_backend_orchestrator.py"
Cohesion: 0.27
Nodes (8): api_tools(), ironclaw_mock(), orchestrator(), fixture, Unit tests for the backend Orchestrator (IronClaw + tool registry)., registry(), _sqlite_in_memory(), TestOrchestratorMemory

### Community 44 - ".run_workflow()"
Cohesion: 0.31
Nodes (7): _get_nested(), Any, Path, _render_template(), repl(), _resolve_args(), handler()

### Community 45 - "chat/page.tsx"
Cohesion: 0.31
Nodes (8): ChatPage(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchChatMessages(), fetchChatSessions(), sendChatMessage()

### Community 46 - "test_environment.py"
Cohesion: 0.20
Nodes (5): importlib, platform, deployment, Deployment tests: verify environment, dependencies, and configuration., TestWindowsCompatibility

### Community 47 - "SlackCommandGateway"
Cohesion: 0.25
Nodes (5): Any, Handles Slack app_mention events and routes to orchestrator., Register app_mention handler on the Slack Bolt app. Expects app to have…, Process a message and return the response. Used when the gateway is called…, SlackCommandGateway

### Community 48 - "RepositoryIntelligenceIndexer"
Cohesion: 0.33
Nodes (4): Any, Orchestrates all indexers for a full reindex., Run all indexers. github_repos format: ['owner/repo', ...], RepositoryIntelligenceIndexer

### Community 49 - "verify_webhook_signature()"
Cohesion: 0.39
Nodes (3): Verify webhook signature (HMAC-SHA256). - GitHub: X-Hub-Signature-256…, verify_webhook_signature(), TestVerifyWebhookSignature

### Community 50 - "Any"
Cohesion: 0.25
Nodes (4): Any, Convert to OpenAPI/JSON Schema format for tool calls., Get handler for a tool by name., Get all tool schemas for LLM tool declarations.

### Community 51 - "_load_model_config()"
Cohesion: 0.29
Nodes (8): api_model_config_get(), api_model_config_post(), _check_ironclaw(), _get_model_config_path(), _llm_chat(), _load_model_config(), _mask_key(), _save_model_config()

### Community 52 - "react"
Cohesion: 0.33
Nodes (5): ConversationsPage(), Conversation, fetchConversations(), Message, react

### Community 53 - "ModelSelector.tsx"
Cohesion: 0.38
Nodes (6): ModelSelector(), PROVIDERS, AvailableModel, fetchModelConfig(), ModelConfig, updateModelConfig()

### Community 54 - "TestServiceHealth"
Cohesion: 0.29
Nodes (3): deployment, fixture, TestServiceHealth

### Community 55 - "full_app()"
Cohesion: 0.29
Nodes (6): client(), full_app(), fixture, Create app with event bus and workflow engine wired up., Minimal app, no orchestrator., _sqlite_in_memory()

### Community 57 - "pytest"
Cohesion: 0.33
Nodes (4): fastapi_testclient, pytest, Deployment tests: verify all path handling is macOS-compatible., Deployment tests: verify services can start and respond to health checks.

### Community 58 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 59 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

### Community 60 - "sys"
Cohesion: 0.40
Nodes (5): main(), Claw Agent launcher - entry point for packaged executable. Sets up data paths…, Configure environment for packaged or portable run., _setup_packaged_env(), sys

### Community 63 - "_register_tools()"
Cohesion: 0.50
Nodes (4): extract_action_items(), Extract action items from email/thread text (simple heuristic)., Register all integration tools and knowledge tools., _register_tools()

## Knowledge Gaps
- **62 isolated node(s):** `nextConfig`, `name`, `version`, `private`, `dev` (+57 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 428 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **29 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `load_workflow()`, `_log_event()`, `ConversationMemory`, `models.py`, `create_app()`, `EmbeddingStore`, `init_db()`, `.run_workflow()`, `test_backend_orchestrator.py`, `asyncio`, `os`, `test_platform_models.py`, `test_event_gateway.py`, `Orchestrator`, `KnowledgeGraph`, `WorkflowEngine`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Why does `create_app()` connect `create_app()` to `main.py`, `_log_event()`, `models.py`, `secrets.py`, `EmbeddingStore`, `init_db()`, `test_backend_orchestrator.py`, `_now_iso()`, `test_platform_models.py`, `verify_webhook_signature()`, `_load_model_config()`, `TestServiceHealth`, `full_app()`, `test_event_gateway.py`, `get_session()`?**
  _High betweenness centrality (0.053) - this node is a cross-community bridge._
- **Why does `init_db()` connect `init_db()` to `load_workflow()`, `main.py`, `test_knowledge_tools.py`, `ConversationMemory`, `models.py`, `EmbeddingStore`, `test_backend_orchestrator.py`, `test_platform_models.py`, `full_app()`, `test_event_gateway.py`, `Orchestrator`, `WorkflowEngine`, `test_knowledge_graph.py`, `get_session()`?**
  _High betweenness centrality (0.037) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Are the 8 inferred relationships involving `EventBus` (e.g. with `run()` and `WorkflowEngine`) actually correct?**
  _`EventBus` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `nextConfig`, `name`, `version` to the rest of the system?**
  _62 weakly-connected nodes found - possible documentation gaps or missing edges._