# Graph Report - MacOS-developer-platform-agent  (2026-11-02)

## Corpus Check
- 103 files · ~133,226 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1173 nodes · 2256 edges · 89 communities (46 shown, 43 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 246 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- init_db()
- KnowledgeGraph
- config.yaml
- package.json
- test_knowledge_tools.py
- IronClawClient
- main.py
- ToolSchema
- get_session()
- integrations
- test_embeddings.py
- pathlib
- TestEnvironment
- _register_tools()
- TestMacOSPaths
- .publish()
- app/page.tsx
- test_platform_e2e.py
- compilerOptions
- .handle_message()
- types.py
- args
- engine.py
- load_workflow()
- test_event_gateway.py
- run()
- gmail.py
- build_failed.yaml
- feeds/page.tsx
- markets/page.tsx
- models.py
- _log_event()
- loader.py
- .get_messages()
- EventBus
- jira_integration.py
- api.ts
- confluence.py
- jenkins.py
- httpx
- fetchApi()
- launcher.py
- conftest.py
- jira_created.yaml
- ChatMessage
- SlackCommandGateway
- _start_cloudflared()
- AppSecrets
- verify_webhook_signature()
- RedactingFilter
- redact()
- full_app()
- TestDashboardAPI
- load_all_workflows()
- conversations/page.tsx
- logs/page.tsx
- workflow-runs/page.tsx
- ._get_redis()
- react
- TestDashboardReadsWebhookData
- TestWebhookToEventStore
- test_redis_event_bus.py
- WorkflowDefinition
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

## Communities (89 total, 43 thin omitted)

### Community 0 - "init_db()"
Cohesion: 0.05
Nodes (26): AgentMemory, Base, Document, Embedding, Event, _get_database_url(), get_engine(), init_db() (+18 more)

### Community 1 - "KnowledgeGraph"
Cohesion: 0.06
Nodes (13): KnowledgeGraph, ConfluenceIndexer, _github_headers(), GitHubIndexer, JenkinsIndexer, JiraIndexer, RepositoryIntelligenceIndexer, _upsert_document() (+5 more)

### Community 2 - "config.yaml"
Cohesion: 0.04
Nodes (45): agent, max_tokens, name, system_prompt, temperature, version, database, echo (+37 more)

### Community 3 - "package.json"
Cohesion: 0.06
Nodes (37): dependencies, next@^14.1.0, react@^18.2.0, react-dom@^18.2.0, recharts@^3.8.0, devDependencies, autoprefixer@^10.4.17, postcss@^8.4.33 (+29 more)

### Community 4 - "test_knowledge_tools.py"
Cohesion: 0.08
Nodes (9): KnowledgeTools, _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions, TestSearch, TestTraceCommit (+1 more)

### Community 5 - "IronClawClient"
Cohesion: 0.10
Nodes (7): IronClawClient, client(), TestHealth, TestInterpret, TestPlan, TestSelectTools, TestSummarize

### Community 6 - "main.py"
Cohesion: 0.10
Nodes (4): cli(), main(), _stop_all_children(), _stop_child()

### Community 7 - "ToolSchema"
Cohesion: 0.11
Nodes (8): _register_knowledge_tools(), ToolEntry, ToolRegistry, ToolSchema, registry(), TestBackendToolRegistry, TestToolEntry, TestToolSchema

### Community 8 - "get_session()"
Cohesion: 0.10
Nodes (18): ChatSession, get_session(), create_app(), api_chat_delete(), api_chat_messages(), api_chat_new(), api_chat_sessions(), api_conversations() (+10 more)

### Community 9 - "integrations"
Cohesion: 0.06
Nodes (31): api_token, enabled, url, user, enabled, token, webhook_secret, credentials_file (+23 more)

### Community 10 - "test_embeddings.py"
Cohesion: 0.10
Nodes (8): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), _sqlite_in_memory(), TestChunking, TestCosineSimilarity

