# Graph Report - MacOS-developer-platform-agent  (2026-10-26)

## Corpus Check
- 103 files · ~126,770 words
- Verdict: corpus is large enough that graph structure adds value.
- Unclassified: 7 file(s) not represented in the graph (top: .example 2, (none) 1, .jsonl 1)

## Summary
- 1173 nodes · 2255 edges · 75 communities (45 shown, 30 thin omitted)
- Extraction: 89% EXTRACTED · 11% INFERRED · 0% AMBIGUOUS · INFERRED: 245 edges (avg confidence: 0.89)
- Token cost: 0 input · 0 output

## Community Hubs (Navigation)
- KnowledgeGraph
- EventBus
- get_session()
- config.yaml
- package.json
- load_workflow()
- run()
- test_knowledge_tools.py
- IronClawClient
- main.py
- ToolSchema
- integrations
- secrets.py
- test_embeddings.py
- pathlib
- test_event_gateway.py
- init_db()
- verify_webhook_signature()
- test_platform_models.py
- EmbeddingStore
- TestEnvironment
- _register_tools()
- TestMacOSPaths
- app/page.tsx
- test_platform_e2e.py
- compilerOptions
- .handle_message()
- types.py
- args
- gmail.py
- build_failed.yaml
- feeds/page.tsx
- markets/page.tsx
- models.py
- .get_messages()
- jira_integration.py
- api.ts
- confluence.py
- jenkins.py
- httpx
- fetchApi()
- launcher.py
- index()
- jira_created.yaml
- SlackCommandGateway
- _start_cloudflared()
- full_app()
- conversations/page.tsx
- logs/page.tsx
- workflow-runs/page.tsx
- react
- TestDashboardReadsWebhookData
- next.config.js
- start.sh
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

## Communities (75 total, 30 thin omitted)

### Community 0 - "KnowledgeGraph"
Cohesion: 0.06
Nodes (13): KnowledgeGraph, ConfluenceIndexer, _github_headers(), GitHubIndexer, JenkinsIndexer, JiraIndexer, RepositoryIntelligenceIndexer, _upsert_document() (+5 more)

### Community 1 - "EventBus"
Cohesion: 0.06
Nodes (13): EventBus, _consume(), env_secrets(), event_bus(), memory(), _reset_db_globals(), _reset_secrets_cache(), tmp_workflow_dir() (+5 more)

### Community 2 - "get_session()"
Cohesion: 0.07
Nodes (29): ChatMessage, ChatSession, get_session(), create_app(), api_chat_delete(), api_chat_messages(), api_chat_new(), api_chat_send() (+21 more)

### Community 3 - "config.yaml"
Cohesion: 0.04
Nodes (45): agent, max_tokens, name, system_prompt, temperature, version, database, echo (+37 more)

### Community 4 - "package.json"
Cohesion: 0.06
Nodes (37): dependencies, next@^14.1.0, react@^18.2.0, react-dom@^18.2.0, recharts@^3.8.0, devDependencies, autoprefixer@^10.4.17, postcss@^8.4.33 (+29 more)

### Community 5 - "load_workflow()"
Cohesion: 0.08
Nodes (12): load_all_workflows(), load_workflow(), _parse_actions(), _parse_trigger(), WorkflowAction, WorkflowDefinition, TestWorkflowLoader, TestLoadAllWorkflows (+4 more)

### Community 6 - "run()"
Cohesion: 0.08
Nodes (13): AgentLog, _build_ironclaw(), run(), _workflows_dir(), _get_nested(), _log_to_db(), _render_template(), repl() (+5 more)

### Community 7 - "test_knowledge_tools.py"
Cohesion: 0.08
Nodes (9): KnowledgeTools, _sqlite_in_memory(), TestExplainSystem, TestFindRelatedDocs, TestFindRepo, TestKnowledgeToolDefinitions, TestSearch, TestTraceCommit (+1 more)

### Community 8 - "IronClawClient"
Cohesion: 0.10
Nodes (7): IronClawClient, client(), TestHealth, TestInterpret, TestPlan, TestSelectTools, TestSummarize

### Community 9 - "main.py"
Cohesion: 0.10
Nodes (4): cli(), main(), _stop_all_children(), _stop_child()

### Community 10 - "ToolSchema"
Cohesion: 0.11
Nodes (8): _register_knowledge_tools(), ToolEntry, ToolRegistry, ToolSchema, registry(), TestBackendToolRegistry, TestToolEntry, TestToolSchema

### Community 11 - "integrations"
Cohesion: 0.06
Nodes (31): api_token, enabled, url, user, enabled, token, webhook_secret, credentials_file (+23 more)

### Community 12 - "secrets.py"
Cohesion: 0.10
Nodes (7): AppSecrets, get_secrets(), redact(), RedactingFilter, TestAppSecrets, TestRedact, TestRedactingFilter

### Community 13 - "test_embeddings.py"
Cohesion: 0.10
Nodes (8): _chunk_text(), _cosine_similarity(), get_embeddings(), _get_embeddings_ollama(), _get_embeddings_openai(), _sqlite_in_memory(), TestChunking, TestCosineSimilarity

### Community 14 - "pathlib"
Cohesion: 0.11
Nodes (7): api_tools(), ironclaw_mock(), orchestrator(), _sqlite_in_memory(), memory(), _sqlite_in_memory(), _sqlite_in_memory()

### Community 15 - "test_event_gateway.py"
Cohesion: 0.08
Nodes (9): client(), _sqlite_in_memory(), TestDashboardAPI, TestGitHubWebhook, TestGmailWebhook, TestHealthEndpoint, TestJenkinsWebhook, TestJiraWebhook (+1 more)

