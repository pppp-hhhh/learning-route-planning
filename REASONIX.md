# Reasonix project memory

Notes the user pinned via the `#` prompt prefix. The whole file is
loaded into the immutable system prefix every session — keep it terse.

- AI Learning Route Planner — API Key 配置模板
# 复制为 .env 并填入你的 key（.env 已在 .gitignore 中，不会提交）
#
# 优先级链: dart-define → .env → Secure Storage → 设置页手动输入
# 所以只要在 .env 里填一次，之后会被自动持久化到 Secure Storage，
# 以后重启/换浏览器/重新安装都不需要再配。

# AI Provider Keys（至少填一个）
CLAUDE_API_KEY=
DEEPSEEK_API_KEY=sk-c4827c22c73948e7a5f49e42662b9b74
OPENAI_API_KEY=
GROK_API_KEY=
GEMINI_API_KEY=

# AI Provider 选一个（与上方 key 对应），可选值: claude / deepseek / openai / grok / gemini
AI_PROVIDER_TYPE=deepseek

# Search Provider Keys（可选，不填则搜索功能不可用）
EXA_API_KEY=03ce3737-a8ba-438f-ba94-eff22f311926
TAVILY_API_KEY=
SERPAPI_API_KEY=

# Search Provider 选一个（与上方 key 对应），可选值: exa / tavily / serpapi
SEARCH_PROVIDER_TYPE=exa
