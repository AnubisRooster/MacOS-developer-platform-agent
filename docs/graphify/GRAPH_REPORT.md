# Graph Report - MacOS-developer-platform-agent  (2026-09-07)

## Corpus Check
- 103 files · ~172,597 words
- Verdict: corpus is large enough that graph structure adds value.

## Summary
- 948 nodes · 1715 edges · 74 communities (47 shown, 22 thin omitted)
- Extraction: 90% EXTRACTED · 10% INFERRED · 0% AMBIGUOUS · INFERRED: 172 edges (avg confidence: 0.91)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ToolSchema
- EventBus
- load_workflow()
- IronClawClient
- package.json
- verify_webhook_signature()
- main.py
- WorkflowEngine
- models.py
- get_session()
- KnowledgeGraph
- test_knowledge_tools.py
- TestMacOSPaths
- Base
- init_db()
- TestEnvironment
- github_integration.py
- compilerOptions
- test_embeddings.py
- api.ts
- fetchApi()
- EmbeddingStore
- AgentEvent
- KnowledgeTools
- Any
- markets/page.tsx
- test_event_gateway.py
- ConversationMemory
- TestServiceHealth
- test_knowledge_graph.py
- gmail.py
- jira_integration.py
- embeddings.py
- confluence.py
- jenkins.py
- RepositoryIntelligenceIndexer
- app/page.tsx
- slack.py
- test_conversation_memory.py
- SlackCommandGateway
- chat/page.tsx
- test_platform_e2e.py
- react
- ModelSelector.tsx
- TestDashboardAPI
- logs/page.tsx
- workflow-runs/page.tsx
- TestDashboardReadsWebhookData
- _register_tools()
- TestGraphQueries
- next.config.js
- graphify_pipeline.py
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
- workflows/__init__.py
- next-env.d.ts
- build.sh
- setup.sh
- stop.sh
- test.sh

## God Nodes (most connected - your core abstractions)
1. `get_session()` - 52 edges
2. `init_db()` - 45 edges
3. `KnowledgeGraph` - 38 edges
4. `EventBus` - 30 edges
5. `_register_tools()` - 28 edges
6. `ToolSchema` - 25 edges
7. `create_app()` - 25 edges
8. `EmbeddingStore` - 24 edges
9. `run()` - 23 edges
10. `ToolRegistry` - 23 edges

## Surprising Connections (you probably didn't know these)
- `memory()` --uses--> `ConversationMemory`  [INFERRED]
  tests/conftest.py → backend/agent/memory.py
- `memory()` --uses--> `ConversationMemory`  [INFERRED]
  tests/unit/test_conversation_memory.py → backend/agent/memory.py
- `TestWebhookToEventStore` --uses--> `Event`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py
- `TestGitHubWebhook` --uses--> `Event`  [INFERRED]
  tests/unit/test_event_gateway.py → backend/database/models.py
- `TestWorkflowTriggerPipeline` --uses--> `WorkflowRun`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py

## Import Cycles
- None detected.

## Communities (74 total, 22 thin omitted)

### Community 0 - "ToolSchema"
Cohesion: 0.05
Nodes (37): Orchestrator, Any, Execute a registered tool and return its result., Backend orchestrator with IronClaw client and tool registry., Build message list from history + new user message., Process user message: send to IronClaw, parse tool calls, execute, persist.…, Register knowledge query tools in the capability registry., _register_knowledge_tools() (+29 more)

### Community 1 - "EventBus"
Cohesion: 0.06
Nodes (28): EventBus, Any, Event Bus with Redis backing and in-memory fallback. Supports wildcard topic…, Dispatch event to all matching local handlers., Start consuming events from Redis stream in background., Async event bus with Redis stream backing and wildcard subscription support.…, Lazily connect to Redis., Publish an event to Redis stream and invoke local handlers. Event must have… (+20 more)

### Community 2 - "load_workflow()"
Cohesion: 0.08
Nodes (21): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), Any, Path, Workflow loader - load YAML workflow definitions from disk. Supports the new…, Single action in a workflow. (+13 more)

### Community 3 - "IronClawClient"
Cohesion: 0.08
Nodes (19): AsyncClient, IronClawClient, Any, IronClawClient - HTTP client for IronClaw Rust reasoning engine. IronClaw runs…, Interpret user message. Returns: - content: str (assistant text) - tool_calls:…, Decompose a goal into an ordered list of steps with tool selections. Returns: -…, Given a task description and available tools, select the best tools to use.…, Summarize text. Uses IronClaw or OpenRouter. (+11 more)

