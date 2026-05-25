import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_learning_route_planner/core/secure/key_names.dart';
import 'package:ai_learning_route_planner/core/secure/secure_key_storage.dart';
import 'package:ai_learning_route_planner/core/database/app_database.dart';
import 'package:ai_learning_route_planner/services/ai/claude_service.dart';
import 'package:ai_learning_route_planner/services/ai/resource_search_service.dart';
import 'package:ai_learning_route_planner/services/ai/tavily_service.dart';
import 'package:ai_learning_route_planner/services/ai/serpapi_service.dart';
import 'package:ai_learning_route_planner/services/ai/ai_service.dart';

// Search Provider Type
enum SearchProviderType {
  exa,
  tavily,
  serpapi,
}

// Database Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// SharedPreferences Provider (for non-sensitive preferences e.g. theme)
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

// Secure Key Storage Provider (for API keys and provider types)
final secureKeyStorageProvider = Provider<SecureKeyStorage>((ref) {
  return SecureKeyStorage();
});

// ── Claude API Key ──
final claudeApiKeyProvider = StateNotifierProvider<ClaudeApiKeyNotifier, String>((ref) {
  return ClaudeApiKeyNotifier(ref);
});

class ClaudeApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  ClaudeApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.claudeApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.claudeApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.claudeApiKey);
  }
}

// ── DeepSeek API Key ──
final deepseekApiKeyProvider = StateNotifierProvider<DeepseekApiKeyNotifier, String>((ref) {
  return DeepseekApiKeyNotifier(ref);
});

class DeepseekApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  DeepseekApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.deepseekApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.deepseekApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.deepseekApiKey);
  }
}

// ── OpenAI API Key ──
final openaiApiKeyProvider = StateNotifierProvider<OpenaiApiKeyNotifier, String>((ref) {
  return OpenaiApiKeyNotifier(ref);
});

class OpenaiApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  OpenaiApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.openaiApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.openaiApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.openaiApiKey);
  }
}

// ── Grok API Key ──
final grokApiKeyProvider = StateNotifierProvider<GrokApiKeyNotifier, String>((ref) {
  return GrokApiKeyNotifier(ref);
});

class GrokApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  GrokApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.grokApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.grokApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.grokApiKey);
  }
}

// ── Gemini API Key ──
final geminiApiKeyProvider = StateNotifierProvider<GeminiApiKeyNotifier, String>((ref) {
  return GeminiApiKeyNotifier(ref);
});

class GeminiApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  GeminiApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.geminiApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.geminiApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.geminiApiKey);
  }
}

// ── Exa API Key ──
final exaApiKeyProvider = StateNotifierProvider<ExaApiKeyNotifier, String>((ref) {
  return ExaApiKeyNotifier(ref);
});

class ExaApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  ExaApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.exaApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.exaApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.exaApiKey);
  }
}

// ── Tavily API Key ──
final tavilyApiKeyProvider = StateNotifierProvider<TavilyApiKeyNotifier, String>((ref) {
  return TavilyApiKeyNotifier(ref);
});

class TavilyApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  TavilyApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.tavilyApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.tavilyApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.tavilyApiKey);
  }
}

// ── SerpAPI Key ──
final serpapiApiKeyProvider = StateNotifierProvider<SerpapiApiKeyNotifier, String>((ref) {
  return SerpapiApiKeyNotifier(ref);
});

class SerpapiApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  SerpapiApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final storage = ref.read(secureKeyStorageProvider);
    state = await storage.read(KeyNames.serpapiApiKey);
  }

  Future<void> setKey(String key) async {
    state = key;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.serpapiApiKey, key);
  }

  Future<void> clearKey() async {
    state = '';
    final storage = ref.read(secureKeyStorageProvider);
    await storage.delete(KeyNames.serpapiApiKey);
  }
}

// ── Search Provider Type ──
final searchProviderTypeProvider =
    StateNotifierProvider<SearchProviderTypeNotifier, SearchProviderType>((ref) {
  return SearchProviderTypeNotifier(ref);
});

class SearchProviderTypeNotifier extends StateNotifier<SearchProviderType> {
  final Ref ref;

  SearchProviderTypeNotifier(this.ref) : super(SearchProviderType.exa) {
    _loadType();
  }

  Future<void> _loadType() async {
    final storage = ref.read(secureKeyStorageProvider);
    final typeString = await storage.read(KeyNames.searchProviderType);
    if (typeString.isNotEmpty) {
      state = SearchProviderType.values.firstWhere(
        (e) => e.name == typeString,
        orElse: () => SearchProviderType.exa,
      );
    }
  }

