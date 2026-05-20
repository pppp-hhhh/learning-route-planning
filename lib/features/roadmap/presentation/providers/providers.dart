import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_learning_route_planner/core/database/app_database.dart';
import 'package:ai_learning_route_planner/services/ai/claude_service.dart';
import 'package:ai_learning_route_planner/services/ai/resource_search_service.dart';
import 'package:ai_learning_route_planner/services/ai/unsearch_service.dart';
import 'package:ai_learning_route_planner/services/ai/ai_service.dart';

// Keys for SharedPreferences
const String _claudeApiKeyPref = 'claude_api_key';
const String _exaApiKeyPref = 'exa_api_key';
const String _unsearchApiKeyPref = 'unsearch_api_key';
const String _aiProviderTypePref = 'ai_provider_type';
const String _searchProviderTypePref = 'search_provider_type';

// Search Provider Type
enum SearchProviderType {
  exa,
  unsearch,
}

// Database Provider
final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

// SharedPreferences Provider
final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

// Claude API Key Provider (persisted)
final claudeApiKeyProvider = StateNotifierProvider<ClaudeApiKeyNotifier, String>((ref) {
  return ClaudeApiKeyNotifier(ref);
});

class ClaudeApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  ClaudeApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    state = prefs.getString(_claudeApiKeyPref) ?? '';
  }

  Future<void> setKey(String key) async {
    state = key;
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(_claudeApiKeyPref, key);
  }

  Future<void> clearKey() async {
    state = '';
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.remove(_claudeApiKeyPref);
  }
}

// Exa API Key Provider (persisted)
final exaApiKeyProvider = StateNotifierProvider<ExaApiKeyNotifier, String>((ref) {
  return ExaApiKeyNotifier(ref);
});

class ExaApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  ExaApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    state = prefs.getString(_exaApiKeyPref) ?? '';
  }

  Future<void> setKey(String key) async {
    state = key;
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(_exaApiKeyPref, key);
  }

  Future<void> clearKey() async {
    state = '';
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.remove(_exaApiKeyPref);
  }
}

// UnSearch API Key Provider (persisted)
final unsearchApiKeyProvider = StateNotifierProvider<UnsearchApiKeyNotifier, String>((ref) {
  return UnsearchApiKeyNotifier(ref);
});

class UnsearchApiKeyNotifier extends StateNotifier<String> {
  final Ref ref;

  UnsearchApiKeyNotifier(this.ref) : super('') {
    _loadKey();
  }

  Future<void> _loadKey() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    state = prefs.getString(_unsearchApiKeyPref) ?? '';
  }

  Future<void> setKey(String key) async {
    state = key;
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(_unsearchApiKeyPref, key);
  }

  Future<void> clearKey() async {
    state = '';
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.remove(_unsearchApiKeyPref);
  }
}

// Search Provider Type Provider (persisted)
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
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final typeString = prefs.getString(_searchProviderTypePref);
    if (typeString != null) {
      state = SearchProviderType.values.firstWhere(
        (e) => e.name == typeString,
        orElse: () => SearchProviderType.exa,
      );
    }
  }

  Future<void> setProvider(SearchProviderType type) async {
    state = type;
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(_searchProviderTypePref, type.name);
  }
}

// AI Provider Type Provider (persisted)
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
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final typeString = prefs.getString(_aiProviderTypePref);
    if (typeString != null) {
      state = AIProviderType.values.firstWhere(
        (e) => e.name == typeString,
        orElse: () => AIProviderType.claude,
      );
    }
  }

  Future<void> setProvider(AIProviderType type) async {
    state = type;
    final prefs = await ref.read(sharedPreferencesProvider.future);
    await prefs.setString(_aiProviderTypePref, type.name);
  }
}

// Check if API is configured
final isApiConfiguredProvider = Provider<bool>((ref) {
  final apiKey = ref.watch(claudeApiKeyProvider);
  return apiKey.isNotEmpty;
});

// Service Providers
final aiServiceProvider = Provider<AIService?>((ref) {
  final apiKey = ref.watch(claudeApiKeyProvider);
  final providerType = ref.watch(aiProviderTypeProvider);
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

final unsearchServiceProvider = Provider<UnSearchService?>((ref) {
  final apiKey = ref.watch(unsearchApiKeyProvider);
  if (apiKey.isEmpty) return null;
  return UnSearchService(apiKey: apiKey);
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
    final claudeService = ref.read(claudeServiceProvider);
    if (claudeService == null) {
      state = state.copyWith(
        isGenerating: false,
        error: 'Claude API key not configured. Please add your API key in Settings.',
      );
      return;
    }

    state = state.copyWith(isGenerating: true, error: null);

    try {
      final json = await claudeService.generateRoadmap(
        goal: goal,
        timeframe: timeframe,
        difficulty: difficulty,
        dailyMinutes: dailyMinutes,
      );
      state = state.copyWith(isGenerating: false, generatedJson: json);
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

    if (searchType == SearchProviderType.unsearch) {
      final unsearchService = ref.read(unsearchServiceProvider);
      if (unsearchService == null) {
        state = state.copyWith(
          isSearching: false,
          error: 'UnSearch API key not configured. Please add your API key in Settings.',
        );
        return;
      }

      state = state.copyWith(isSearching: true, error: null);

      try {
        final results = await unsearchService.searchResources(
          query: query,
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
    } else {
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
          query: query,
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
