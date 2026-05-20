import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ai_learning_route_planner/main.dart';
import 'package:ai_learning_route_planner/core/router/app_router.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRedirectNotifierProvider.overrideWith((ref) {
            return AuthRedirectNotifier(prefs);
          }),
        ],
        child: const AILearningRouteApp(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify that the app loads (either setup screen or home depending on API key)
    expect(find.byType(AILearningRouteApp), findsOneWidget);
  });
}
