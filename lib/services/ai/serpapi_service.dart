import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';

class SerpapiService {
  final String apiKey;
  final http.Client _client;

  SerpapiService({
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<List<SerpapiResult>> searchResources({
    required String query,
    int limit = 20,
  }) async {
    try {
      final uri = Uri.parse(AppConstants.serpapiApiUrl).replace(
        queryParameters: {
          'q': query,
          'api_key': apiKey,
          'engine': 'google',
          'num': limit.toString(),
        },
      );

      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _parseResults(data);
      } else {
        final error = jsonDecode(response.body);
        throw Exception('SerpAPI error: ${error['error'] ?? 'Unknown error'}');
      }
    } catch (e) {
      throw Exception('Failed to search resources: $e');
    }
  }

  List<SerpapiResult> _parseResults(Map<String, dynamic> data) {
    final results = <SerpapiResult>[];

    if (data['organic_results'] != null) {
      for (final item in data['organic_results']) {
        results.add(SerpapiResult(
          title: item['title'] ?? 'Untitled',
          url: item['link'] ?? '',
          snippet: item['snippet'] ?? '',
        ));
      }
    }

    return results;
  }

  void dispose() {
    _client.close();
  }
}

class SerpapiResult {
  final String title;
  final String url;
  final String snippet;

  SerpapiResult({
    required this.title,
    required this.url,
    required this.snippet,
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