### Community 11 - "pathlib"
Cohesion: 0.11
Nodes (7): api_tools(), ironclaw_mock(), orchestrator(), _sqlite_in_memory(), memory(), _sqlite_in_memory(), _sqlite_in_memory()

### Community 13 - "_register_tools()"
Cohesion: 0.19
Nodes (9): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), search_repos(), summarize_pull_request() (+1 more)

### Community 16 - "app/page.tsx"
Cohesion: 0.16
Nodes (16): integrationNames, StatusPage(), StatusValue, toStatus(), ModelSelector(), PROVIDERS, Status, StatusCard() (+8 more)

### Community 17 - "test_platform_e2e.py"
Cohesion: 0.18
Nodes (5): ConversationMemory, Orchestrator, AgentConversation, ToolOutput, TestOrchestratorPipeline

### Community 18 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 19 - ".handle_message()"
Cohesion: 0.21
Nodes (3): TestOrchestratorExecuteTool, TestOrchestratorHandleMessage, TestOrchestratorMemory

### Community 20 - "types.py"
Cohesion: 0.17
Nodes (4): AgentEvent, EventSource, TestAgentEvent, TestEventSource

### Community 21 - "args"
Cohesion: 0.12
Nodes (16): actions, args, description, on_failure, tool, channel, github_url, owner (+8 more)

### Community 22 - "engine.py"
Cohesion: 0.21
Nodes (7): AgentLog, _get_nested(), _log_to_db(), _render_template(), repl(), _resolve_args(), handler()

### Community 23 - "load_workflow()"
Cohesion: 0.18
Nodes (4): load_workflow(), TestWorkflowLoader, TestLoadProjectWorkflows, TestLoadWorkflow

### Community 24 - "test_event_gateway.py"
Cohesion: 0.13
Nodes (7): client(), _sqlite_in_memory(), TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook, TestJiraWebhook

### Community 25 - "run()"
Cohesion: 0.17
Nodes (4): _build_ironclaw(), run(), _workflows_dir(), WorkflowEngine

### Community 26 - "gmail.py"
Cohesion: 0.20
Nodes (7): extract_action_items(), _get_credentials_path(), _get_service(), _get_token_path(), read_emails(), send_email(), summarize_thread()

### Community 27 - "build_failed.yaml"
Cohesion: 0.13
Nodes (14): actions, args, description, on_failure, tool, build_number, channel, job (+6 more)

### Community 28 - "feeds/page.tsx"
Cohesion: 0.21
Nodes (14): EmailRow(), FeedsPage(), LinkedInPost(), NotConfigured(), Tab, XPost(), EmailMessage, FeedPost (+6 more)

### Community 29 - "markets/page.tsx"
Cohesion: 0.23
Nodes (13): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+5 more)

### Community 31 - "_log_event()"
Cohesion: 0.25
Nodes (10): github_webhook(), gmail_webhook(), health(), jenkins_webhook(), jira_webhook(), slack_webhook(), _log_event(), _make_event() (+2 more)

### Community 32 - "loader.py"
Cohesion: 0.19
Nodes (4): _parse_actions(), _parse_trigger(), WorkflowAction, TestWorkflowAction

### Community 34 - "EventBus"
Cohesion: 0.19
Nodes (3): EventBus, TestWorkflowTriggerPipeline, TestWorkflowEngine

### Community 35 - "jira_integration.py"
Cohesion: 0.28
Nodes (6): _api(), create_ticket(), _get_config(), get_ticket_details(), link_github_issue(), update_ticket()

### Community 36 - "api.ts"
Cohesion: 0.24
Nodes (10): EventsPage(), payloadPreview(), WorkflowsPage(), Event, fetchEvents(), fetchWorkflows(), IntegrationsConfig, MarketsHistoryResponse (+2 more)

