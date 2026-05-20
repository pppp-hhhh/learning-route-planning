import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';

class ClaudeService {
  final String apiKey;
  final http.Client _client;

  ClaudeService({
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<String> generateRoadmap({
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

  Future<String> searchResources({
    required String query,
    required String topic,
    int limit = 20,
  }) async {
    final prompt = _buildResourceSearchPrompt(
      query: query,
      topic: topic,
      limit: limit,
    );

    return _sendMessage(prompt);
  }

  Future<String> generateFlashcards({
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

  Future<String> answerQuestion({
    required String question,
    required String context,
  }) async {
    final prompt = _buildTutorPrompt(
      question: question,
      context: context,
    );

    return _sendMessage(prompt);
  }

  String _buildRoadmapPrompt({
    required String goal,
    required String timeframe,
    required String difficulty,
    required int dailyMinutes,
  }) {
    return '''
你是一位专业的学习路径规划师。请为以下学习目标创建一个结构化的学习路线图。

学习目标: $goal
时间范围: $timeframe
每日投入时间: $dailyMinutes 分钟
难度偏好: $difficulty

请生成一个JSON格式的学习路线图，包含以下结构：
{
  "phases": [
    {
      "title": "阶段标题",
      "description": "阶段描述",
      "tasks": [
        {
          "title": "任务标题",
          "description": "任务描述",
          "estimated_minutes": 预估分钟数,
          "type": "learning|practice|review"
        }
      ]
    }
  ]
}

要求：
- 3-6个主要阶段
- 每个阶段3-8个任务
- 任务应该具体、可执行
- 确保学习顺序合理（从基础到高级）
- 总时长应该符合目标时间范围

请只返回JSON，不要有其他内容。
''';
  }

  String _buildResourceSearchPrompt({
    required String query,
    required String topic,
    required int limit,
  }) {
    return '''
你是一位资源搜索专家。请为以下学习主题搜索高质量的学习资源。

学习主题: $topic
用户查询: $query
需要数量: $limit

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

  Future<String> _sendMessage(String prompt) async {
    try {
      final response = await _client.post(
        Uri.parse(AppConstants.claudeApiUrl),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
          'anthropic-version': '2023-06-01',
          'anthropic-dangerous-direct-browser-access': 'true',
        },
        body: jsonEncode({
          'model': AppConstants.claudeModel,
          'max_tokens': AppConstants.claudeMaxTokens,
          'messages': [
            {
              'role': 'user',
              'content': prompt,
            }
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['content'][0]['text'];
      } else {
        final error = jsonDecode(response.body);
        throw Exception('Claude API error: ${error['error']['type']} - ${error['error']['message']}');
      }
    } catch (e) {
      throw Exception('Failed to call Claude API: $e');
    }
  }

  void dispose() {
    _client.close();
  }
}