  Future<void> setProvider(SearchProviderType type) async {
    state = type;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.searchProviderType, type.name);
  }
}

// ── AI Provider Type ──
final aiProviderTypeProvider =
    StateNotifierProvider<AIProviderTypeNotifier, AIProviderType>((ref) {
  return AIProviderTypeNotifier(ref);
});

class AIProviderTypeNotifier extends StateNotifier<AIProviderType> {
  final Ref ref;

  AIProviderTypeNotifier(this.ref) : super(AIProviderType.claude) {
    _loadType();
  }

  Future<void> _loadType() async {
    final storage = ref.read(secureKeyStorageProvider);
    final typeString = await storage.read(KeyNames.aiProviderType);
    if (typeString.isNotEmpty) {
      state = AIProviderType.values.firstWhere(
        (e) => e.name == typeString,
        orElse: () => AIProviderType.claude,
      );
    }
  }

  Future<void> setProvider(AIProviderType type) async {
    state = type;
    final storage = ref.read(secureKeyStorageProvider);
    await storage.write(KeyNames.aiProviderType, type.name);
  }
}

// Check if API is configured
// 注意：内联 ref.watch() 而非 ref.read()，确保 _loadKey() 异步完成后自动重新求值
final isApiConfiguredProvider = Provider<bool>((ref) {
  final providerType = ref.watch(aiProviderTypeProvider);
  final apiKey = switch (providerType) {
    AIProviderType.claude => ref.watch(claudeApiKeyProvider),
    AIProviderType.deepseek => ref.watch(deepseekApiKeyProvider),
    AIProviderType.openai => ref.watch(openaiApiKeyProvider),
    AIProviderType.grok => ref.watch(grokApiKeyProvider),
    AIProviderType.gemini => ref.watch(geminiApiKeyProvider),
  };
  return apiKey.isNotEmpty;
});

// Service Providers
final aiServiceProvider = Provider<AIService?>((ref) {
  final providerType = ref.watch(aiProviderTypeProvider);
  final apiKey = switch (providerType) {
    AIProviderType.claude => ref.watch(claudeApiKeyProvider),
    AIProviderType.deepseek => ref.watch(deepseekApiKeyProvider),
    AIProviderType.openai => ref.watch(openaiApiKeyProvider),
    AIProviderType.grok => ref.watch(grokApiKeyProvider),
    AIProviderType.gemini => ref.watch(geminiApiKeyProvider),
  };
  if (apiKey.isEmpty) return null;
  return AIService(providerType: providerType, apiKey: apiKey);
});

final claudeServiceProvider = Provider<ClaudeService?>((ref) {
  final apiKey = ref.watch(claudeApiKeyProvider);
  if (apiKey.isEmpty) return null;
  return ClaudeService(apiKey: apiKey);
});

final exaServiceProvider = Provider<ResourceSearchService?>((ref) {
  final apiKey = ref.watch(exaApiKeyProvider);
  if (apiKey.isEmpty) return null;
  return ResourceSearchService(apiKey: apiKey);
});

final tavilyServiceProvider = Provider<TavilyService?>((ref) {
  final apiKey = ref.watch(tavilyApiKeyProvider);
  if (apiKey.isEmpty) return null;
  return TavilyService(apiKey: apiKey);
});

final serpapiServiceProvider = Provider<SerpapiService?>((ref) {
  final apiKey = ref.watch(serpapiApiKeyProvider);
  if (apiKey.isEmpty) return null;
  return SerpapiService(apiKey: apiKey);
});

// Roadmap Providers
final roadmapsProvider = StreamProvider<List<Roadmap>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllRoadmaps();
});

final roadmapByIdProvider = FutureProvider.family<Roadmap?, String>((ref, id) {
  final db = ref.watch(databaseProvider);
  return db.getRoadmapById(id);
});

final roadmapPhasesProvider =
    StreamProvider.family<List<Phase>, String>((ref, roadmapId) {
  final db = ref.watch(databaseProvider);
  return db.watchPhasesByRoadmapId(roadmapId);
});

final roadmapProgressProvider =
    FutureProvider.family<Map<String, int>, String>((ref, roadmapId) async {
  final db = ref.watch(databaseProvider);
  return db.getRoadmapProgress(roadmapId);
});

// Resource Providers
final allResourcesProvider = StreamProvider<List<Resource>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchAllResources();
});

