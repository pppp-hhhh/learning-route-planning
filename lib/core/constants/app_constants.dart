class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'AI Learning Route Planner';
  static const String appVersion = '1.0.0';

  // AI Configuration
  static const String claudeApiUrl = 'https://api.anthropic.com/v1/messages';
  static const String claudeModel = 'claude-sonnet-4-20250514';
  static const int claudeMaxTokens = 4096;

  // Search API (Exa for web search)
  static const String exaApiUrl = 'https://api.exa.ai/search';
  static const String unsearchApiUrl = 'https://api.unsearch.ai/search';
  static const int defaultSearchLimit = 20;

  // Database
  static const String databaseName = 'learning_route_planner.db';

  // Spaced Repetition (SM-2) defaults
  static const double defaultEaseFactor = 2.5;
  static const double minEaseFactor = 1.3;
  static const double maxEaseFactor = 2.5;
  static const int initialInterval = 1;
  static const int secondInterval = 6;

  // UI Constants
  static const double minTouchTarget = 44.0;
  static const double borderRadius = 12.0;
  static const double cardElevation = 2.0;

  // Animation durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 350);
  static const Duration longAnimation = Duration(milliseconds: 500);

  // Learning defaults
  static const int defaultDailyMinutes = 30;
  static const int minDailyMinutes = 15;
  static const int maxDailyMinutes = 180;

  // Resource types
  static const List<String> resourceTypes = [
    'course',
    'tutorial',
    'documentation',
    'video',
    'book',
    'article',
    'practice',
    'community',
  ];

  // Difficulty levels
  static const List<String> difficultyLevels = [
    'beginner',
    'intermediate',
    'advanced',
  ];

  // Roadmap statuses
  static const String statusActive = 'active';
  static const String statusPaused = 'paused';
  static const String statusCompleted = 'completed';
  static const String statusAbandoned = 'abandoned';

  // Task statuses
  static const String taskPending = 'pending';
  static const String taskInProgress = 'in_progress';
  static const String taskCompleted = 'completed';
  static const String taskSkipped = 'skipped';
}
