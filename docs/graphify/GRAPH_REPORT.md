# Graph Report - MacOS-developer-platform-agent  (2026-11-16)

## Corpus Check
- 103 files · ~133,381 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1173 nodes · 2256 edges · 77 communities (42 shown, 35 thin omitted)
- Extraction: 90% EXTRACTED · 10% INFERRED · 0% AMBIGUOUS · INFERRED: 220 edges (avg confidence: 0.88)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- KnowledgeGraph
- main.py
- EventBus
- os
- config.yaml
- EmbeddingStore
- load_workflow()
- get_session()
- IronClawClient
- package.json
- integrations
- ToolSchema
- secrets.py
- init_db()
- test_platform_e2e.py
- test_platform_models.py
- TestEnvironment
- models.py
- _register_tools()
- verify_webhook_signature()
- TestMacOSPaths
- app/page.tsx
- compilerOptions
- args
- .handle_message()
- test_backend_orchestrator.py
- test_event_gateway.py
- gmail.py
- build_failed.yaml
- feeds/page.tsx
- markets/page.tsx
- .get_messages()
- Document
- jira_integration.py
- api.ts
- confluence.py
- jenkins.py
- httpx
- fetchApi()
- conftest.py
- jira_created.yaml
- TestServiceHealth
- SlackCommandGateway
- full_app()
- TestDashboardAPI
- types.py
- AgentEvent
- conversations/page.tsx
- logs/page.tsx
- workflow-runs/page.tsx
- pytest
- react
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
- `TestOrchestratorHandleMessage` --uses--> `ToolOutput`  [INFERRED]
  tests/unit/test_backend_orchestrator.py → backend/database/models.py

## Import Cycles
- None detected.

## Communities (77 total, 35 thin omitted)

### Community 0 - "KnowledgeGraph"
Cohesion: 0.06
Nodes (13): KnowledgeGraph, ConfluenceIndexer, _github_headers(), GitHubIndexer, JenkinsIndexer, JiraIndexer, RepositoryIntelligenceIndexer, _upsert_document() (+5 more)

### Community 1 - "main.py"
Cohesion: 0.05
Nodes (20): AgentLog, _build_ironclaw(), cli(), index(), main(), reindex_embeddings(), run(), _start_cloudflared() (+12 more)

### Community 2 - "EventBus"
Cohesion: 0.06
Nodes (8): EventBus, _consume(), TestWorkflowTriggerPipeline, bus(), _no_redis(), TestEventBusFallback, handler(), TestWorkflowEngine

### Community 3 - "os"
Cohesion: 0.05
Nodes (10): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), main(), _setup_packaged_env(), _sqlite_in_memory() (+2 more)

### Community 4 - "config.yaml"
Cohesion: 0.04
Nodes (45): agent, max_tokens, name, system_prompt, temperature, version, database, echo (+37 more)

### Community 5 - "EmbeddingStore"
Cohesion: 0.07
Nodes (10): EmbeddingStore, KnowledgeTools, _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions, TestSearch (+2 more)

### Community 6 - "load_workflow()"
Cohesion: 0.08
Nodes (13): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), WorkflowAction, WorkflowDefinition, _sqlite_in_memory(), TestWorkflowLoader (+5 more)

### Community 7 - "get_session()"
Cohesion: 0.08
Nodes (27): ChatMessage, get_session(), create_app(), api_chat_delete(), api_chat_messages(), api_chat_send(), api_chat_sessions(), api_conversations() (+19 more)

### Community 8 - "IronClawClient"
Cohesion: 0.09
Nodes (7): IronClawClient, client(), TestHealth, TestInterpret, TestPlan, TestSelectTools, TestSummarize

### Community 9 - "package.json"
Cohesion: 0.06
Nodes (37): dependencies, next@^14.1.0, react@^18.2.0, react-dom@^18.2.0, recharts@^3.8.0, devDependencies, autoprefixer@^10.4.17, postcss@^8.4.33 (+29 more)

### Community 10 - "integrations"
Cohesion: 0.06
Nodes (31): api_token, enabled, url, user, enabled, token, webhook_secret, credentials_file (+23 more)

### Community 11 - "ToolSchema"
Cohesion: 0.12
Nodes (7): _register_knowledge_tools(), ToolEntry, ToolRegistry, ToolSchema, TestBackendToolRegistry, TestToolEntry, TestToolSchema

### Community 12 - "secrets.py"
Cohesion: 0.10
Nodes (7): AppSecrets, get_secrets(), redact(), RedactingFilter, TestAppSecrets, TestRedact, TestRedactingFilter

### Community 13 - "init_db()"
Cohesion: 0.13
Nodes (8): Event, _get_database_url(), get_engine(), init_db(), TestDatabaseConnectivity, _use_sqlite(), TestKnowledgePipeline, TestEventModel

### Community 14 - "test_platform_e2e.py"
Cohesion: 0.15
Nodes (5): ConversationMemory, Orchestrator, AgentConversation, ToolOutput, TestOrchestratorPipeline

### Community 15 - "test_platform_models.py"
Cohesion: 0.16
Nodes (8): Base, KnowledgeEdge, KnowledgeNode, WorkflowRun, _sqlite_in_memory(), TestAllTablesCreated, TestKnowledgeGraphModels, TestWorkflowRunModel

### Community 17 - "models.py"
Cohesion: 0.12
Nodes (6): AgentMemory, CachedSummary, ChatSession, api_chat_new(), health(), _now_iso()

