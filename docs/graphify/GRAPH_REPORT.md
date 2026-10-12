# Graph Report - MacOS-developer-platform-agent  (2026-10-12)

## Corpus Check
- 103 files · ~189,940 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1053 nodes · 2058 edges · 75 communities (42 shown, 33 thin omitted)
- Extraction: 91% EXTRACTED · 9% INFERRED · 0% AMBIGUOUS · INFERRED: 175 edges (avg confidence: 0.91)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- KnowledgeGraph
- get_session()
- models.py
- package.json
- IronClawClient
- load_workflow()
- ConversationMemory
- secrets.py
- EventBus
- _cosine_similarity()
- ToolSchema
- test_platform_models.py
- init_db()
- test_knowledge_tools.py
- EmbeddingStore
- verify_webhook_signature()
- test_platform_e2e.py
- TestEnvironment
- test_redis_event_bus.py
- _register_tools()
- TestMacOSPaths
- main.py
- app/page.tsx
- KnowledgeTools
- compilerOptions
- test_knowledge_graph.py
- types.py
- bus.py
- markets/page.tsx
- test_event_gateway.py
- gmail.py
- api.ts
- feeds/page.tsx
- Orchestrator
- run()
- jira_integration.py
- confluence.py
- jenkins.py
- httpx
- fetchApi()
- launcher.py
- .run_workflow()
- asyncio
- test_backend_orchestrator.py
- SlackCommandGateway
- react
- ToolRegistry
- TestDashboardAPI
- logs/page.tsx
- workflow-runs/page.tsx
- TestDashboardReadsWebhookData
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
6. `_register_tools()` - 29 edges
7. `run()` - 26 edges
8. `ToolSchema` - 25 edges
9. `EmbeddingStore` - 24 edges
10. `ToolRegistry` - 23 edges

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

## Communities (75 total, 33 thin omitted)

### Community 0 - "KnowledgeGraph"
Cohesion: 0.07
Nodes (8): KnowledgeGraph, ConfluenceIndexer, _github_headers(), GitHubIndexer, JenkinsIndexer, JiraIndexer, RepositoryIntelligenceIndexer, _upsert_document()

### Community 1 - "get_session()"
Cohesion: 0.07
Nodes (29): ChatMessage, ChatSession, get_session(), create_app(), api_chat_delete(), api_chat_messages(), api_chat_new(), api_chat_send() (+21 more)

### Community 2 - "models.py"
Cohesion: 0.09
Nodes (5): AgentConversation, AgentLog, CachedSummary, ToolOutput, _log_to_db()

### Community 3 - "package.json"
Cohesion: 0.05
Nodes (36): dependencies, next, react, react-dom, recharts, devDependencies, autoprefixer, postcss (+28 more)

### Community 4 - "IronClawClient"
Cohesion: 0.09
Nodes (7): IronClawClient, client(), TestHealth, TestInterpret, TestPlan, TestSelectTools, TestSummarize

### Community 5 - "load_workflow()"
Cohesion: 0.08
Nodes (12): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), WorkflowAction, WorkflowDefinition, TestWorkflowLoader, TestLoadAllWorkflows (+4 more)

### Community 6 - "ConversationMemory"
Cohesion: 0.08
Nodes (11): ConversationMemory, env_secrets(), event_bus(), memory(), _reset_db_globals(), _reset_secrets_cache(), tmp_workflow_dir(), tool_registry() (+3 more)

### Community 7 - "secrets.py"
Cohesion: 0.10
Nodes (7): AppSecrets, get_secrets(), redact(), RedactingFilter, TestAppSecrets, TestRedact, TestRedactingFilter

### Community 8 - "EventBus"
Cohesion: 0.10
Nodes (4): EventBus, _consume(), TestWorkflowTriggerPipeline, TestWorkflowEngine

### Community 9 - "_cosine_similarity()"
Cohesion: 0.10
Nodes (7): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), TestChunking, TestCosineSimilarity

### Community 10 - "ToolSchema"
Cohesion: 0.13
Nodes (4): ToolEntry, ToolSchema, TestToolEntry, TestToolSchema

### Community 11 - "test_platform_models.py"
Cohesion: 0.14
Nodes (9): AgentMemory, Base, KnowledgeEdge, KnowledgeNode, WorkflowRun, _sqlite_in_memory(), TestAllTablesCreated, TestKnowledgeGraphModels (+1 more)

### Community 12 - "init_db()"
Cohesion: 0.15
Nodes (7): Event, _get_database_url(), get_engine(), init_db(), TestDatabaseConnectivity, _use_sqlite(), TestEventModel

### Community 13 - "test_knowledge_tools.py"
Cohesion: 0.09
Nodes (8): _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions, TestSearch, TestTraceCommit, tools()

### Community 14 - "EmbeddingStore"
Cohesion: 0.16
Nodes (8): Document, Embedding, EmbeddingStore, TestKnowledgePipeline, _sqlite_in_memory(), TestEmbeddingStore, TestDocumentModel, TestEmbeddingModel

### Community 15 - "verify_webhook_signature()"
Cohesion: 0.16
Nodes (12): verify_webhook_signature(), github_webhook(), gmail_webhook(), health(), jenkins_webhook(), jira_webhook(), slack_webhook(), _log_event() (+4 more)

