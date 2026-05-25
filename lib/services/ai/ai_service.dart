import 'dart:convert';
import 'package:http/http.dart' as http;

enum AIProviderType {
  claude,
  deepseek,
  openai,
  grok,
  gemini,
}

class AIProviderConfig {
  final AIProviderType type;
  final String name;
  final String logoUrl;
  final String apiUrl;
  final String docsUrl;
  final String model;

  const AIProviderConfig({
    required this.type,
    required this.name,
    required this.logoUrl,
    required this.apiUrl,
    required this.docsUrl,
    required this.model,
  });

  static const List<AIProviderConfig> providers = [
    AIProviderConfig(
      type: AIProviderType.claude,
      name: 'Claude',
      logoUrl: 'https://www.anthropic.com/images/favicons/favicon-32x32.png',
      apiUrl: 'https://api.anthropic.com/v1/messages',
      docsUrl: 'https://console.anthropic.com/',
      model: 'claude-sonnet-4-20250514',
    ),
    AIProviderConfig(
      type: AIProviderType.deepseek,
      name: 'DeepSeek',
      logoUrl: 'https://www.deepseek.com/favicon.ico',
      apiUrl: 'https://api.deepseek.com/v1/chat/completions',
      docsUrl: 'https://platform.deepseek.com/',
      model: 'deepseek-chat',
    ),
    AIProviderConfig(
      type: AIProviderType.openai,
      name: 'OpenAI',
      logoUrl: 'https://openai.com/favicons/favicon-32x32.png',
      apiUrl: 'https://api.openai.com/v1/chat/completions',
      docsUrl: 'https://platform.openai.com/',
      model: 'gpt-4-turbo',
    ),
    AIProviderConfig(
      type: AIProviderType.grok,
      name: 'Grok',
      logoUrl: 'https://x.ai/favicon.ico',
      apiUrl: 'https://api.x.ai/v1/chat/completions',
      docsUrl: 'https://console.x.ai/',
      model: 'grok-2',
    ),
    AIProviderConfig(
      type: AIProviderType.gemini,
      name: 'Gemini',
      logoUrl: 'https://www.gstatic.com/devrel-devsite/prod/v6665d47abf7f2a7a23d8e5d5f2d49d5c2e93b8e51ef3d4ba4d5d1f3e1c3a6e4b/cloudflare/static/media/gogle_favicon.ico',
      apiUrl: 'https://generativelanguage.googleapis.com/v1beta/models',
      docsUrl: 'https://aistudio.google.com/',
      model: 'gemini-1.5-pro',
    ),
  ];

  static AIProviderConfig getConfig(AIProviderType type) {
    return providers.firstWhere((p) => p.type == type);
  }
}

class AIResult {
  final bool success;
  final String? content;
  final String? error;

  const AIResult({
    required this.success,
    this.content,
    this.error,
  });
}

class AIService {
  final AIProviderType providerType;
  final String apiKey;
  final http.Client _client;