### Community 18 - "_register_tools()"
Cohesion: 0.19
Nodes (9): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), search_repos(), summarize_pull_request() (+1 more)

### Community 19 - "verify_webhook_signature()"
Cohesion: 0.18
Nodes (10): verify_webhook_signature(), github_webhook(), gmail_webhook(), jenkins_webhook(), jira_webhook(), slack_webhook(), _log_event(), _make_event() (+2 more)

### Community 21 - "app/page.tsx"
Cohesion: 0.16
Nodes (16): integrationNames, StatusPage(), StatusValue, toStatus(), ModelSelector(), PROVIDERS, Status, StatusCard() (+8 more)

### Community 22 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 23 - "args"
Cohesion: 0.12
Nodes (16): actions, args, description, on_failure, tool, channel, github_url, owner (+8 more)

### Community 25 - "test_backend_orchestrator.py"
Cohesion: 0.16
Nodes (8): api_tools(), ironclaw_mock(), orchestrator(), registry(), _sqlite_in_memory(), TestOrchestratorMemory, memory(), _sqlite_in_memory()

### Community 26 - "test_event_gateway.py"
Cohesion: 0.13
Nodes (7): client(), _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook, TestJiraWebhook

### Community 27 - "gmail.py"
Cohesion: 0.20
Nodes (7): extract_action_items(), _get_credentials_path(), _get_service(), _get_token_path(), read_emails(), send_email(), summarize_thread()

### Community 28 - "build_failed.yaml"
Cohesion: 0.13
Nodes (14): actions, args, description, on_failure, tool, build_number, channel, job (+6 more)

### Community 29 - "feeds/page.tsx"
Cohesion: 0.21
Nodes (14): EmailRow(), FeedsPage(), LinkedInPost(), NotConfigured(), Tab, XPost(), EmailMessage, FeedPost (+6 more)

### Community 30 - "markets/page.tsx"
Cohesion: 0.23
Nodes (13): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+5 more)

### Community 32 - "Document"
Cohesion: 0.24
Nodes (5): Document, Embedding, TestEmbeddingStore, TestDocumentModel, TestEmbeddingModel

### Community 33 - "jira_integration.py"
Cohesion: 0.28
Nodes (6): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), update_ticket()

### Community 34 - "api.ts"
Cohesion: 0.24
Nodes (10): EventsPage(), payloadPreview(), WorkflowsPage(), Event, fetchEvents(), fetchWorkflows(), IntegrationsConfig, MarketsHistoryResponse (+2 more)

### Community 35 - "confluence.py"
Cohesion: 0.26
Nodes (5): _api(), create_page(), _get_config(), search_docs(), summarize_page()

### Community 36 - "jenkins.py"
Cohesion: 0.26
Nodes (5): _api(), fetch_build_logs(), get_build_status(), _get_config(), trigger_build()

### Community 37 - "httpx"
Cohesion: 0.27
Nodes (5): _api(), _get_token(), read_channel_history(), respond_to_command(), send_message()

### Community 38 - "fetchApi()"
Cohesion: 0.32
Nodes (11): ChatPage(), MessageBubble(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchApi(), fetchChatMessages() (+3 more)

### Community 39 - "conftest.py"
Cohesion: 0.26
Nodes (7): env_secrets(), event_bus(), memory(), _reset_db_globals(), _reset_secrets_cache(), tmp_workflow_dir(), tool_registry()

### Community 40 - "jira_created.yaml"
Cohesion: 0.18
Nodes (10): actions, args, on_failure, tool, channel, text, description, enabled (+2 more)

### Community 43 - "full_app()"
Cohesion: 0.29
Nodes (3): client(), full_app(), _sqlite_in_memory()

### Community 48 - "conversations/page.tsx"
Cohesion: 0.47
Nodes (5): ConversationsPage(), MessageBubble(), Conversation, fetchConversations(), Message

### Community 49 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 50 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

### Community 52 - "react"
Cohesion: 0.50
Nodes (4): ToolsPage(), fetchTools(), Tool, react

## Knowledge Gaps
- **35 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `KnowledgeGraph`, `main.py`, `EventBus`, `os`, `Document`, `EmbeddingStore`, `load_workflow()`, `init_db()`, `test_platform_e2e.py`, `test_platform_models.py`, `models.py`, `verify_webhook_signature()`, `.handle_message()`, `test_backend_orchestrator.py`, `test_event_gateway.py`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **Should `KnowledgeGraph` be split into smaller, more focused modules?**
  _Cohesion score 0.058385093167701865 - nodes in this community are weakly interconnected._
- **Why does `create_app()` connect `get_session()` to `Document`, `main.py`, `TestServiceHealth`, `full_app()`, `secrets.py`, `init_db()`, `test_platform_e2e.py`, `test_platform_models.py`, `models.py`, `verify_webhook_signature()`, `test_backend_orchestrator.py`, `test_event_gateway.py`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Are the 9 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 9 INFERRED edges - model-reasoned connections that need verification._
- **Should `main.py` be split into smaller, more focused modules?**
  _Cohesion score 0.054563492063492064 - nodes in this community are weakly interconnected._
- **Why does `EventBus` connect `EventBus` to `main.py`, `os`, `load_workflow()`, `conftest.py`, `full_app()`, `test_platform_e2e.py`?**
  _High betweenness centrality (0.034) - this node is a cross-community bridge._