### Community 16 - "test_platform_e2e.py"
Cohesion: 0.13
Nodes (4): client(), full_app(), _sqlite_in_memory(), _sqlite_in_memory()

### Community 18 - "test_redis_event_bus.py"
Cohesion: 0.13
Nodes (4): bus(), _no_redis(), TestEventBusFallback, handler()

### Community 19 - "_register_tools()"
Cohesion: 0.19
Nodes (9): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), search_repos(), summarize_pull_request() (+1 more)

### Community 21 - "main.py"
Cohesion: 0.16
Nodes (6): cli(), main(), _start_cloudflared(), _start_ironclaw(), _stop_all_children(), _stop_child()

### Community 22 - "app/page.tsx"
Cohesion: 0.16
Nodes (16): integrationNames, StatusPage(), StatusValue, toStatus(), ModelSelector(), PROVIDERS, Status, StatusCard() (+8 more)

### Community 24 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 25 - "test_knowledge_graph.py"
Cohesion: 0.12
Nodes (5): graph(), _sqlite_in_memory(), TestEdgeOperations, TestGraphQueries, TestNodeOperations

### Community 26 - "types.py"
Cohesion: 0.17
Nodes (4): AgentEvent, EventSource, TestAgentEvent, TestEventSource

### Community 27 - "bus.py"
Cohesion: 0.16
Nodes (3): index(), reindex_embeddings(), webhook_server()

### Community 28 - "markets/page.tsx"
Cohesion: 0.21
Nodes (14): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+6 more)

### Community 29 - "test_event_gateway.py"
Cohesion: 0.13
Nodes (7): client(), _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook, TestJiraWebhook

### Community 30 - "gmail.py"
Cohesion: 0.20
Nodes (7): extract_action_items(), _get_credentials_path(), _get_service(), _get_token_path(), read_emails(), send_email(), summarize_thread()

### Community 31 - "api.ts"
Cohesion: 0.22
Nodes (12): ConversationsPage(), MessageBubble(), EventsPage(), payloadPreview(), Conversation, Event, fetchConversations(), fetchEvents() (+4 more)

### Community 32 - "feeds/page.tsx"
Cohesion: 0.21
Nodes (14): EmailRow(), FeedsPage(), LinkedInPost(), NotConfigured(), Tab, XPost(), EmailMessage, FeedPost (+6 more)

### Community 34 - "run()"
Cohesion: 0.21
Nodes (4): _build_ironclaw(), run(), _workflows_dir(), WorkflowEngine

### Community 35 - "jira_integration.py"
Cohesion: 0.28
Nodes (6): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), update_ticket()

### Community 36 - "confluence.py"
Cohesion: 0.26
Nodes (5): _api(), create_page(), _get_config(), search_docs(), summarize_page()

### Community 37 - "jenkins.py"
Cohesion: 0.26
Nodes (5): _api(), fetch_build_logs(), get_build_status(), _get_config(), trigger_build()

### Community 38 - "httpx"
Cohesion: 0.27
Nodes (5): _api(), _get_token(), read_channel_history(), respond_to_command(), send_message()

### Community 39 - "fetchApi()"
Cohesion: 0.32
Nodes (11): ChatPage(), MessageBubble(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchApi(), fetchChatMessages() (+3 more)

### Community 40 - "launcher.py"
Cohesion: 0.18
Nodes (3): main(), _setup_packaged_env(), TestServiceHealth

### Community 41 - ".run_workflow()"
Cohesion: 0.27
Nodes (5): _get_nested(), _render_template(), repl(), _resolve_args(), handler()

### Community 44 - "test_backend_orchestrator.py"
Cohesion: 0.27
Nodes (6): api_tools(), ironclaw_mock(), orchestrator(), registry(), _sqlite_in_memory(), TestOrchestratorMemory

### Community 46 - "react"
Cohesion: 0.28
Nodes (7): ToolsPage(), WorkflowsPage(), fetchTools(), fetchWorkflows(), Tool, Workflow, react

### Community 49 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 50 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

## Knowledge Gaps
- **7 isolated node(s):** `react-dom`, `@types/node`, `@types/react`, `@types/react-dom`, `autoprefixer` (+2 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 416 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **33 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `KnowledgeGraph`, `Orchestrator`, `models.py`, `ConversationMemory`, `EventBus`, `.run_workflow()`, `test_platform_models.py`, `init_db()`, `test_backend_orchestrator.py`, `EmbeddingStore`, `verify_webhook_signature()`, `test_platform_e2e.py`, `asyncio`, `test_event_gateway.py`?**
  _High betweenness centrality (0.060) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `react-dom`, `@types/node`, `@types/react` to the rest of the system?**
  _7 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `KnowledgeGraph` be split into smaller, more focused modules?**
  _Cohesion score 0.07346938775510205 - nodes in this community are weakly interconnected._
- **Why does `create_app()` connect `get_session()` to `models.py`, `run()`, `secrets.py`, `launcher.py`, `test_platform_models.py`, `init_db()`, `test_backend_orchestrator.py`, `EmbeddingStore`, `verify_webhook_signature()`, `test_platform_e2e.py`, `main.py`, `bus.py`, `test_event_gateway.py`?**
  _High betweenness centrality (0.053) - this node is a cross-community bridge._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Should `get_session()` be split into smaller, more focused modules?**
  _Cohesion score 0.07246376811594203 - nodes in this community are weakly interconnected._