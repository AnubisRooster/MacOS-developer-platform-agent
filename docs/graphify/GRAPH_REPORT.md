# Graph Report - MacOS-developer-platform-agent  (2026-10-05)

## Corpus Check
- 103 files · ~190,385 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1053 nodes · 2034 edges · 72 communities (38 shown, 34 thin omitted)
- Extraction: 93% EXTRACTED · 7% INFERRED · 0% AMBIGUOUS · INFERRED: 151 edges (avg confidence: 0.91)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ToolSchema
- create_app()
- EventBus
- package.json
- IronClawClient
- load_workflow()
- test_knowledge_tools.py
- main.py
- ConversationMemory
- secrets.py
- models.py
- _cosine_similarity()
- EmbeddingStore
- TestEnvironment
- test_redis_event_bus.py
- init_db()
- _register_tools()
- TestMacOSPaths
- test_platform_models.py
- test_platform_e2e.py
- app/page.tsx
- KnowledgeGraph
- compilerOptions
- types.py
- markets/page.tsx
- test_event_gateway.py
- gmail.py
- api.ts
- feeds/page.tsx
- jira_integration.py
- test_knowledge_graph.py
- confluence.py
- jenkins.py
- httpx
- fetchApi()
- launcher.py
- get_session()
- SlackCommandGateway
- RepositoryIntelligenceIndexer
- react
- TestDashboardAPI
- GitHubIndexer
- logs/page.tsx
- workflow-runs/page.tsx
- TestDashboardReadsWebhookData
- TestNodeOperations
- next.config.js
- start.sh
- TestSlackWebhook
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
9. `run()` - 23 edges
10. `ToolRegistry` - 23 edges

## Surprising Connections (you probably didn't know these)
- `TestWebhookToEventStore` --uses--> `Event`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py
- `TestGitHubWebhook` --uses--> `Event`  [INFERRED]
  tests/unit/test_event_gateway.py → backend/database/models.py
- `TestWorkflowTriggerPipeline` --uses--> `WorkflowRun`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py
- `TestWorkflowEngine` --uses--> `WorkflowRun`  [INFERRED]
  tests/unit/test_workflow_engine.py → backend/database/models.py
- `TestOrchestratorPipeline` --uses--> `ToolOutput`  [INFERRED]
  tests/integration/test_platform_e2e.py → backend/database/models.py

## Import Cycles
- None detected.

## Communities (72 total, 34 thin omitted)

### Community 0 - "ToolSchema"
Cohesion: 0.05
Nodes (16): Orchestrator, ToolEntry, ToolRegistry, ToolSchema, api_tools(), TestOrchestratorPipeline, ironclaw_mock(), orchestrator() (+8 more)

### Community 1 - "create_app()"
Cohesion: 0.06
Nodes (35): verify_webhook_signature(), create_app(), api_chat_delete(), api_chat_messages(), api_chat_sessions(), api_conversations(), api_document_detail(), api_documents() (+27 more)

### Community 2 - "EventBus"
Cohesion: 0.06
Nodes (13): EventBus, _consume(), _get_nested(), _render_template(), repl(), _resolve_args(), WorkflowEngine, handler() (+5 more)

### Community 3 - "package.json"
Cohesion: 0.05
Nodes (36): dependencies, next, react, react-dom, recharts, devDependencies, autoprefixer, postcss (+28 more)

### Community 4 - "IronClawClient"
Cohesion: 0.09
Nodes (7): IronClawClient, client(), TestHealth, TestInterpret, TestPlan, TestSelectTools, TestSummarize

### Community 5 - "load_workflow()"
Cohesion: 0.08
Nodes (12): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), WorkflowAction, WorkflowDefinition, TestWorkflowLoader, TestLoadAllWorkflows (+4 more)

### Community 6 - "test_knowledge_tools.py"
Cohesion: 0.06
Nodes (9): KnowledgeTools, _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions, TestSearch, TestTraceCommit (+1 more)

### Community 7 - "main.py"
Cohesion: 0.09
Nodes (13): _build_ironclaw(), cli(), index(), main(), _register_knowledge_tools(), reindex_embeddings(), run(), _start_cloudflared() (+5 more)

### Community 8 - "ConversationMemory"
Cohesion: 0.08
Nodes (11): ConversationMemory, env_secrets(), event_bus(), memory(), _reset_db_globals(), _reset_secrets_cache(), tmp_workflow_dir(), tool_registry() (+3 more)

### Community 9 - "secrets.py"
Cohesion: 0.10
Nodes (7): AppSecrets, get_secrets(), redact(), RedactingFilter, TestAppSecrets, TestRedact, TestRedactingFilter

### Community 10 - "models.py"
Cohesion: 0.10
Nodes (10): AgentConversation, AgentLog, AgentMemory, CachedSummary, ChatMessage, ChatSession, ToolOutput, api_chat_new() (+2 more)

### Community 11 - "_cosine_similarity()"
Cohesion: 0.09
Nodes (7): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), TestChunking, TestCosineSimilarity

### Community 13 - "EmbeddingStore"
Cohesion: 0.15
Nodes (6): Document, EmbeddingStore, TestKnowledgePipeline, _sqlite_in_memory(), TestEmbeddingStore, TestDocumentModel

