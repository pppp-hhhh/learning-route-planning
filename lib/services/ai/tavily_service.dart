import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';

class TavilyService {
  final String apiKey;
  final http.Client _client;

  TavilyService({
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<List<TavilyResult>> searchResources({
    required String query,
    int limit = 20,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(AppConstants.tavilyApiUrl),
        headers: {
          'Content-Type': 'application/json',
          'api-key': apiKey,
        },
        body: jsonEncode({
          'query': query,
          'search_depth': 'basic',
          'max_results': limit,
          'include_answer': false,
          'include_raw_content': false,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _parseResults(data);
      } else {
        final error = jsonDecode(response.body);
        throw Exception('Tavily API error: ${error['detail'] ?? error['error']}');
      }
    } catch (e) {
      throw Exception('Failed to search resources: $e');
    }
  }

  List<TavilyResult> _parseResults(Map<String, dynamic> data) {
    final results = <TavilyResult>[];

    if (data['results'] != null) {
      for (final item in data['results']) {
        results.add(TavilyResult(
          title: item['title'] ?? 'Untitled',
          url: item['url'] ?? '',
          snippet: item['content'] ?? '',
          publishedDate: item['published_date'],
          score: (item['score'] ?? 0).toDouble(),
        ));
      }
    }

    return results;
  }

  void dispose() {
    _client.close();
  }
}

class TavilyResult {
  final String title;
  final String url;
  final String snippet;
  final String? publishedDate;
  final double score;

  TavilyResult({
    required this.title,
    required this.url,
    required this.snippet,
    this.publishedDate,
    required this.score,
  });

  String get type {
    final lowerUrl = url.toLowerCase();
    if (lowerUrl.contains('youtube') || lowerUrl.contains('vimeo')) {
      return 'video';
    } else if (lowerUrl.contains('coursera') ||
        lowerUrl.contains('udemy') ||
        lowerUrl.contains('edx')) {
      return 'course';
    } else if (lowerUrl.contains('github') || lowerUrl.contains('readme')) {
      return 'documentation';
    } else if (lowerUrl.contains('medium') ||
        lowerUrl.contains('dev.to') ||
        lowerUrl.contains('blog')) {
      return 'article';
    } else if (lowerUrl.contains('amazon') || lowerUrl.contains('book')) {
      return 'book';
    } else {
      return 'tutorial';
    }
  }
}
