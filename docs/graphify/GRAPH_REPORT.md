# Graph Report - MacOS-developer-platform-agent  (2026-09-14)

## Corpus Check
- 103 files · ~172,596 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1006 nodes · 1792 edges · 70 communities (46 shown, 19 thin omitted)
- Extraction: 92% EXTRACTED · 8% INFERRED · 0% AMBIGUOUS · INFERRED: 149 edges (avg confidence: 0.91)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- get_session()
- ToolSchema
- main.py
- KnowledgeGraph
- EmbeddingStore
- IronClawClient
- package.json
- KnowledgeTools
- secrets.py
- test_event_gateway.py
- TestMacOSPaths
- TestEventBusFallback
- EventBus
- TestEnvironment
- github_integration.py
- compilerOptions
- api.ts
- fetchApi()
- init_db()
- AgentEvent
- load_workflow()
- markets/page.tsx
- engine.py
- models.py
- Base
- TestServiceHealth
- test_platform_e2e.py
- ._dispatch_local()
- gmail.py
- jira_integration.py
- loader.py
- test_knowledge_graph.py
- confluence.py
- jenkins.py
- app/page.tsx
- SlackCommandGateway
- slack.py
- WorkflowEngine
- test_conversation_memory.py
- chat/page.tsx
- react
- ModelSelector.tsx
- load_all_workflows()
- logs/page.tsx
- workflow-runs/page.tsx
- TestNodeOperations
- _register_tools()
- next.config.js
- graphify_pipeline.py
- start.sh
- agent/__init__.py
- database/__init__.py
- events/__init__.py
- backend/__init__.py
- integrations/__init__.py
- knowledge/__init__.py
- security/__init__.py
- tools/__init__.py
- webhooks/__init__.py
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
4. `KnowledgeGraph` - 38 edges
5. `EventBus` - 30 edges
6. `_register_tools()` - 28 edges
7. `ToolSchema` - 25 edges
8. `EmbeddingStore` - 24 edges
9. `ToolRegistry` - 23 edges
10. `fetchApi()` - 22 edges

## Surprising Connections (you probably didn't know these)
- `memory()` --uses--> `ConversationMemory`  [INFERRED]
  tests/conftest.py → backend/agent/memory.py
- `memory()` --uses--> `ConversationMemory`  [INFERRED]
  tests/unit/test_conversation_memory.py → backend/agent/memory.py
- `orchestrator()` --uses--> `Orchestrator`  [INFERRED]
  tests/unit/test_backend_orchestrator.py → backend/agent/orchestrator.py
- `TestWebhookToEventStore` --uses--> `Event`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py
- `TestGitHubWebhook` --uses--> `Event`  [INFERRED]
  tests/unit/test_event_gateway.py → backend/database/models.py

## Import Cycles
- None detected.

## Communities (70 total, 19 thin omitted)

### Community 0 - "get_session()"
Cohesion: 0.05
Nodes (51): ChatMessage, ChatSession, get_session(), Verify webhook signature (HMAC-SHA256). - GitHub: X-Hub-Signature-256…, verify_webhook_signature(), create_app(), api_chat_delete(), api_chat_messages() (+43 more)

### Community 1 - "ToolSchema"
Cohesion: 0.05
Nodes (39): Any, Tool registry for the backend orchestrator. Registers tools with JSON Schema…, JSON Schema for a tool's parameters., Convert to OpenAPI/JSON Schema format for tool calls., Registered tool with handler and schema., Registry of tools available to the orchestrator., Register a tool by name., Get handler for a tool by name. (+31 more)

### Community 2 - "main.py"
Cohesion: 0.05
Nodes (48): ConversationMemory, Any, ConversationMemory - Backend conversation persistence via SQLAlchemy. Stores…, Persists and retrieves conversation messages from the database., Persist a conversation message., Retrieve recent messages for a conversation., Get messages in format suitable for LLM chat API., Orchestrator (+40 more)

### Community 3 - "KnowledgeGraph"
Cohesion: 0.06
Nodes (29): KnowledgeGraph, Any, Knowledge Graph - Engineering relationship graph stored in PostgreSQL. Node…, Add an edge. Returns True if created, False if already exists., Get neighboring nodes. direction: out, in, both., Trace a commit through the graph: commit → PR → Jira issues → repo., Find documentation nodes related to any entity., Find a repository node by name or external ID. (+21 more)