final bookmarkedResourcesProvider = StreamProvider<List<Resource>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchBookmarkedResources();
});

final taskResourcesProvider =
    FutureProvider.family<List<Resource>, String>((ref, taskId) async {
  final db = ref.watch(databaseProvider);
  return db.getResourcesByTaskId(taskId);
});

// Flashcard Providers
final dueFlashcardsProvider = StreamProvider<List<Flashcard>>((ref) {
  final db = ref.watch(databaseProvider);
  return db.watchDueFlashcards();
});

final roadmapFlashcardsProvider =
    FutureProvider.family<List<Flashcard>, String>((ref, roadmapId) async {
  final db = ref.watch(databaseProvider);
  return db.getFlashcardsByRoadmapId(roadmapId);
});

final dueReviewCountProvider = FutureProvider<int>((ref) async {
  final db = ref.watch(databaseProvider);
  return db.getDueReviewCount();
});

// RoadMap Generation State
class RoadmapGenerationState {
  final bool isGenerating;
  final String? error;
  final String? generatedJson;

  const RoadmapGenerationState({
    this.isGenerating = false,
    this.error,
    this.generatedJson,
  });

  RoadmapGenerationState copyWith({
    bool? isGenerating,
    String? error,
    String? generatedJson,
  }) {
    return RoadmapGenerationState(
      isGenerating: isGenerating ?? this.isGenerating,
      error: error,
      generatedJson: generatedJson,
    );
  }
}

class RoadmapGenerationNotifier extends StateNotifier<RoadmapGenerationState> {
  final Ref ref;

  RoadmapGenerationNotifier(this.ref) : super(const RoadmapGenerationState());

  Future<void> generateRoadmap({
    required String goal,
    required String timeframe,
    required String difficulty,
    required int dailyMinutes,
  }) async {
    final aiService = ref.read(aiServiceProvider);
    if (aiService == null) {
      state = state.copyWith(
        isGenerating: false,
        error: 'API key not configured. Please add your API key in Settings.',
      );
      return;
    }

    state = state.copyWith(isGenerating: true, error: null);

    try {
      final result = await aiService.generateRoadmap(
        goal: goal,
        timeframe: timeframe,
        difficulty: difficulty,
        dailyMinutes: dailyMinutes,
      );
      if (result.success && result.content != null) {
        state = state.copyWith(isGenerating: false, generatedJson: result.content);
      } else {
        state = state.copyWith(
          isGenerating: false,
          error: result.error ?? 'Failed to generate roadmap',
        );
      }
    } catch (e) {
      state = state.copyWith(isGenerating: false, error: e.toString());
    }
  }

  void reset() {
    state = const RoadmapGenerationState();
  }
}

final roadmapGenerationProvider =
    StateNotifierProvider<RoadmapGenerationNotifier, RoadmapGenerationState>(
        (ref) {
  return RoadmapGenerationNotifier(ref);
});

// Resource Search State
class ResourceSearchState {
  final bool isSearching;
  final String? error;
  final List<Map<String, dynamic>>? results;

  const ResourceSearchState({
    this.isSearching = false,
    this.error,
    this.results,
  });

  ResourceSearchState copyWith({
    bool? isSearching,
    String? error,
    List<Map<String, dynamic>>? results,
  }) {
    return ResourceSearchState(
      isSearching: isSearching ?? this.isSearching,
      error: error,
      results: results ?? this.results,
    );
  }
}

class ResourceSearchNotifier extends StateNotifier<ResourceSearchState> {
  final Ref ref;

  ResourceSearchNotifier(this.ref) : super(const ResourceSearchState());