### Community 16 - "init_db()"
Cohesion: 0.15
Nodes (7): Event, _get_database_url(), get_engine(), init_db(), TestDatabaseConnectivity, _use_sqlite(), TestEventModel

### Community 17 - "verify_webhook_signature()"
Cohesion: 0.16
Nodes (12): verify_webhook_signature(), github_webhook(), gmail_webhook(), health(), jenkins_webhook(), jira_webhook(), slack_webhook(), _log_event() (+4 more)

### Community 18 - "test_platform_models.py"
Cohesion: 0.15
Nodes (9): AgentMemory, Base, KnowledgeEdge, KnowledgeNode, WorkflowRun, _sqlite_in_memory(), TestAllTablesCreated, TestKnowledgeGraphModels (+1 more)

### Community 19 - "EmbeddingStore"
Cohesion: 0.17
Nodes (7): Document, Embedding, EmbeddingStore, TestKnowledgePipeline, TestEmbeddingStore, TestDocumentModel, TestEmbeddingModel

### Community 21 - "_register_tools()"
Cohesion: 0.19
Nodes (9): _api(), comment_on_pr(), create_branch(), create_issue(), get_repo_activity(), _get_token(), search_repos(), summarize_pull_request() (+1 more)

### Community 23 - "app/page.tsx"
Cohesion: 0.16
Nodes (16): integrationNames, StatusPage(), StatusValue, toStatus(), ModelSelector(), PROVIDERS, Status, StatusCard() (+8 more)

### Community 24 - "test_platform_e2e.py"
Cohesion: 0.18
Nodes (5): ConversationMemory, Orchestrator, AgentConversation, ToolOutput, TestOrchestratorPipeline

### Community 25 - "compilerOptions"
Cohesion: 0.11
Nodes (17): compilerOptions, allowJs, esModuleInterop, incremental, isolatedModules, jsx, lib, module (+9 more)

### Community 26 - ".handle_message()"
Cohesion: 0.21
Nodes (3): TestOrchestratorExecuteTool, TestOrchestratorHandleMessage, TestOrchestratorMemory

### Community 27 - "types.py"
Cohesion: 0.17
Nodes (4): AgentEvent, EventSource, TestAgentEvent, TestEventSource

### Community 28 - "args"
Cohesion: 0.12
Nodes (16): actions, args, description, on_failure, tool, channel, github_url, owner (+8 more)

### Community 29 - "gmail.py"
Cohesion: 0.20
Nodes (7): extract_action_items(), _get_credentials_path(), _get_service(), _get_token_path(), read_emails(), send_email(), summarize_thread()

### Community 30 - "build_failed.yaml"
Cohesion: 0.13
Nodes (14): actions, args, description, on_failure, tool, build_number, channel, job (+6 more)

### Community 31 - "feeds/page.tsx"
Cohesion: 0.21
Nodes (14): EmailRow(), FeedsPage(), LinkedInPost(), NotConfigured(), Tab, XPost(), EmailMessage, FeedPost (+6 more)

### Community 32 - "markets/page.tsx"
Cohesion: 0.23
Nodes (13): ASSET_ORDER, ChartTooltip(), formatLargeNumber(), formatPrice(), MarketsPage(), PriceCard(), PriceChart(), PriceChartProps (+5 more)

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

### Community 42 - "index()"
Cohesion: 0.24
Nodes (3): index(), reindex_embeddings(), webhook_server()

### Community 43 - "jira_created.yaml"
Cohesion: 0.18
Nodes (10): actions, args, on_failure, tool, channel, text, description, enabled (+2 more)

### Community 47 - "full_app()"
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

### Community 51 - "react"
Cohesion: 0.50
Nodes (4): ToolsPage(), fetchTools(), Tool, react

## Knowledge Gaps
- **30 thin communities (<3 nodes) omitted from report** — run `graphify query` to explore isolated nodes.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **Why does `get_session()` connect `get_session()` to `KnowledgeGraph`, `models.py`, `run()`, `main.py`, `test_embeddings.py`, `pathlib`, `test_event_gateway.py`, `init_db()`, `verify_webhook_signature()`, `test_platform_models.py`, `EmbeddingStore`, `test_platform_e2e.py`, `.handle_message()`?**
  _High betweenness centrality (0.045) - this node is a cross-community bridge._
- **Are the 8 inferred relationships involving `create_app()` (e.g. with `AgentConversation` and `AgentLog`) actually correct?**
  _`create_app()` has 8 INFERRED edges - model-reasoned connections that need verification._
- **Should `KnowledgeGraph` be split into smaller, more focused modules?**
  _Cohesion score 0.05794556628621598 - nodes in this community are weakly interconnected._
- **Why does `create_app()` connect `get_session()` to `models.py`, `run()`, `main.py`, `index()`, `launcher.py`, `secrets.py`, `pathlib`, `full_app()`, `init_db()`, `verify_webhook_signature()`, `test_platform_models.py`, `EmbeddingStore`, `test_event_gateway.py`, `test_platform_e2e.py`?**
  _High betweenness centrality (0.044) - this node is a cross-community bridge._
- **Are the 12 inferred relationships involving `KnowledgeGraph` (e.g. with `KnowledgeEdge` and `KnowledgeNode`) actually correct?**
  _`KnowledgeGraph` has 12 INFERRED edges - model-reasoned connections that need verification._
- **Should `EventBus` be split into smaller, more focused modules?**
  _Cohesion score 0.06458635703918723 - nodes in this community are weakly interconnected._
- **Why does `EventBus` connect `EventBus` to `run()`, `main.py`, `launcher.py`, `pathlib`, `full_app()`, `test_platform_e2e.py`?**
  _High betweenness centrality (0.035) - this node is a cross-community bridge._