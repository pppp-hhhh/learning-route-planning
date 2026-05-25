import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ai_learning_route_planner/core/theme/app_theme.dart';
import 'package:ai_learning_route_planner/core/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_learning_route_planner/core/secure/secure_key_storage.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:ai_learning_route_planner/core/services/locale_service.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. 初始化安全存储并运行优先级链
  //    dart-define → .env → Secure Storage
  final keyStorage = SecureKeyStorage();
  await keyStorage.resolveAll();

  // 2. 从 SharedPreferences 迁移已有 key（兼容升级用户）
  try {
    final prefs = await SharedPreferences.getInstance();
    await keyStorage.migrateFromPrefs((key) async => prefs.getString(key));
  } catch (_) {}

  // 3. 预加载 Auth 状态（resolveAll() 已把 .env 值持久化到 Secure Storage）
  final authNotifier = AuthRedirectNotifier(keyStorage);
  await authNotifier.load(); // ← 在 runApp 之前完成，避免路由首帧误跳 /setup

  // 4. 启动 App
  runApp(
    ProviderScope(
      overrides: [
        secureKeyStorageProvider.overrideWithValue(keyStorage),
        authRedirectNotifierProvider.overrideWith((ref) => authNotifier),
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
