import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_learning_route_planner/core/theme/app_theme.dart';
import 'package:ai_learning_route_planner/core/router/app_router.dart';
import 'package:ai_learning_route_planner/core/services/locale_service.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        authRedirectNotifierProvider.overrideWith((ref) {
          return AuthRedirectNotifier(prefs);
        }),
      ],
      child: const AILearningRouteApp(),
    ),
  );
}

class AILearningRouteApp extends ConsumerWidget {
  const AILearningRouteApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'AI Learning Route Planner',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: const [
        Locale('en'),
        Locale('zh'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
