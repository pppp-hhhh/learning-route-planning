/// 统一 API Key 名称常量 + dart-define / .env 映射表
///
/// 所有涉及 key 存储/读取的地方都引用这里，避免字符串散落各处。
class KeyNames {
  // ── 内部存储 key（FlutterSecureStorage / SharedPreferences 用） ──
  static const String claudeApiKey = 'claude_api_key';
  static const String deepseekApiKey = 'deepseek_api_key';
  static const String openaiApiKey = 'openai_api_key';
  static const String grokApiKey = 'grok_api_key';
  static const String geminiApiKey = 'gemini_api_key';
  static const String exaApiKey = 'exa_api_key';
  static const String tavilyApiKey = 'tavily_api_key';
  static const String serpapiApiKey = 'serpapi_api_key';
  static const String aiProviderType = 'ai_provider_type';
  static const String searchProviderType = 'search_provider_type';

  /// 所有 API Key 的内部 key 列表（不含 type）
  static const List<String> allApiKeys = [
    claudeApiKey,
    deepseekApiKey,
    openaiApiKey,
    grokApiKey,
    geminiApiKey,
    exaApiKey,
    tavilyApiKey,
    serpapiApiKey,
  ];

  // ── dart-define / .env 环境变量名（全大写 + 下划线） ──
  static const String envClaude = 'CLAUDE_API_KEY';
  static const String envDeepseek = 'DEEPSEEK_API_KEY';
  static const String envOpenai = 'OPENAI_API_KEY';
  static const String envGrok = 'GROK_API_KEY';
  static const String envGemini = 'GEMINI_API_KEY';
  static const String envExa = 'EXA_API_KEY';
  static const String envTavily = 'TAVILY_API_KEY';
  static const String envSerpapi = 'SERPAPI_API_KEY';

  /// 内部 key → 环境变量名的映射
  static const Map<String, String> keyToEnv = {
    claudeApiKey: envClaude,
    deepseekApiKey: envDeepseek,
    openaiApiKey: envOpenai,
    grokApiKey: envGrok,
    geminiApiKey: envGemini,
    exaApiKey: envExa,
    tavilyApiKey: envTavily,
    serpapiApiKey: envSerpapi,
  };

  /// 给定内部 key，返回对应的 dart-define / .env 变量名
  static String envNameFor(String internalKey) => keyToEnv[internalKey] ?? internalKey;
}
