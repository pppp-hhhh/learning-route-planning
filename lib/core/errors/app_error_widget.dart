import 'package:flutter/material.dart';
import 'app_error.dart';

class AppErrorWidget extends StatelessWidget {
  final AppError error;
  final VoidCallback? onRetry;
  final VoidCallback? onGoHome;
  final bool showGoHome;

  const AppErrorWidget({
    super.key,
    required this.error,
    this.onRetry,
    this.onGoHome,
    this.showGoHome = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildIcon(isDark),
            const SizedBox(height: 16),
            Text(
              error.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.message,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                  ),
              textAlign: TextAlign.center,
            ),
            if (error.details != null) ...[
              const SizedBox(height: 4),
              Text(
                error.details!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark ? Colors.grey.shade500 : Colors.grey.shade500,
                    ),
                textAlign: TextAlign.center,
              ),
            ],
            const SizedBox(height: 24),
            _buildActions(context, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(bool isDark) {
    IconData icon;
    Color color;

    switch (error.type) {
      case ErrorType.network:
        icon = Icons.wifi_off;
        color = Colors.orange;
        break;
      case ErrorType.server:
        icon = Icons.cloud_off;
        color = Colors.red;
        break;
      case ErrorType.notFound:
        icon = Icons.search_off;
        color = Colors.blue;
        break;
      case ErrorType.unauthorized:
        icon = Icons.lock_outline;
        color = Colors.purple;
        break;
      case ErrorType.unknown:
        icon = Icons.error_outline;
        color = Colors.grey;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 48,
        color: color,
      ),
    );
  }

  Widget _buildActions(BuildContext context, bool isDark) {
    final buttons = <Widget>[];

    if (onRetry != null) {
      buttons.add(
        ElevatedButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('重试'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      );
    }

    if (showGoHome && onGoHome != null) {
      buttons.add(
        TextButton.icon(
          onPressed: onGoHome,
          icon: const Icon(Icons.home),
          label: const Text('返回首页'),
        ),
      );
    }

    if (buttons.isEmpty) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: buttons
          .map((btn) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: btn,
              ))
          .toList(),
    );
  }
}