### Community 37 - "confluence.py"
Cohesion: 0.26
Nodes (5): _api(), create_page(), _get_config(), search_docs(), summarize_page()

### Community 38 - "jenkins.py"
Cohesion: 0.26
Nodes (5): _api(), fetch_build_logs(), get_build_status(), _get_config(), trigger_build()

### Community 39 - "httpx"
Cohesion: 0.27
Nodes (5): _api(), _get_token(), read_channel_history(), respond_to_command(), send_message()

### Community 40 - "fetchApi()"
Cohesion: 0.32
Nodes (11): ChatPage(), MessageBubble(), ChatMessageItem, ChatSessionSummary, createChatSession(), deleteChatSession(), fetchApi(), fetchChatMessages() (+3 more)

### Community 41 - "launcher.py"
Cohesion: 0.18
Nodes (3): main(), _setup_packaged_env(), TestServiceHealth

### Community 42 - "conftest.py"
Cohesion: 0.26
Nodes (7): env_secrets(), event_bus(), memory(), _reset_db_globals(), _reset_secrets_cache(), tmp_workflow_dir(), tool_registry()

### Community 43 - "jira_created.yaml"
Cohesion: 0.18
Nodes (10): actions, args, on_failure, tool, channel, text, description, enabled (+2 more)

### Community 45 - "ChatMessage"
Cohesion: 0.22
Nodes (10): ChatMessage, api_chat_send(), api_model_config_get(), api_model_config_post(), _check_ironclaw(), _get_model_config_path(), _llm_chat(), _load_model_config() (+2 more)

### Community 49 - "AppSecrets"
Cohesion: 0.32
Nodes (3): AppSecrets, get_secrets(), TestAppSecrets

### Community 54 - "full_app()"
Cohesion: 0.29
Nodes (3): client(), full_app(), _sqlite_in_memory()

### Community 57 - "conversations/page.tsx"
Cohesion: 0.47
Nodes (5): ConversationsPage(), MessageBubble(), Conversation, fetchConversations(), Message

### Community 58 - "logs/page.tsx"
Cohesion: 0.47
Nodes (5): LevelFilter, logLineColor(), LogsPage(), fetchLogs(), LogEntry

### Community 59 - "workflow-runs/page.tsx"
Cohesion: 0.53
Nodes (5): formatDuration(), statusBadge(), WorkflowRunsPage(), fetchWorkflowRuns(), WorkflowRun

### Community 61 - "react"
Cohesion: 0.50
Nodes (4): ToolsPage(), fetchTools(), Tool, react

## Knowledge Gaps
- **43 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `init_db()`, `KnowledgeGraph`, `EventBus`, `main.py`, `test_embeddings.py`, `pathlib`, `ChatMessage`, `test_platform_e2e.py`, `.handle_message()`, `engine.py`, `test_event_gateway.py`, `TestWebhookToEventStore`, `models.py`, `_log_event()`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **Should `init_db()` be split into smaller, more focused modules?**
  _Cohesion score 0.051929824561403506 - nodes in this community are weakly interconnected._
- **Why does `create_app()` connect `get_session()` to `init_db()`, `main.py`, `launcher.py`, `pathlib`, `ChatMessage`, `test_platform_e2e.py`, `AppSecrets`, `verify_webhook_signature()`, `engine.py`, `full_app()`, `test_event_gateway.py`, `run()`, `models.py`, `_log_event()`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Should `KnowledgeGraph` be split into smaller, more focused modules?**
  _Cohesion score 0.05794556628621598 - nodes in this community are weakly interconnected._
- **Why does `EventBus` connect `EventBus` to `test_redis_event_bus.py`, `main.py`, `launcher.py`, `conftest.py`, `pathlib`, `.publish()`, `test_platform_e2e.py`, `._dispatch_local()`, `engine.py`, `full_app()`, `run()`, `._get_redis()`?**
  _High betweenness centrality (0.034) - this node is a cross-community bridge._