  AIService({
    required this.providerType,
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<AIResult> generateRoadmap({
    required String goal,
    required String timeframe,
    required String difficulty,
    required int dailyMinutes,
  }) async {
    final prompt = _buildRoadmapPrompt(
      goal: goal,
      timeframe: timeframe,
      difficulty: difficulty,
      dailyMinutes: dailyMinutes,
    );

    return _sendMessage(prompt);
  }

  Future<AIResult> answerQuestion({
    required String question,
    required String context,
  }) async {
    final prompt = _buildTutorPrompt(
      question: question,
      context: context,
    );

    return _sendMessage(prompt);
  }

  Future<AIResult> generateFlashcards({
    required String topic,
    required String content,
    int count = 5,
  }) async {
    final prompt = _buildFlashcardPrompt(
      topic: topic,
      content: content,
      count: count,
    );

    return _sendMessage(prompt);
  }

  Future<AIResult> searchResources({
    required String query,
    required String topic,
  }) async {
    final prompt = _buildResourceSearchPrompt(
      query: query,
      topic: topic,
    );

    return _sendMessage(prompt);
  }

  Future<AIResult> _sendMessage(String prompt) async {
    final config = AIProviderConfig.getConfig(providerType);

    try {
      final response = await _client.post(
        Uri.parse(config.apiUrl),
        headers: _buildHeaders(config.type),
        body: _buildBody(config.type, prompt, config.model),
      );

      if (response.statusCode == 200) {
        final content = _parseResponse(config.type, response.body);
        return AIResult(success: true, content: content);
      } else {
        final error = _parseError(response.body);
        return AIResult(success: false, error: error);
      }
    } catch (e) {
      return AIResult(success: false, error: e.toString());
    }
  }

  Map<String, String> _buildHeaders(AIProviderType type) {
    switch (type) {
      case AIProviderType.claude:
        return {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
          'anthropic-version': '2023-06-01',
          'anthropic-dangerous-direct-browser-access': 'true',
        };
      case AIProviderType.deepseek:
      case AIProviderType.openai:
      case AIProviderType.grok:
        return {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        };
      case AIProviderType.gemini:
        return {
          'Content-Type': 'application/json',
        };
    }
  }

  String _buildBody(AIProviderType type, String prompt, String model) {
    switch (type) {
      case AIProviderType.claude:
        return jsonEncode({
          'model': model,
          'max_tokens': 8192,
          'messages': [
            {'role': 'user', 'content': prompt}
          ],
        });
      case AIProviderType.deepseek:
      case AIProviderType.openai:
      case AIProviderType.grok:
        return jsonEncode({
          'model': model,
          'max_tokens': 8192,
          'messages': [
            {'role': 'user', 'content': prompt}
          ],
        });
      case AIProviderType.gemini:
        return jsonEncode({
          'contents': [
            {'parts': [{'text': prompt}]}
          ],
        });
    }
  }

  String _parseResponse(AIProviderType type, String body) {
    final data = jsonDecode(body);

    switch (type) {
      case AIProviderType.claude:
        return data['content'][0]['text'];
      case AIProviderType.deepseek:
      case AIProviderType.openai:
      case AIProviderType.grok:
        return data['choices'][0]['message']['content'];
      case AIProviderType.gemini:
        return data['candidates'][0]['content']['parts'][0]['text'];
    }
  }

  String _parseError(String body) {
    try {
      final data = jsonDecode(body);
      if (data['error'] != null) {
        return data['error']['message'] ?? 'Unknown error';
      }
      if (data['error'] != null && data['error'] is Map) {
        return data['error']['message'] ?? 'Unknown error';
      }
      return 'Request failed with status';
    } catch (_) {
      return 'Failed to parse error response';
    }
  }

  String _buildRoadmapPrompt({
    required String goal,
    required String timeframe,
    required String difficulty,
    required int dailyMinutes,
  }) {
    return '''
你是一位顶级教材作者。请写一本关于以下主题的**教科书式学习路线图**，风格类似《The Rust Programming Language》(TRPL) 中文版。

学习目标: $goal
时间范围: $timeframe
每日投入时间: $dailyMinutes 分钟
难度偏好: $difficulty

## 要求

输出 JSON 格式，每个阶段就是书的一章，每个任务就是一节。结构如下：

{
  "phases": [
    {
      "title": "第1章：阶段标题",
      "description": "本章学习目标（3-5条，用 **粗体** 标重点）。概述本章讲什么、为什么重要、前置知识。300-500字。",
      "weeks": 占用周数,
      "tasks": [
        {
          "title": "小节标题（具体可操作，如"3.1 变量与可变性"）",
          "description": "本节内容（300-500字），必须包含：\n1️⃣ 核心概念解释（像教科书一样讲清楚"为什么"）\n2️⃣ **代码示例**（用代码块展示，必须有实际可运行的代码）\n3️⃣ 关键知识点总结\n4️⃣ 注意事项/常见坑\n",
          "estimated_minutes": 分钟,
          "type": "learning|practice|project|review",
          "exercises": ["练习题1", "练习题2", "练习题3（思考题）"],
          "deliverable": "本节学完后的产出"
        }
      ],
      "project": {
        "title": "本章实战项目",
        "description": "综合运用本章知识做一个项目，描述项目需求和步骤"
      },
      "summary": "本章总结（3-5条核心收获）"
    }
  ]
}

## 结构要求

每章（phase）的结构：
1. **学习目标** — 3-5条，让读者知道学完能做什么
2. **若干节（tasks）** — 每节讲透一个知识点
3. **实战项目** — 综合运用本章知识
4. **本章总结** — 复习要点

每节（task）必须有：
- 概念讲解 + **代码示例**（放代码块里）
- 关键知识点总结
- 练习题（至少2道）

## 风格要求
- 像教科书一样：概念 → 为什么 → 怎么做 → 例子 → 练习
- 语言通俗但有深度，初学者能看懂，进阶者有收获
- 代码示例必须是**真实可运行的**，不能是伪代码
- 根据 $difficulty 调整深度，$dailyMinutes 分钟/天安排时间
- 总时间跨度符合 $timeframe

请只返回JSON，不要有其他内容。
''';
  }

  String _buildTutorPrompt({
    required String question,
    required String context,
  }) {
    return '''
你是一位耐心、专业的AI学习导师。用户正在学习以下内容：

学习上下文：
$context

用户问题：$question

请提供：
1. 直接回答用户的问题
2. 如果适用，提供具体的例子或类比
3. 如果有帮助，建议相关资源或练习

回答要：
- 简洁但全面
- 适合学习者的当前水平
- 使用易懂的语言
- 在适当时候使用列表或步骤说明
''';
  }

  String _buildFlashcardPrompt({
    required String topic,
    required String content,
    required int count,
  }) {
    return '''
你是一位教学设计专家。请根据以下内容创建闪卡。

主题: $topic
内容: $content
数量: $count

请生成JSON格式的闪卡：
{
  "flashcards": [
    {
      "question": "问题",
      "answer": "答案"
    }
  ]
}

要求：
- 问题要简洁明确
- 答案要准确完整
- 覆盖核心概念
- 不要创建相似或重复的卡片

请只返回JSON，不要有其他内容。
''';
  }

  String _buildResourceSearchPrompt({
    required String query,
    required String topic,
  }) {
    return '''
你是一位资源搜索专家。请为以下学习主题搜索高质量的学习资源。

学习主题: $topic
用户查询: $query

请生成JSON格式的资源列表：
{
  "resources": [
    {
      "title": "资源标题",
      "url": "资源链接",
      "type": "course|tutorial|documentation|video|book|article",
      "difficulty": "beginner|intermediate|advanced",
      "estimated_minutes": 预估学习时长(分钟),
      "rating": 4.5,
      "is_free": true,
      "description": "简短描述"
    }
  ]
}

要求：
- 资源应该是知名平台的高质量内容
- 包含多种类型（课程、视频、文档、书籍等）
- 难度要匹配学习主题
- 优先推荐免费资源

请只返回JSON，不要有其他内容。
''';
  }

  void dispose() {
    _client.close();
  }
}