### Community 4 - "package.json"
Cohesion: 0.05
Nodes (36): dependencies, next, react, react-dom, recharts, devDependencies, autoprefixer, postcss (+28 more)

### Community 5 - "verify_webhook_signature()"
Cohesion: 0.09
Nodes (15): AppSecrets, Logging filter that redacts secrets from log records., Application secrets loaded from environment., Redact known secret patterns from text., Verify webhook signature (HMAC-SHA256). - GitHub: X-Hub-Signature-256…, redact(), RedactingFilter, verify_webhook_signature() (+7 more)

### Community 6 - "main.py"
Cohesion: 0.12
Nodes (25): _build_ironclaw(), cli(), index(), main(), Path, Developer AI Platform (macOS) - Backend CLI entry point. Commands: run - Full…, Launch IronClaw as a child process and wait until its health endpoint responds., Launch cloudflared tunnel as a child process. The tunnel connects to Cloudflare… (+17 more)

### Community 7 - "WorkflowEngine"
Cohesion: 0.14
Nodes (18): AgentLog, Structured agent logs for all events, workflows, and decisions., Workflow execution records., WorkflowRun, _get_nested(), _log_to_db(), Any, WorkflowEngine - Loads YAML workflows, subscribes to EventBus triggers,… (+10 more)

### Community 8 - "models.py"
Cohesion: 0.13
Nodes (20): AgentConversation, CachedSummary, ChatMessage, ChatSession, _get_database_url(), SQLAlchemy ORM models for the Developer AI Platform. Includes: Event Store,…, Conversation messages for persistence and context., Cache for summarized content. (+12 more)

### Community 9 - "get_session()"
Cohesion: 0.16
Nodes (13): Store tool output in database., get_session(), Create or update a document. Returns doc_id., _upsert_document(), _log_event(), _persist_event(), Any, Store event in the database. Returns the row id. (+5 more)

### Community 10 - "KnowledgeGraph"
Cohesion: 0.13
Nodes (12): KnowledgeGraph, Get graph statistics., Interface over the PostgreSQL-backed knowledge graph., ConfluenceIndexer, GitHubIndexer, JenkinsIndexer, JiraIndexer, Repository Intelligence Indexer. Ingests data from GitHub, Jira, Confluence,… (+4 more)

### Community 11 - "test_knowledge_tools.py"
Cohesion: 0.09
Nodes (11): asyncio, fixture, Unit tests for KnowledgeTools (query tools for IronClaw)., _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions (+3 more)

### Community 12 - "TestMacOSPaths"
Cohesion: 0.09
Nodes (11): deployment, Deployment tests: verify all path handling is macOS-compatible., Verify backend/main.py uses start_new_session for subprocess management., Verify the database module can create data directories on macOS., Verify workflow directory glob works on macOS., Verify the packaged launcher falls back to ~/Library/Application Support., Scan all .py files for hardcoded Windows-specific paths., Ensure no CREATE_NEW_PROCESS_GROUP or other Windows-only subprocess flags. (+3 more)

### Community 13 - "Base"
Cohesion: 0.15
Nodes (15): AgentMemory, Base, KnowledgeEdge, KnowledgeNode, Persistent key-value memory for the agent., Node in the engineering knowledge graph., Edge (relationship) in the engineering knowledge graph., Knowledge Graph - Engineering relationship graph stored in PostgreSQL. Node… (+7 more)

### Community 14 - "init_db()"
Cohesion: 0.19
Nodes (10): Event, get_engine(), init_db(), Standardized event from any webhook or internal source., deployment, fixture, Deployment tests: verify database can connect and create schema., TestDatabaseConnectivity (+2 more)

### Community 15 - "TestEnvironment"
Cohesion: 0.11
Nodes (4): deployment, Deployment tests: verify environment, dependencies, and configuration., TestEnvironment, TestWindowsCompatibility

### Community 16 - "github_integration.py"
Cohesion: 0.19
Nodes (17): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), Any, GitHub integration - create_issue, summarize_pull_request, comment_on_pr,… (+9 more)

### Community 17 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 18 - "test_embeddings.py"
Cohesion: 0.17
Nodes (9): _chunk_text(), _cosine_similarity(), Split text into overlapping chunks., Compute cosine similarity between two vectors., fixture, Unit tests for the Embedding Store (in-memory cosine similarity)., _sqlite_in_memory(), TestChunking (+1 more)

### Community 19 - "api.ts"
Cohesion: 0.19
Nodes (13): EventsPage(), payloadPreview(), ToolsPage(), WorkflowsPage(), Event, fetchEvents(), fetchTools(), fetchWorkflows() (+5 more)

