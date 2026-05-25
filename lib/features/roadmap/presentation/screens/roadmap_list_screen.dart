import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';

class RoadmapListScreen extends ConsumerWidget {
  const RoadmapListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final roadmapsAsync = ref.watch(roadmapsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.myRoadmaps),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: roadmapsAsync.when(
        data: (roadmaps) {
          if (roadmaps.isEmpty) {
            return _EmptyState();
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: roadmaps.length,
            itemBuilder: (context, index) {
              final roadmap = roadmaps[index];
              return _RoadmapCard(
                roadmapId: roadmap.id,
                title: roadmap.title,
                description: roadmap.description,
                status: roadmap.status,
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('${l10n.error}: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/roadmaps/create'),
        icon: const Icon(Icons.add),
        label: Text(l10n.newRoadmap),
      ),
    );
  }
}

class _RoadmapCard extends ConsumerWidget {
  final String roadmapId;
  final String title;
  final String? description;
  final String status;

  const _RoadmapCard({
    required this.roadmapId,
    required this.title,
    this.description,
    required this.status,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final progressAsync = ref.watch(roadmapProgressProvider(roadmapId));
    final progress = progressAsync.whenOrNull(
      data: (data) => data,
    );
    final completed = progress?['completed'] ?? 0;
    final total = progress?['total'] ?? 1;
    final pct = total > 0 ? completed / total : 0.0;
    final color = _getStatusColor(status);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: color.withValues(alpha: 0.15)),
      ),
      child: InkWell(
        onTap: () => context.go('/roadmaps/$roadmapId'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 顶部：状态 + 图标
              Row(
                children: [
                  _StatusBadge(status: status, color: color),
                  const Spacer(),
                  Icon(Icons.chevron_right, color: Colors.grey[400], size: 20),
                ],
              ),
              const SizedBox(height: 14),

              // 标题 + 描述
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      status == 'completed' ? Icons.check_circle : Icons.route,
                      color: color,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (description != null && description!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              description!,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.grey[500],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 进度条 + 任务数
              Row(
                children: [
                  Expanded(
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: pct),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, _) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: value,
                            backgroundColor: Colors.grey[200],
                            color: color,
                            minHeight: 6,
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    '${(pct * 100).toInt()}%',
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),

              // 底部：任务摘要
              Row(
                children: [
                  Icon(Icons.task_alt, size: 14, color: Colors.grey[400]),
                  const SizedBox(width: 4),
                  Text(
                    '$completed / $total 任务',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[400],
                    ),
                  ),
                  const Spacer(),
                  Text(
                    status == 'active'
                        ? '进行中'
                        : status == 'completed'
                            ? '已完成'
                            : status,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: Colors.grey[400],
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'active':
        return const Color(0xFF4CAF50);
      case 'paused':
        return const Color(0xFFFF9800);
      case 'completed':
        return const Color(0xFF2196F3);
      case 'abandoned':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  final Color color;

  const _StatusBadge({required this.status, required this.color});

  @override
  Widget build(BuildContext context) {
    final IconData icon;
    final String label;
    switch (status) {
      case 'active':
        icon = Icons.play_arrow;
        label = '进行中';
      case 'paused':
        icon = Icons.pause;
        label = '已暂停';
      case 'completed':
        icon = Icons.check;
        label = '已完成';
      default:
        icon = Icons.circle;
        label = status;
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.route_outlined,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 24),
            Text(
              l10n.noRoadmaps,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.createFirstRoadmap,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go('/roadmaps/create'),
              icon: const Icon(Icons.add),
              label: Text(l10n.createRoadmap),
            ),
          ],
        ),
      ),
    );
  }
}