### Community 4 - "EmbeddingStore"
Cohesion: 0.07
Nodes (30): Document, Embedding, Ingested document from any source (code, PR, Jira, Confluence, Jenkins)., Vector embedding for semantic search. Uses pgvector on PostgreSQL, JSON array…, _chunk_text(), _cosine_similarity(), EmbeddingStore, get_embeddings() (+22 more)

### Community 5 - "IronClawClient"
Cohesion: 0.08
Nodes (19): AsyncClient, IronClawClient, Any, IronClawClient - HTTP client for IronClaw Rust reasoning engine. IronClaw runs…, Interpret user message. Returns: - content: str (assistant text) - tool_calls:…, Decompose a goal into an ordered list of steps with tool selections. Returns: -…, Given a task description and available tools, select the best tools to use.…, Summarize text. Uses IronClaw or OpenRouter. (+11 more)

### Community 6 - "package.json"
Cohesion: 0.05
Nodes (35): dependencies, next, react, react-dom, recharts, devDependencies, autoprefixer, postcss (+27 more)

### Community 7 - "KnowledgeTools"
Cohesion: 0.06
Nodes (20): KnowledgeTools, Any, Knowledge query tools that can be registered in the capability registry., Semantic search across all indexed engineering documents., Find a repository and its relationships (files, pipelines, engineers)., Trace a commit through PRs, Jira issues, and modified files., Find documentation related to a repository, file, or issue., Explain a system or component by combining graph data and document search.… (+12 more)

### Community 8 - "secrets.py"
Cohesion: 0.11
Nodes (15): AppSecrets, get_secrets(), Backend secrets management, webhook verification, and redaction. Uses pydantic-…, Logging filter that redacts secrets from log records., Application secrets loaded from environment., Return cached AppSecrets instance., Redact known secret patterns from text., redact() (+7 more)

### Community 9 - "test_event_gateway.py"
Cohesion: 0.08
Nodes (11): client(), fixture, Unit tests for the Event Gateway (webhook server)., _sqlite_in_memory(), TestDashboardAPI, TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint (+3 more)

### Community 10 - "TestMacOSPaths"
Cohesion: 0.09
Nodes (11): deployment, Deployment tests: verify all path handling is macOS-compatible., Verify backend/main.py uses start_new_session for subprocess management., Verify the database module can create data directories on macOS., Verify workflow directory glob works on macOS., Verify the packaged launcher falls back to ~/Library/Application Support., Scan all .py files for hardcoded Windows-specific paths., Ensure no CREATE_NEW_PROCESS_GROUP or other Windows-only subprocess flags. (+3 more)

### Community 11 - "TestEventBusFallback"
Cohesion: 0.13
Nodes (8): bus(), _no_redis(), asyncio, fixture, Unit tests for the Redis-backed Event Bus (in-memory fallback mode)., Test in-memory fallback when Redis is unavailable., TestEventBusFallback, handler()

### Community 12 - "EventBus"
Cohesion: 0.13
Nodes (11): Workflow execution records., WorkflowRun, EventBus, Async event bus with Redis stream backing and wildcard subscription support.…, EventHandler, TestWorkflowTriggerPipeline, asyncio, fixture (+3 more)

### Community 13 - "TestEnvironment"
Cohesion: 0.11
Nodes (4): deployment, Deployment tests: verify environment, dependencies, and configuration., TestEnvironment, TestWindowsCompatibility

### Community 14 - "github_integration.py"
Cohesion: 0.19
Nodes (17): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), Any, GitHub integration - create_issue, summarize_pull_request, comment_on_pr,… (+9 more)

### Community 15 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 16 - "api.ts"
Cohesion: 0.19
Nodes (13): EventsPage(), payloadPreview(), ToolsPage(), WorkflowsPage(), Event, fetchEvents(), fetchTools(), fetchWorkflows() (+5 more)

### Community 17 - "fetchApi()"
Cohesion: 0.17
Nodes (12): FeedsPage(), Tab, EmailMessage, FeedPost, FeedResponse, fetchApi(), fetchIntegrationsConfig(), fetchLinkedInFeed() (+4 more)