### Community 20 - "fetchApi()"
Cohesion: 0.17
Nodes (12): FeedsPage(), Tab, EmailMessage, FeedPost, FeedResponse, fetchApi(), fetchIntegrationsConfig(), fetchLinkedInFeed() (+4 more)

### Community 21 - "EmbeddingStore"
Cohesion: 0.23
Nodes (10): Document, Embedding, Ingested document from any source (code, PR, Jira, Confluence, Jenkins)., Vector embedding for semantic search. Uses pgvector on PostgreSQL, JSON array…, EmbeddingStore, Manages document embeddings for semantic search., Generate and store embeddings for a document. If text is not provided, reads…, Index all unindexed documents. Returns stats. (+2 more)

### Community 22 - "AgentEvent"
Cohesion: 0.18
Nodes (9): AgentEvent, EventSource, Event types for the backend event bus., Event payload for the event bus., Enum, str, Unit tests for EventSource and AgentEvent., TestAgentEvent (+1 more)

### Community 23 - "KnowledgeTools"
Cohesion: 0.17
Nodes (9): KnowledgeTools, Any, Knowledge query tools that can be registered in the capability registry., Semantic search across all indexed engineering documents., Find a repository and its relationships (files, pipelines, engineers)., Trace a commit through PRs, Jira issues, and modified files., Find documentation related to a repository, file, or issue., Explain a system or component by combining graph data and document search.… (+1 more)

### Community 24 - "Any"
Cohesion: 0.20
Nodes (7): Any, Add an edge. Returns True if created, False if already exists., Get neighboring nodes. direction: out, in, both., Trace a commit through the graph: commit → PR → Jira issues → repo., Find documentation nodes related to any entity., Find a repository node by name or external ID., Create or update a node. Returns node_id.

### Community 25 - "markets/page.tsx"
Cohesion: 0.20
Nodes (13): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+5 more)

### Community 26 - "test_event_gateway.py"
Cohesion: 0.14
Nodes (9): client(), fixture, Unit tests for the Event Gateway (webhook server)., _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook (+1 more)

### Community 27 - "ConversationMemory"
Cohesion: 0.16
Nodes (8): ConversationMemory, Any, ConversationMemory - Backend conversation persistence via SQLAlchemy. Stores…, Persists and retrieves conversation messages from the database., Persist a conversation message., Retrieve recent messages for a conversation., Get messages in format suitable for LLM chat API., Backend Orchestrator - Coordinates IronClaw/LLM and tools, persists…

### Community 28 - "TestServiceHealth"
Cohesion: 0.15
Nodes (8): main(), Claw Agent launcher - entry point for packaged executable. Sets up data paths…, Configure environment for packaged or portable run., _setup_packaged_env(), deployment, fixture, Deployment tests: verify services can start and respond to health checks., TestServiceHealth

### Community 29 - "test_knowledge_graph.py"
Cohesion: 0.15
Nodes (6): graph(), fixture, Unit tests for the Knowledge Graph., _sqlite_in_memory(), TestEdgeOperations, TestNodeOperations

### Community 30 - "gmail.py"
Cohesion: 0.24
Nodes (12): _get_credentials_path(), _get_service(), _get_token_path(), Any, Path, Gmail integration - read_emails, summarize_thread, send_email,…, Get Gmail API service (lazy import)., Read emails matching query. (+4 more)

### Community 31 - "jira_integration.py"
Cohesion: 0.28
Nodes (12): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), Any, Jira integration - create_ticket, update_ticket, link_github_issue,…, Create a Jira ticket. (+4 more)

