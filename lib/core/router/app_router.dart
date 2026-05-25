import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/screens/roadmap_list_screen.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/screens/roadmap_detail_screen.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/screens/roadmap_create_screen.dart';
import 'package:ai_learning_route_planner/features/resources/presentation/screens/resource_library_screen.dart';
import 'package:ai_learning_route_planner/features/learning/presentation/screens/flashcard_review_screen.dart';
import 'package:ai_learning_route_planner/features/tutor/presentation/screens/tutor_chat_screen.dart';
import 'package:ai_learning_route_planner/features/settings/presentation/screens/profile_screen.dart';
import 'package:ai_learning_route_planner/features/settings/presentation/screens/settings_screen.dart';
import 'package:ai_learning_route_planner/features/home/presentation/screens/home_screen.dart';
import 'package:ai_learning_route_planner/features/onboarding/presentation/screens/api_setup_screen.dart';
import 'package:ai_learning_route_planner/core/errors/errors.dart';
import 'package:ai_learning_route_planner/services/ai/ai_service.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';
import 'package:ai_learning_route_planner/core/secure/secure_key_storage.dart';
import 'package:ai_learning_route_planner/core/secure/key_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

// Provider type to storage key mapping
const Map<AIProviderType, String> _providerKeyMap = {
  AIProviderType.claude: KeyNames.claudeApiKey,
  AIProviderType.deepseek: KeyNames.deepseekApiKey,
  AIProviderType.openai: KeyNames.openaiApiKey,
  AIProviderType.grok: KeyNames.grokApiKey,
  AIProviderType.gemini: KeyNames.geminiApiKey,
};

// Auth state notifier for router redirect
// Reads from SecureKeyStorage (which chains dart-define → .env → secure storage)
class AuthRedirectNotifier extends ChangeNotifier {
  final SecureKeyStorage _storage;
  bool _configured = false;

  AuthRedirectNotifier(this._storage);

  bool get isApiConfigured => _configured;

  /// 加载当前 AI Provider 对应的 API Key 状态
  Future<void> load() async {
    final typeString = await _storage.read(KeyNames.aiProviderType);
    final providerType = typeString.isNotEmpty
        ? AIProviderType.values.firstWhere(
            (e) => e.name == typeString,
            orElse: () => AIProviderType.claude,
          )
        : AIProviderType.claude;

    final keyName = _providerKeyMap[providerType] ?? KeyNames.claudeApiKey;
    final key = await _storage.read(keyName);
    _configured = key.isNotEmpty;
    notifyListeners();
  }

  void refresh() {
    load();
  }
}

final authRedirectNotifierProvider = Provider<AuthRedirectNotifier>((ref) {
  throw UnimplementedError('Must be overridden in main.dart');
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.watch(authRedirectNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/home',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final isApiConfigured = authNotifier.isApiConfigured;
      final isOnSetupPage = state.uri.path == '/setup';

      // If API not configured and not on setup page, redirect to setup
      if (!isApiConfigured && !isOnSetupPage) {
        return '/setup';
      }

      // If API configured and on setup page, redirect to home
      if (isApiConfigured && isOnSetupPage) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/setup',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ApiSetupScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return MainShell(child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/roadmaps',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: RoadmapListScreen(),
            ),
          ),
          GoRoute(
            path: '/roadmaps/create',
            builder: (context, state) => const RoadmapCreateScreen(),
          ),
          GoRoute(
            path: '/roadmaps/:roadmapId',
            builder: (context, state) {
              final roadmapId = state.pathParameters['roadmapId']!;
              return RoadmapDetailScreen(roadmapId: roadmapId);
            },
          ),
          GoRoute(
            path: '/resources',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ResourceLibraryScreen(),
            ),
          ),
          GoRoute(
            path: '/tutor',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: TutorChatScreen(),
            ),
          ),
          GoRoute(
            path: '/profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/settings',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/review/:roadmapId',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final roadmapId = state.pathParameters['roadmapId']!;
          return FlashcardReviewScreen(roadmapId: roadmapId);
        },
      ),
      GoRoute(
        path: '/error',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final errorType = state.uri.queryParameters['type'];
          final message = state.uri.queryParameters['message'];
          final error = AppError(
            type: ErrorType.values.firstWhere(
              (e) => e.name == errorType,
              orElse: () => ErrorType.unknown,
            ),
            message: message ?? '出了点问题',
          );
          return AppErrorPage(error: error);
        },
      ),
    ],
  );
});

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) => _onItemTapped(index, context),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route_outlined),
            activeIcon: Icon(Icons.route),
            label: l10n.roadmaps,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            activeIcon: Icon(Icons.library_books),
            label: l10n.resources,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            activeIcon: Icon(Icons.chat),
            label: l10n.tutor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: l10n.profile,
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/home')) return 0;
    if (location.startsWith('/roadmaps')) return 1;
    if (location.startsWith('/resources')) return 2;
    if (location.startsWith('/tutor')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/roadmaps');
        break;
      case 2:
        context.go('/resources');
        break;
      case 3:
        context.go('/tutor');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }
}
