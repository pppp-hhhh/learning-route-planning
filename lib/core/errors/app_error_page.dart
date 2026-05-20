import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_error.dart';
import 'app_error_widget.dart';

class AppErrorPage extends StatelessWidget {
  final AppError error;
  final VoidCallback? onRetry;
  final bool canGoBack;

  const AppErrorPage({
    super.key,
    required this.error,
    this.onRetry,
    this.canGoBack = true,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF111827) : const Color(0xFFF9FAFB),
      appBar: canGoBack
          ? AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              ),
            )
          : null,
      body: SafeArea(
        child: AppErrorWidget(
          error: error,
          onRetry: onRetry,
          onGoHome: () => context.go('/home'),
          showGoHome: true,
        ),
      ),
    );
  }
}
