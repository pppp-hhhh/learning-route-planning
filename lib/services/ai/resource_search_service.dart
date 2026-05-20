import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';

class ResourceSearchService {
  final String apiKey;
  final http.Client _client;

  ResourceSearchService({
    required this.apiKey,
    http.Client? client,
  }) : _client = client ?? http.Client();

  Future<List<SearchResult>> searchResources({
    required String query,
    required String topic,
    int limit = 20,
    List<String>? resourceTypes,
    String? difficulty,
  }) async {
    try {
      // Build the search query
      final searchQuery = _buildSearchQuery(query, topic, resourceTypes, difficulty);

      final response = await _client.post(
        Uri.parse('${AppConstants.exaApiUrl}/search'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': apiKey,
        },
        body: jsonEncode({
          'query': searchQuery,
          'num_results': limit,
          'type': 'auto',
          'category': 'learning',
          'subcategory': resourceTypes ?? ['course', 'tutorial', 'video', 'book', 'documentation'],
          'text': true,
          'highlights': true,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return _parseResults(data);
      } else {
        final error = jsonDecode(response.body);
        throw Exception('Exa API error: ${error['error']}');
      }
    } catch (e) {
      throw Exception('Failed to search resources: $e');
    }
  }

  String _buildSearchQuery(
    String query,
    String topic,
    List<String>? resourceTypes,
    String? difficulty,
  ) {
    final parts = <String>[];

    parts.add(topic);
    parts.add(query);

    if (resourceTypes != null && resourceTypes.isNotEmpty) {
      parts.add(resourceTypes.join(' OR '));
    }

    if (difficulty != null) {
      parts.add('$difficulty level');
    }

    parts.add('tutorial course book documentation video');

    return parts.join(' ');
  }

  List<SearchResult> _parseResults(Map<String, dynamic> data) {
    final results = <SearchResult>[];

    if (data['results'] != null) {
      for (final item in data['results']) {
        results.add(SearchResult(
          id: item['id'] ?? '',
          title: item['title'] ?? 'Untitled',
          url: item['url'] ?? '',
          snippet: item['snippet'] ?? '',
          type: _inferResourceType(item['url'] ?? ''),
          publishedDate: item['published_date'],
          score: (item['score'] ?? 0).toDouble(),
        ));
      }
    }

    return results;
  }

  String _inferResourceType(String url) {
    final lowerUrl = url.toLowerCase();

    if (lowerUrl.contains('coursera') ||
        lowerUrl.contains('udemy') ||
        lowerUrl.contains('edx') ||
        lowerUrl.contains('codecademy') ||
        lowerUrl.contains('pluralsight')) {
      return 'course';
    } else if (lowerUrl.contains('youtube') ||
        lowerUrl.contains('vimeo') ||
        lowerUrl.contains('coursera.org/learn')) {
      return 'video';
    } else if (lowerUrl.contains('github') ||
        lowerUrl.contains('readme') ||
        lowerUrl.contains('wiki')) {
      return 'documentation';
    } else if (lowerUrl.contains('medium') ||
        lowerUrl.contains('dev.to') ||
        lowerUrl.contains('blog')) {
      return 'article';
    } else if (lowerUrl.contains('amazon') ||
        lowerUrl.contains('book')) {
      return 'book';
    } else {
      return 'tutorial';
    }
  }

  void dispose() {
    _client.close();
  }
}

class SearchResult {
  final String id;
  final String title;
  final String url;
  final String snippet;
  final String type;
  final String? publishedDate;
  final double score;

  SearchResult({
    required this.id,
    required this.title,
    required this.url,
    required this.snippet,
    required this.type,
    this.publishedDate,
    required this.score,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'url': url,
        'snippet': snippet,
        'type': type,
        'published_date': publishedDate,
        'score': score,
      };

  factory SearchResult.fromJson(Map<String, dynamic> json) => SearchResult(
        id: json['id'] ?? '',
        title: json['title'] ?? 'Untitled',
        url: json['url'] ?? '',
        snippet: json['snippet'] ?? '',
        type: json['type'] ?? 'tutorial',
        publishedDate: json['published_date'],
        score: (json['score'] ?? 0).toDouble(),
      );
}