### Community 18 - "init_db()"
Cohesion: 0.22
Nodes (7): Event, init_db(), Standardized event from any webhook or internal source., deployment, TestDatabaseConnectivity, TestEventModel, TestWorkflowRunModel

### Community 19 - "AgentEvent"
Cohesion: 0.18
Nodes (9): AgentEvent, EventSource, Event types for the backend event bus., Event payload for the event bus., Enum, str, Unit tests for EventSource and AgentEvent., TestAgentEvent (+1 more)

### Community 20 - "load_workflow()"
Cohesion: 0.18
Nodes (5): load_workflow(), TestWorkflowLoader, Test loading the actual project workflow files., TestLoadProjectWorkflows, TestLoadWorkflow

### Community 21 - "markets/page.tsx"
Cohesion: 0.18
Nodes (14): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+6 more)

### Community 22 - "engine.py"
Cohesion: 0.23
Nodes (11): AgentLog, Structured agent logs for all events, workflows, and decisions., Event Bus with Redis backing and in-memory fallback. Supports wildcard topic…, _get_nested(), _log_to_db(), Any, WorkflowEngine - Loads YAML workflows, subscribes to EventBus triggers,…, _render_template() (+3 more)

### Community 23 - "models.py"
Cohesion: 0.16
Nodes (10): AgentMemory, CachedSummary, _get_database_url(), get_engine(), SQLAlchemy ORM models for the Developer AI Platform. Includes: Event Store,…, Persistent key-value memory for the agent., Cache for summarized content., fixture (+2 more)

### Community 24 - "Base"
Cohesion: 0.23
Nodes (11): Base, KnowledgeEdge, KnowledgeNode, Node in the engineering knowledge graph., Edge (relationship) in the engineering knowledge graph., DeclarativeBase, fixture, Unit tests for the enhanced platform database models. (+3 more)

### Community 25 - "TestServiceHealth"
Cohesion: 0.15
Nodes (8): main(), Claw Agent launcher - entry point for packaged executable. Sets up data paths…, Configure environment for packaged or portable run., _setup_packaged_env(), deployment, fixture, Deployment tests: verify services can start and respond to health checks., TestServiceHealth

### Community 26 - "test_platform_e2e.py"
Cohesion: 0.16
Nodes (8): client(), full_app(), fixture, Integration tests for the Developer AI Platform. Tests end-to-end flows: -…, Create app with event bus and workflow engine wired up., Minimal app, no orchestrator., _sqlite_in_memory(), TestDashboardReadsWebhookData

### Community 27 - "._dispatch_local()"
Cohesion: 0.19
Nodes (6): _consume(), Any, Dispatch event to all matching local handlers., Start consuming events from Redis stream in background., Lazily connect to Redis., Publish an event to Redis stream and invoke local handlers. Event must have…

### Community 28 - "gmail.py"
Cohesion: 0.24
Nodes (12): _get_credentials_path(), _get_service(), _get_token_path(), Any, Path, Gmail integration - read_emails, summarize_thread, send_email,…, Get Gmail API service (lazy import)., Read emails matching query. (+4 more)

### Community 29 - "jira_integration.py"
Cohesion: 0.28
Nodes (12): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), Any, Jira integration - create_ticket, update_ticket, link_github_issue,…, Create a Jira ticket. (+4 more)

### Community 30 - "loader.py"
Cohesion: 0.21
Nodes (10): _parse_actions(), _parse_trigger(), Any, Workflow loader - load YAML workflow definitions from disk. Supports the new…, Single action in a workflow., Parse trigger from YAML. Supports: trigger: "github.pull_request.opened"…, Parse action list. Supports dict format and plain string (tool name only)., WorkflowAction (+2 more)

### Community 31 - "test_knowledge_graph.py"
Cohesion: 0.17
Nodes (6): graph(), fixture, Unit tests for the Knowledge Graph., _sqlite_in_memory(), TestEdgeOperations, TestGraphQueries

### Community 32 - "confluence.py"
Cohesion: 0.26
Nodes (11): _api(), create_page(), _get_config(), Any, Confluence integration - search_docs, summarize_page, create_page., Call Confluence REST API., Search Confluence using CQL., Fetch a page and return a text summary (title + body excerpt). (+3 more)