  Future<void> searchResources({
    required String query,
    required String topic,
    int limit = 20,
  }) async {
    final searchType = ref.read(searchProviderTypeProvider);
    final searchQuery = '$topic $query';

    if (searchType == SearchProviderType.exa) {
      final exaService = ref.read(exaServiceProvider);
      if (exaService == null) {
        state = state.copyWith(
          isSearching: false,
          error: 'Exa API key not configured. Please add your API key in Settings.',
        );
        return;
      }

      state = state.copyWith(isSearching: true, error: null);

      try {
        final results = await exaService.searchResources(
          query: searchQuery,
          topic: topic,
          limit: limit,
        );
        state = state.copyWith(
          isSearching: false,
          results: results.map((r) => {
            'id': r.id,
            'title': r.title,
            'url': r.url,
            'snippet': r.snippet,
            'type': r.type,
            'score': r.score,
          }).toList(),
        );
      } catch (e) {
        state = state.copyWith(isSearching: false, error: e.toString());
      }
    } else if (searchType == SearchProviderType.tavily) {
      final tavilyService = ref.read(tavilyServiceProvider);
      if (tavilyService == null) {
        state = state.copyWith(
          isSearching: false,
          error: 'Tavily API key not configured. Please add your API key in Settings.',
        );
        return;
      }

      state = state.copyWith(isSearching: true, error: null);

      try {
        final results = await tavilyService.searchResources(
          query: searchQuery,
          limit: limit,
        );
        state = state.copyWith(
          isSearching: false,
          results: results.map((r) => {
            'id': r.url,
            'title': r.title,
            'url': r.url,
            'snippet': r.snippet,
            'type': r.type,
            'score': r.score,
          }).toList(),
        );
      } catch (e) {
        state = state.copyWith(isSearching: false, error: e.toString());
      }
    } else if (searchType == SearchProviderType.serpapi) {
      final serpapiService = ref.read(serpapiServiceProvider);
      if (serpapiService == null) {
        state = state.copyWith(
          isSearching: false,
          error: 'SerpAPI key not configured. Please add your API key in Settings.',
        );
        return;
      }

      state = state.copyWith(isSearching: true, error: null);

      try {
        final results = await serpapiService.searchResources(
          query: searchQuery,
          limit: limit,
        );
        state = state.copyWith(
          isSearching: false,
          results: results.map((r) => {
            'id': r.url,
            'title': r.title,
            'url': r.url,
            'snippet': r.snippet,
            'type': r.type,
            'score': 1.0,
          }).toList(),
        );
      } catch (e) {
        state = state.copyWith(isSearching: false, error: e.toString());
      }
    }
  }

  void reset() {
    state = const ResourceSearchState();
  }
}

final resourceSearchProvider =
    StateNotifierProvider<ResourceSearchNotifier, ResourceSearchState>((ref) {
  return ResourceSearchNotifier(ref);
});

// Flashcard Review State
class FlashcardReviewState {
  final int currentIndex;
  final bool isFlipped;
  final int correctCount;
  final int incorrectCount;
  final bool isComplete;

  const FlashcardReviewState({
    this.currentIndex = 0,
    this.isFlipped = false,
    this.correctCount = 0,
    this.incorrectCount = 0,
    this.isComplete = false,
  });

  FlashcardReviewState copyWith({
    int? currentIndex,
    bool? isFlipped,
    int? correctCount,
    int? incorrectCount,
    bool? isComplete,
  }) {
    return FlashcardReviewState(
      currentIndex: currentIndex ?? this.currentIndex,
      isFlipped: isFlipped ?? this.isFlipped,
      correctCount: correctCount ?? this.correctCount,
      incorrectCount: incorrectCount ?? this.incorrectCount,
      isComplete: isComplete ?? this.isComplete,
    );
  }

  int get totalAnswered => correctCount + incorrectCount;
  double get accuracy => totalAnswered > 0 ? correctCount / totalAnswered : 0;
}

class FlashcardReviewNotifier extends StateNotifier<FlashcardReviewState> {
  final int totalCards;

  FlashcardReviewNotifier(this.totalCards) : super(const FlashcardReviewState());

  void flipCard() {
    state = state.copyWith(isFlipped: !state.isFlipped);
  }

  void answerCard(bool isCorrect) {
    if (isCorrect) {
      state = state.copyWith(correctCount: state.correctCount + 1);
    } else {
      state = state.copyWith(incorrectCount: state.incorrectCount + 1);
    }

    if (state.currentIndex < totalCards - 1) {
      state = state.copyWith(
        currentIndex: state.currentIndex + 1,
        isFlipped: false,
      );
    } else {
      state = state.copyWith(isComplete: true);
    }
  }

  void reset() {
    state = const FlashcardReviewState();
  }
}

final flashcardReviewProvider = StateNotifierProvider.family<
    FlashcardReviewNotifier, FlashcardReviewState, int>((ref, totalCards) {
  return FlashcardReviewNotifier(totalCards);
});

// Theme Mode Provider
final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, bool>((ref) {
  return ThemeModeNotifier(ref);
});

class ThemeModeNotifier extends StateNotifier<bool> {
  final Ref ref;

  ThemeModeNotifier(this.ref) : super(false) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    state = prefs.getBool('dark_mode') ?? false;
  }

  Future<void> toggleTheme() async {
    state = !state;
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setBool('dark_mode', state);
  }
}
