import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ai_learning_route_planner/features/home/presentation/screens/home_screen.dart';

class RoadmapListScreen extends ConsumerWidget {
  const RoadmapListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roadmapsAsync = ref.watch(roadmapsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Roadmaps'),
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
                title: roadmap.title,
                description: roadmap.description,
                status: roadmap.status,
                onTap: () => context.go('/roadmaps/${roadmap.id}'),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/roadmaps/create'),
        icon: const Icon(Icons.add),
        label: const Text('New Roadmap'),
      ),
    );
  }
}

class _RoadmapCard extends StatelessWidget {
  final String title;
  final String? description;
  final String status;
  final VoidCallback onTap;

  const _RoadmapCard({
    required this.title,
    this.description,
    required this.status,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: _getStatusColor(status).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      status.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _getStatusColor(status),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey[400],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              if (description != null) ...[
                const SizedBox(height: 4),
                Text(
                  description!,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
              const SizedBox(height: 12),
              LinearProgressIndicator(
                value: 0,
                backgroundColor: Colors.grey[200],
              ),
              const SizedBox(height: 4),
              Text(
                '0% complete',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
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
        return Colors.green;
      case 'paused':
        return Colors.orange;
      case 'completed':
        return Colors.blue;
      case 'abandoned':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              'No roadmaps yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create your first learning roadmap and start your AI-powered learning journey',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => context.go('/roadmaps/create'),
              icon: const Icon(Icons.add),
              label: const Text('Create Roadmap'),
            ),
          ],
        ),
      ),
    );
  }
}