### Community 33 - "jenkins.py"
Cohesion: 0.26
Nodes (11): _api(), fetch_build_logs(), get_build_status(), _get_config(), Any, Jenkins integration - trigger_build, get_build_status, fetch_build_logs., Call Jenkins API (crumb may be required)., Trigger a Jenkins build. Returns build queue info. (+3 more)

### Community 34 - "app/page.tsx"
Cohesion: 0.23
Nodes (10): integrationNames, StatusPage(), StatusValue, toStatus(), Status, StatusCard(), StatusCardProps, statusDotClass() (+2 more)

### Community 35 - "SlackCommandGateway"
Cohesion: 0.20
Nodes (6): Any, SlackCommandGateway - Handles Slack app_mention events, routes to orchestrator.…, Handles Slack app_mention events and routes to orchestrator., Register app_mention handler on the Slack Bolt app. Expects app to have…, Process a message and return the response. Used when the gateway is called…, SlackCommandGateway

### Community 36 - "slack.py"
Cohesion: 0.27
Nodes (10): _api(), _get_token(), Any, Slack integration - send_message, read_channel_history, respond_to_command., Send a message to a channel (optionally in a thread)., Read recent messages from a channel., Respond to a Slack slash command using the response_url., read_channel_history() (+2 more)

### Community 37 - "WorkflowEngine"
Cohesion: 0.25
Nodes (6): Path, Executes YAML-defined workflows triggered by events., WorkflowEngine, Workflow definition from YAML., WorkflowDefinition, TestWorkflowDefinition

### Community 38 - "test_conversation_memory.py"
Cohesion: 0.20
Nodes (5): memory(), fixture, Unit tests for backend ConversationMemory., _sqlite_in_memory(), TestConversationMemory

### Community 39 - "chat/page.tsx"
Cohesion: 0.31
Nodes (8): ChatPage(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchChatMessages(), fetchChatSessions(), sendChatMessage()

### Community 40 - "react"
Cohesion: 0.33
Nodes (5): ConversationsPage(), Conversation, fetchConversations(), Message, react

### Community 41 - "ModelSelector.tsx"
Cohesion: 0.38
Nodes (6): ModelSelector(), PROVIDERS, AvailableModel, fetchModelConfig(), ModelConfig, updateModelConfig()

### Community 42 - "load_all_workflows()"
Cohesion: 0.47
Nodes (3): load_all_workflows(), Path, TestLoadAllWorkflows

### Community 43 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 44 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

### Community 46 - "_register_tools()"
Cohesion: 0.50
Nodes (4): extract_action_items(), Extract action items from email/thread text (simple heuristic)., Register all integration tools and knowledge tools., _register_tools()

## Knowledge Gaps
- **62 isolated node(s):** `nextConfig`, `name`, `version`, `private`, `dev` (+57 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 401 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **19 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `init_db()` connect `init_db()` to `ToolSchema`, `main.py`, `KnowledgeGraph`, `EmbeddingStore`, `test_conversation_memory.py`, `KnowledgeTools`, `test_event_gateway.py`, `EventBus`, `models.py`, `Base`, `test_platform_e2e.py`, `test_knowledge_graph.py`?**
  _High betweenness centrality (0.081) - this node is a cross-community bridge._
- **Why does `create_app()` connect `get_session()` to `ToolSchema`, `main.py`, `EmbeddingStore`, `secrets.py`, `test_event_gateway.py`, `EventBus`, `init_db()`, `engine.py`, `Base`, `TestServiceHealth`, `test_platform_e2e.py`?**
  _High betweenness centrality (0.071) - this node is a cross-community bridge._
- **Why does `get_session()` connect `get_session()` to `ToolSchema`, `main.py`, `KnowledgeGraph`, `EmbeddingStore`, `test_event_gateway.py`, `EventBus`, `init_db()`, `engine.py`, `models.py`, `Base`, `test_platform_e2e.py`?**
  _High betweenness centrality (0.067) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Are the 8 inferred relationships involving `EventBus` (e.g. with `run()` and `WorkflowEngine`) actually correct?**
  _`EventBus` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `nextConfig`, `name`, `version` to the rest of the system?**
  _62 weakly-connected nodes found - possible documentation gaps or missing edges._