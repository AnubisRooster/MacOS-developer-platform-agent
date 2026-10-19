# Graph Report - MacOS-developer-platform-agent  (2026-10-19)

## Corpus Check
- 103 files · ~124,995 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1053 nodes · 2128 edges · 65 communities (36 shown, 29 thin omitted)
- Extraction: 88% EXTRACTED · 12% INFERRED · 0% AMBIGUOUS · INFERRED: 245 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- ToolSchema
- KnowledgeGraph
- EventBus
- get_session()
- main.py
- models.py
- package.json
- IronClawClient
- load_workflow()
- test_knowledge_tools.py
- ConversationMemory
- secrets.py
- _cosine_similarity()
- test_platform_models.py
- init_db()
- EmbeddingStore
- verify_webhook_signature()
- test_platform_e2e.py
- TestEnvironment
- _register_tools()
- TestMacOSPaths
- app/page.tsx
- compilerOptions
- types.py
- markets/page.tsx
- test_event_gateway.py
- gmail.py
- api.ts
- feeds/page.tsx
- jira_integration.py
- confluence.py
- jenkins.py
- httpx
- fetchApi()
- launcher.py
- SlackCommandGateway
- react
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

## Communities (65 total, 29 thin omitted)

### Community 0 - "ToolSchema"
Cohesion: 0.06
Nodes (17): Orchestrator, _register_knowledge_tools(), ToolEntry, ToolRegistry, ToolSchema, api_tools(), TestOrchestratorPipeline, ironclaw_mock() (+9 more)

### Community 1 - "KnowledgeGraph"
Cohesion: 0.06
Nodes (13): KnowledgeGraph, ConfluenceIndexer, _github_headers(), GitHubIndexer, JenkinsIndexer, JiraIndexer, RepositoryIntelligenceIndexer, _upsert_document() (+5 more)

### Community 2 - "EventBus"
Cohesion: 0.05
Nodes (14): EventBus, _consume(), _get_nested(), _render_template(), repl(), _resolve_args(), WorkflowEngine, handler() (+6 more)

### Community 3 - "get_session()"
Cohesion: 0.07
Nodes (29): ChatMessage, ChatSession, get_session(), create_app(), api_chat_delete(), api_chat_messages(), api_chat_new(), api_chat_send() (+21 more)

### Community 4 - "main.py"
Cohesion: 0.08
Nodes (12): _build_ironclaw(), cli(), index(), main(), reindex_embeddings(), run(), _start_cloudflared(), _start_ironclaw() (+4 more)

### Community 5 - "models.py"
Cohesion: 0.09
Nodes (5): AgentConversation, AgentLog, CachedSummary, ToolOutput, _log_to_db()

### Community 6 - "package.json"
Cohesion: 0.05
Nodes (36): dependencies, next, react, react-dom, recharts, devDependencies, autoprefixer, postcss (+28 more)

### Community 7 - "IronClawClient"
Cohesion: 0.10
Nodes (7): IronClawClient, client(), TestHealth, TestInterpret, TestPlan, TestSelectTools, TestSummarize

### Community 8 - "load_workflow()"
Cohesion: 0.08
Nodes (12): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), WorkflowAction, WorkflowDefinition, TestWorkflowLoader, TestLoadAllWorkflows (+4 more)

### Community 9 - "test_knowledge_tools.py"
Cohesion: 0.08
Nodes (9): KnowledgeTools, _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions, TestSearch, TestTraceCommit (+1 more)

### Community 10 - "ConversationMemory"
Cohesion: 0.10
Nodes (11): ConversationMemory, env_secrets(), event_bus(), memory(), _reset_db_globals(), _reset_secrets_cache(), tmp_workflow_dir(), tool_registry() (+3 more)

### Community 11 - "secrets.py"
Cohesion: 0.10
Nodes (7): AppSecrets, get_secrets(), redact(), RedactingFilter, TestAppSecrets, TestRedact, TestRedactingFilter

### Community 12 - "_cosine_similarity()"
Cohesion: 0.10
Nodes (7): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), TestChunking, TestCosineSimilarity

### Community 13 - "test_platform_models.py"
Cohesion: 0.14
Nodes (9): AgentMemory, Base, KnowledgeEdge, KnowledgeNode, WorkflowRun, _sqlite_in_memory(), TestAllTablesCreated, TestKnowledgeGraphModels (+1 more)

### Community 14 - "init_db()"
Cohesion: 0.15
Nodes (7): Event, _get_database_url(), get_engine(), init_db(), TestDatabaseConnectivity, _use_sqlite(), TestEventModel