### Community 15 - "test_redis_event_bus.py"
Cohesion: 0.13
Nodes (4): bus(), _no_redis(), TestEventBusFallback, handler()

### Community 16 - "init_db()"
Cohesion: 0.18
Nodes (7): Event, _get_database_url(), get_engine(), init_db(), TestDatabaseConnectivity, _use_sqlite(), TestEventModel

### Community 17 - "_register_tools()"
Cohesion: 0.19
Nodes (9): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), search_repos(), summarize_pull_request() (+1 more)

### Community 19 - "test_platform_models.py"
Cohesion: 0.17
Nodes (8): Base, Embedding, KnowledgeEdge, KnowledgeNode, _sqlite_in_memory(), TestAllTablesCreated, TestEmbeddingModel, TestKnowledgeGraphModels

### Community 20 - "test_platform_e2e.py"
Cohesion: 0.15
Nodes (3): WorkflowRun, TestWorkflowRunModel, _sqlite_in_memory()

### Community 21 - "app/page.tsx"
Cohesion: 0.16
Nodes (16): integrationNames, StatusPage(), StatusValue, toStatus(), ModelSelector(), PROVIDERS, Status, StatusCard() (+8 more)

### Community 22 - "KnowledgeGraph"
Cohesion: 0.15
Nodes (4): KnowledgeGraph, ConfluenceIndexer, JenkinsIndexer, JiraIndexer

### Community 23 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 24 - "types.py"
Cohesion: 0.17
Nodes (4): AgentEvent, EventSource, TestAgentEvent, TestEventSource

### Community 25 - "markets/page.tsx"
Cohesion: 0.21
Nodes (14): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+6 more)

### Community 26 - "test_event_gateway.py"
Cohesion: 0.13
Nodes (7): client(), _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook, TestJiraWebhook

### Community 27 - "gmail.py"
Cohesion: 0.20
Nodes (7): extract_action_items(), _get_credentials_path(), _get_service(), _get_token_path(), read_emails(), send_email(), summarize_thread()

### Community 29 - "api.ts"
Cohesion: 0.22
Nodes (12): ConversationsPage(), MessageBubble(), EventsPage(), payloadPreview(), Conversation, Event, fetchConversations(), fetchEvents() (+4 more)

### Community 30 - "feeds/page.tsx"
Cohesion: 0.21
Nodes (14): EmailRow(), FeedsPage(), LinkedInPost(), NotConfigured(), Tab, XPost(), EmailMessage, FeedPost (+6 more)

### Community 31 - "jira_integration.py"
Cohesion: 0.28
Nodes (6): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), update_ticket()

### Community 32 - "test_knowledge_graph.py"
Cohesion: 0.17
Nodes (4): graph(), _sqlite_in_memory(), TestEdgeOperations, TestGraphQueries

### Community 33 - "confluence.py"
Cohesion: 0.26
Nodes (5): _api(), create_page(), _get_config(), search_docs(), summarize_page()

### Community 34 - "jenkins.py"
Cohesion: 0.26
Nodes (5): _api(), fetch_build_logs(), get_build_status(), _get_config(), trigger_build()

### Community 35 - "httpx"
Cohesion: 0.27
Nodes (5): _api(), _get_token(), read_channel_history(), respond_to_command(), send_message()

### Community 36 - "fetchApi()"
Cohesion: 0.32
Nodes (11): ChatPage(), MessageBubble(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchApi(), fetchChatMessages() (+3 more)

### Community 37 - "launcher.py"
Cohesion: 0.18
Nodes (3): main(), _setup_packaged_env(), TestServiceHealth

### Community 38 - "get_session()"
Cohesion: 0.25
Nodes (3): get_session(), _upsert_document(), TestWebhookToEventStore

### Community 42 - "react"
Cohesion: 0.28
Nodes (7): ToolsPage(), WorkflowsPage(), fetchTools(), fetchWorkflows(), Tool, Workflow, react

### Community 45 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 46 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

## Knowledge Gaps
- **62 isolated node(s):** `nextConfig`, `name`, `version`, `private`, `dev` (+57 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 416 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **34 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `ToolSchema`, `create_app()`, `EventBus`, `ConversationMemory`, `models.py`, `os`, `EmbeddingStore`, `init_db()`, `test_platform_models.py`, `test_platform_e2e.py`, `KnowledgeGraph`, `test_event_gateway.py`?**
  _High betweenness centrality (0.060) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `nextConfig`, `name`, `version` to the rest of the system?**
  _62 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ToolSchema` be split into smaller, more focused modules?**
  _Cohesion score 0.050724637681159424 - nodes in this community are weakly interconnected._
- **Why does `create_app()` connect `create_app()` to `ToolSchema`, `EventBus`, `launcher.py`, `get_session()`, `main.py`, `secrets.py`, `models.py`, `EmbeddingStore`, `init_db()`, `test_platform_models.py`, `test_platform_e2e.py`, `test_event_gateway.py`?**
  _High betweenness centrality (0.052) - this node is a cross-community bridge._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Should `create_app()` be split into smaller, more focused modules?**
  _Cohesion score 0.05584415584415584 - nodes in this community are weakly interconnected._