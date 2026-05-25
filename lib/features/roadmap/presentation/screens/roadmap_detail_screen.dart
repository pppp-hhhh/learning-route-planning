import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:ai_learning_route_planner/l10n/app_localizations.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';

class RoadmapDetailScreen extends ConsumerWidget {
  final String roadmapId;

  const RoadmapDetailScreen({super.key, required this.roadmapId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final db = ref.watch(databaseProvider);

    return FutureBuilder(
      future: db.getRoadmapById(roadmapId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final roadmap = snapshot.data;
        if (roadmap == null) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(child: Text(l10n.notFound)),
          );
        }

        final progressAsync = ref.watch(roadmapProgressProvider(roadmapId));
        final progress = progressAsync.whenOrNull(
          data: (data) => data,
        );
        final completed = progress?['completed'] ?? 0;
        final total = progress?['total'] ?? 1;
        final pct = total > 0 ? completed / total : 0.0;

        return Scaffold(
          appBar: AppBar(
            title: Text(roadmap.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Card
                _ProgressCard(
                  title: roadmap.title,
                  description: roadmap.description,
                  progress: pct,
                  completedTasks: completed,
                  totalTasks: total,
                ),
                const SizedBox(height: 24),

                // Phases
                Text(
                  l10n.learningPhases,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                FutureBuilder(
                  future: db.getPhasesByRoadmapId(roadmapId),
                  builder: (context, phaseSnapshot) {
                    if (!phaseSnapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    final phases = phaseSnapshot.data!;
                    if (phases.isEmpty) {
                      return const _EmptyPhasesCard();
                    }
                    return Column(
                      children: phases
                          .map((phase) => _PhaseCard(
                                roadmapId: roadmapId,
                                phaseId: phase.id,
                                title: phase.title,
                                description: phase.description,
                                orderIndex: phase.orderIndex,
                                status: phase.status,
                              ))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProgressCard extends StatelessWidget {
  final String title;
  final String? description;
  final double progress;
  final int completedTasks;
  final int totalTasks;

  const _ProgressCard({
    required this.title,
    this.description,
    required this.progress,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Icons.route,
                    color: Theme.of(context).colorScheme.primary,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style:
                            Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      if (description != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          description!,
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Colors.grey[600],
                                  ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.progress,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${(progress * 100).toInt()}%',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.completed,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$completedTasks / $totalTasks',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhaseCard extends ConsumerStatefulWidget {
  final String title;
  final String? description;
  final int orderIndex;
  final String status;
  final String phaseId;
  final String roadmapId;

  const _PhaseCard({
    required this.title,
    this.description,
    required this.orderIndex,
    required this.status,
    required this.phaseId,
    required this.roadmapId,
  });

  @override
  ConsumerState<_PhaseCard> createState() => _PhaseCardState();
}

class _PhaseCardState extends ConsumerState<_PhaseCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final db = ref.watch(databaseProvider);
    final isActive = widget.status == 'active';
    final chapterNum = widget.orderIndex + 1;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isActive ? theme.colorScheme.primary : Colors.grey[300]!,
            width: 4,
          ),
        ),
      ),
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0).copyWith(
            topRight: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
          side: BorderSide(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 章标题区域 ──
            InkWell(
              onTap: () => setState(() => _expanded = !_expanded),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // 章编号
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: isActive
                            ? theme.colorScheme.primary
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '$chapterNum',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isActive ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                    // 标题 + 状态
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: theme.textTheme.titleSmall?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              _MetaChip(
                                icon: Icons.access_time,
                                label: '第$chapterNum章',
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              _MetaChip(
                                icon: isActive
                                    ? Icons.play_circle_outline
                                    : Icons.check_circle_outline,
                                label: isActive ? '学习中' : widget.status,
                                color: isActive ? Colors.green : Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      _expanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
            ),

            // ── 展开内容 ──
            if (_expanded)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    const SizedBox(height: 8),

                    // 章节描述（Markdown 渲染）
                    if (widget.description != null &&
                        widget.description!.isNotEmpty)
                      MarkdownBody(
                        data: widget.description!,
                        selectable: true,
                        styleSheet: MarkdownStyleSheet(
                          p: theme.textTheme.bodyMedium?.copyWith(
                            height: 1.6,
                            color: Colors.grey[800],
                          ),
                          strong: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          code: TextStyle(
                            backgroundColor:
                                theme.colorScheme.surfaceContainerHighest,
                            color: theme.colorScheme.primary,
                            fontSize: 13,
                          ),
                          codeblockDecoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          h3: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          listBullet: theme.textTheme.bodyMedium,
                        ),
                      ),

                    const SizedBox(height: 16),

                    // 任务列表（小节）
                    FutureBuilder(
                      future: db.getTasksByPhaseId(widget.phaseId),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        final tasks = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '📖 本节内容',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...tasks.map((task) => _TaskSectionCard(
                                  task: task,
                                  theme: theme,
                                )),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// 任务小节卡片（可展开）
class _TaskSectionCard extends ConsumerStatefulWidget {
  final dynamic task; // Task 类型来自 drift
  final ThemeData theme;

  const _TaskSectionCard({
    required this.task,
    required this.theme,
  });

  @override
  ConsumerState<_TaskSectionCard> createState() => _TaskSectionCardState();
}

class _TaskSectionCardState extends ConsumerState<_TaskSectionCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final task = widget.task;
    final isCompleted = task.status == 'completed';
    final dotColor = isCompleted ? Colors.green : Colors.grey[400];

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: dotColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isCompleted ? Colors.grey : null,
                        decoration: isCompleted
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                  if (task.estimatedMinutes != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: widget.theme.colorScheme.primary
                            .withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${task.estimatedMinutes}分钟',
                        style: TextStyle(
                          fontSize: 11,
                          color: widget.theme.colorScheme.primary,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    size: 18,
                    color: Colors.grey[400],
                  ),
                ],
              ),
            ),
          ),

          // 展开后的任务详细内容
          if (_expanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(height: 1),
                  const SizedBox(height: 8),
                  if (task.description != null &&
                      task.description!.isNotEmpty)
                    MarkdownBody(
                      data: task.description!,
                      selectable: true,
                      styleSheet: MarkdownStyleSheet(
                        p: widget.theme.textTheme.bodySmall?.copyWith(
                          height: 1.5,
                          color: Colors.grey[700],
                        ),
                        code: TextStyle(
                          backgroundColor: widget.theme.colorScheme
                              .surfaceContainerHighest,
                          color: widget.theme.colorScheme.primary,
                          fontSize: 12,
                        ),
                        codeblockDecoration: BoxDecoration(
                          color: widget.theme.colorScheme
                              .surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        strong: widget.theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _MetaChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 3),
        Text(
          label,
          style: TextStyle(fontSize: 11, color: color),
        ),
      ],
    );
  }
}

class _EmptyPhasesCard extends StatelessWidget {
  const _EmptyPhasesCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            Icon(
              Icons.layers_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noPhasesYet,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            Text(
              l10n.phasesWillAppearHere,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
