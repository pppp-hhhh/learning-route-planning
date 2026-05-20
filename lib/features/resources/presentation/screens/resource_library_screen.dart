import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';

class ResourceLibraryScreen extends ConsumerWidget {
  const ResourceLibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = ref.watch(databaseProvider);
    final resourcesAsync = ref.watch(
      StreamProvider((ref) => db.watchAllResources()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resource Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _showSearchDialog(context, ref),
          ),
        ],
      ),
      body: resourcesAsync.when(
        data: (resources) {
          if (resources.isEmpty) {
            return _EmptyState(onSearch: () => _showSearchDialog(context, ref));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: resources.length,
            itemBuilder: (context, index) {
              final resource = resources[index];
              return _ResourceCard(
                title: resource.title,
                url: resource.url,
                type: resource.type,
                difficulty: resource.difficulty,
                isBookmarked: resource.isBookmarked,
                onTap: () => _launchUrl(resource.url),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showSearchDialog(context, ref),
        child: const Icon(Icons.search),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showSearchDialog(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => _SearchSheet(ref: ref),
    );
  }
}

class _ResourceCard extends StatelessWidget {
  final String title;
  final String url;
  final String? type;
  final String? difficulty;
  final bool isBookmarked;
  final VoidCallback onTap;

  const _ResourceCard({
    required this.title,
    required this.url,
    this.type,
    this.difficulty,
    required this.isBookmarked,
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
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getTypeColor(type).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getTypeIcon(type),
                  color: _getTypeColor(type),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      url,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (type != null)
                          _Tag(
                            label: type!,
                            color: _getTypeColor(type),
                          ),
                        if (difficulty != null) ...[
                          const SizedBox(width: 8),
                          _Tag(
                            label: difficulty!,
                            color: Colors.grey,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isBookmarked
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getTypeIcon(String? type) {
    switch (type) {
      case 'course':
        return Icons.school;
      case 'tutorial':
        return Icons.article;
      case 'documentation':
        return Icons.menu_book;
      case 'video':
        return Icons.play_circle;
      case 'book':
        return Icons.book;
      default:
        return Icons.link;
    }
  }

  Color _getTypeColor(String? type) {
    switch (type) {
      case 'course':
        return const Color(0xFF4F46E5);
      case 'tutorial':
        return const Color(0xFF10B981);
      case 'documentation':
        return const Color(0xFF6366F1);
      case 'video':
        return const Color(0xFFEF4444);
      case 'book':
        return const Color(0xFFF59E0B);
      default:
        return Colors.grey;
    }
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;

  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final VoidCallback onSearch;

  const _EmptyState({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.library_books_outlined,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 24),
            Text(
              'No resources yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Resources will appear here as you explore your learning roadmaps',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[500],
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: onSearch,
              icon: const Icon(Icons.search),
              label: const Text('Search Resources'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchSheet extends ConsumerStatefulWidget {
  final WidgetRef ref;

  const _SearchSheet({required this.ref});

  @override
  ConsumerState<_SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends ConsumerState<_SearchSheet> {
  final _queryController = TextEditingController();
  final _topicController = TextEditingController();
  String? _selectedResourceType;
  bool _isSearching = false;
  List<Map<String, dynamic>>? _results;
  String? _error;

  @override
  void dispose() {
    _queryController.dispose();
    _topicController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    final query = _queryController.text.trim();
    final topic = _topicController.text.trim();

    if (query.isEmpty && topic.isEmpty) {
      setState(() => _error = 'Please enter a search query or topic');
      return;
    }

    setState(() {
      _isSearching = true;
      _error = null;
      _results = null;
    });

    await widget.ref
        .read(resourceSearchProvider.notifier)
        .searchResources(
          query: query,
          topic: topic.isNotEmpty ? topic : query,
          limit: 20,
        );

    if (!mounted) return;

    final state = widget.ref.read(resourceSearchProvider);
    setState(() {
      _isSearching = false;
      _results = state.results;
      _error = state.error;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Search Resources',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _topicController,
                    decoration: InputDecoration(
                      labelText: 'Learning Topic',
                      hintText: 'e.g., Python, Machine Learning',
                      prefixIcon: const Icon(Icons.topic),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: _queryController,
                    decoration: InputDecoration(
                      labelText: 'Search Query (optional)',
                      hintText: 'e.g., free tutorial',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    value: _selectedResourceType,
                    decoration: InputDecoration(
                      labelText: 'Resource Type (optional)',
                      prefixIcon: const Icon(Icons.category),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All')),
                      ...AppConstants.resourceTypes.map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(type),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() => _selectedResourceType = value);
                    },
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: _isSearching ? null : _performSearch,
                      child: _isSearching
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Search'),
                    ),
                  ),
                ],
              ),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _error!,
                    style: TextStyle(color: Colors.red[700]),
                  ),
                ),
              ),
            if (_results != null)
              Expanded(
                child: _results!.isEmpty
                    ? const Center(child: Text('No results found'))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _results!.length,
                        itemBuilder: (context, index) {
                          final result = _results![index];
                          return _SearchResultCard(
                            title: result['title'] ?? '',
                            url: result['url'] ?? '',
                            snippet: result['snippet'] ?? '',
                            type: result['type'],
                            onTap: () => _launchUrl(result['url']),
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

class _SearchResultCard extends StatelessWidget {
  final String title;
  final String url;
  final String snippet;
  final String? type;
  final VoidCallback onTap;

  const _SearchResultCard({
    required this.title,
    required this.url,
    required this.snippet,
    this.type,
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
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (type != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: _getTypeColor(type).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        type!,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: _getTypeColor(type),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                url,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.blue,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Text(
                snippet,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getTypeColor(String? type) {
    switch (type) {
      case 'course':
        return const Color(0xFF4F46E5);
      case 'tutorial':
        return const Color(0xFF10B981);
      case 'documentation':
        return const Color(0xFF6366F1);
      case 'video':
        return const Color(0xFFEF4444);
      case 'book':
        return const Color(0xFFF59E0B);
      default:
        return Colors.grey;
    }
  }
}