### Community 15 - "EmbeddingStore"
Cohesion: 0.16
Nodes (8): Document, Embedding, EmbeddingStore, TestKnowledgePipeline, _sqlite_in_memory(), TestEmbeddingStore, TestDocumentModel, TestEmbeddingModel

### Community 16 - "verify_webhook_signature()"
Cohesion: 0.16
Nodes (12): verify_webhook_signature(), github_webhook(), gmail_webhook(), health(), jenkins_webhook(), jira_webhook(), slack_webhook(), _log_event() (+4 more)

### Community 17 - "test_platform_e2e.py"
Cohesion: 0.13
Nodes (4): client(), full_app(), _sqlite_in_memory(), _sqlite_in_memory()

### Community 19 - "_register_tools()"
Cohesion: 0.19
Nodes (9): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), search_repos(), summarize_pull_request() (+1 more)

### Community 21 - "app/page.tsx"
Cohesion: 0.16
Nodes (16): integrationNames, StatusPage(), StatusValue, toStatus(), ModelSelector(), PROVIDERS, Status, StatusCard() (+8 more)

### Community 22 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 23 - "types.py"
Cohesion: 0.17
Nodes (4): AgentEvent, EventSource, TestAgentEvent, TestEventSource

### Community 24 - "markets/page.tsx"
Cohesion: 0.21
Nodes (14): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+6 more)

### Community 25 - "test_event_gateway.py"
Cohesion: 0.13
Nodes (7): client(), _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook, TestJiraWebhook

### Community 26 - "gmail.py"
Cohesion: 0.20
Nodes (7): extract_action_items(), _get_credentials_path(), _get_service(), _get_token_path(), read_emails(), send_email(), summarize_thread()

### Community 27 - "api.ts"
Cohesion: 0.22
Nodes (12): ConversationsPage(), MessageBubble(), EventsPage(), payloadPreview(), Conversation, Event, fetchConversations(), fetchEvents() (+4 more)

### Community 28 - "feeds/page.tsx"
Cohesion: 0.21
Nodes (14): EmailRow(), FeedsPage(), LinkedInPost(), NotConfigured(), Tab, XPost(), EmailMessage, FeedPost (+6 more)

### Community 29 - "jira_integration.py"
Cohesion: 0.28
Nodes (6): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), update_ticket()

### Community 30 - "confluence.py"
Cohesion: 0.26
Nodes (5): _api(), create_page(), _get_config(), search_docs(), summarize_page()

### Community 31 - "jenkins.py"
Cohesion: 0.26
Nodes (5): _api(), fetch_build_logs(), get_build_status(), _get_config(), trigger_build()

### Community 32 - "httpx"
Cohesion: 0.27
Nodes (5): _api(), _get_token(), read_channel_history(), respond_to_command(), send_message()

### Community 33 - "fetchApi()"
Cohesion: 0.32
Nodes (11): ChatPage(), MessageBubble(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchApi(), fetchChatMessages() (+3 more)

### Community 34 - "launcher.py"
Cohesion: 0.18
Nodes (3): main(), _setup_packaged_env(), TestServiceHealth

### Community 37 - "react"
Cohesion: 0.28
Nodes (7): ToolsPage(), WorkflowsPage(), fetchTools(), fetchWorkflows(), Tool, Workflow, react

### Community 39 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 40 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

## Knowledge Gaps
- **7 isolated node(s):** `react-dom`, `@types/node`, `@types/react`, `@types/react-dom`, `autoprefixer` (+2 more)
  These have ≤1 connection - possible missing edges. (Counts symbols only; 392 node(s) total have ≤1 connection when file, concept and rationale nodes are included.)
- **29 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `ToolSchema`, `KnowledgeGraph`, `EventBus`, `models.py`, `ConversationMemory`, `test_platform_models.py`, `init_db()`, `EmbeddingStore`, `verify_webhook_signature()`, `test_platform_e2e.py`, `test_event_gateway.py`?**
  _High betweenness centrality (0.059) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **What connects `react-dom`, `@types/node`, `@types/react` to the rest of the system?**
  _7 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `ToolSchema` be split into smaller, more focused modules?**
  _Cohesion score 0.05583972719522592 - nodes in this community are weakly interconnected._
- **Why does `create_app()` connect `get_session()` to `ToolSchema`, `launcher.py`, `main.py`, `models.py`, `secrets.py`, `test_platform_models.py`, `init_db()`, `EmbeddingStore`, `verify_webhook_signature()`, `test_platform_e2e.py`, `test_event_gateway.py`?**
  _High betweenness centrality (0.054) - this node is a cross-community bridge._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Should `KnowledgeGraph` be split into smaller, more focused modules?**
  _Cohesion score 0.05794556628621598 - nodes in this community are weakly interconnected._