### Community 32 - "embeddings.py"
Cohesion: 0.18
Nodes (10): get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), Any, Embedding Store - Semantic search using pgvector on PostgreSQL (JSON array…, Semantic search across all indexed documents. Returns ranked results with…, Get embeddings from OpenAI-compatible API (OpenAI or OpenRouter)., Get embeddings from a local Ollama instance. (+2 more)

### Community 33 - "confluence.py"
Cohesion: 0.26
Nodes (11): _api(), create_page(), _get_config(), Any, Confluence integration - search_docs, summarize_page, create_page., Call Confluence REST API., Search Confluence using CQL., Fetch a page and return a text summary (title + body excerpt). (+3 more)

### Community 34 - "jenkins.py"
Cohesion: 0.26
Nodes (11): _api(), fetch_build_logs(), get_build_status(), _get_config(), Any, Jenkins integration - trigger_build, get_build_status, fetch_build_logs., Call Jenkins API (crumb may be required)., Trigger a Jenkins build. Returns build queue info. (+3 more)

### Community 35 - "RepositoryIntelligenceIndexer"
Cohesion: 0.23
Nodes (6): _github_headers(), Any, Orchestrates all indexers for a full reindex., Run all indexers. github_repos format: ['owner/repo', ...], Index a repository: metadata, files (tree), recent commits, open PRs., RepositoryIntelligenceIndexer

### Community 36 - "app/page.tsx"
Cohesion: 0.23
Nodes (10): integrationNames, StatusPage(), StatusValue, toStatus(), Status, StatusCard(), StatusCardProps, statusDotClass() (+2 more)

### Community 37 - "slack.py"
Cohesion: 0.27
Nodes (10): _api(), _get_token(), Any, Slack integration - send_message, read_channel_history, respond_to_command., Send a message to a channel (optionally in a thread)., Read recent messages from a channel., Respond to a Slack slash command using the response_url., read_channel_history() (+2 more)

### Community 38 - "test_conversation_memory.py"
Cohesion: 0.20
Nodes (5): memory(), fixture, Unit tests for backend ConversationMemory., _sqlite_in_memory(), TestConversationMemory

### Community 39 - "SlackCommandGateway"
Cohesion: 0.22
Nodes (6): Any, SlackCommandGateway - Handles Slack app_mention events, routes to orchestrator.…, Handles Slack app_mention events and routes to orchestrator., Register app_mention handler on the Slack Bolt app. Expects app to have…, Process a message and return the response. Used when the gateway is called…, SlackCommandGateway

### Community 40 - "chat/page.tsx"
Cohesion: 0.31
Nodes (8): ChatPage(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchChatMessages(), fetchChatSessions(), sendChatMessage()

### Community 41 - "test_platform_e2e.py"
Cohesion: 0.28
Nodes (8): client(), full_app(), fixture, Integration tests for the Developer AI Platform. Tests end-to-end flows: -…, Create app with event bus and workflow engine wired up., Minimal app, no orchestrator., _sqlite_in_memory(), TestWorkflowTriggerPipeline

### Community 42 - "react"
Cohesion: 0.33
Nodes (5): ConversationsPage(), Conversation, fetchConversations(), Message, react

### Community 43 - "ModelSelector.tsx"
Cohesion: 0.38
Nodes (6): ModelSelector(), PROVIDERS, AvailableModel, fetchModelConfig(), ModelConfig, updateModelConfig()

### Community 45 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 46 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

### Community 48 - "_register_tools()"
Cohesion: 0.50
Nodes (4): extract_action_items(), Extract action items from email/thread text (simple heuristic)., Register all integration tools and knowledge tools., _register_tools()

## Knowledge Gaps
- **62 isolated node(s):** `nextConfig`, `name`, `version`, `private`, `dev` (+57 more)
  These have ≤1 connection - possible missing edges or undocumented components. (Counts symbols only; 377 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **22 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `init_db()` connect `init_db()` to `ToolSchema`, `main.py`, `test_conversation_memory.py`, `models.py`, `test_platform_e2e.py`, `get_session()`, `test_knowledge_tools.py`, `WorkflowEngine`, `Base`, `test_embeddings.py`, `EmbeddingStore`, `test_event_gateway.py`, `test_knowledge_graph.py`?**
  _High betweenness centrality (0.083) - this node is a cross-community bridge._
- **Why does `EventBus` connect `EventBus` to `main.py`, `WorkflowEngine`, `test_platform_e2e.py`, `get_session()`, `TestServiceHealth`?**
  _High betweenness centrality (0.065) - this node is a cross-community bridge._
- **Why does `KnowledgeGraph` connect `KnowledgeGraph` to `embeddings.py`, `RepositoryIntelligenceIndexer`, `main.py`, `test_platform_e2e.py`, `get_session()`, `test_knowledge_tools.py`, `Base`, `init_db()`, `KnowledgeTools`, `Any`, `test_knowledge_graph.py`?**
  _High betweenness centrality (0.061) - this node is a cross-community bridge._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Are the 32 inferred relationships involving `Session` (e.g. with `.add_message()` and `.get_messages()`) actually correct?**
  _`Session` has 32 INFERRED edges - model-reasoned connections that need verification._
- **Are the 8 inferred relationships involving `EventBus` (e.g. with `run()` and `WorkflowEngine`) actually correct?**
  _`EventBus` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `nextConfig`, `name`, `version` to the rest of the system?**
  _62 weakly-connected nodes found - possible documentation gaps or missing edges._