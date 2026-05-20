import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:drift/drift.dart' hide Column;
import 'package:uuid/uuid.dart';
import 'package:ai_learning_route_planner/core/database/app_database.dart';
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';
import 'package:ai_learning_route_planner/features/roadmap/presentation/providers/providers.dart';

class RoadmapCreateScreen extends ConsumerStatefulWidget {
  const RoadmapCreateScreen({super.key});

  @override
  ConsumerState<RoadmapCreateScreen> createState() => _RoadmapCreateScreenState();
}

class _RoadmapCreateScreenState extends ConsumerState<RoadmapCreateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _goalController = TextEditingController();
  String _selectedTimeframe = '3 months';
  String _selectedDifficulty = 'intermediate';
  int _dailyMinutes = 30;

  final List<String> _timeframes = [
    '1 month',
    '3 months',
    '6 months',
    '12 months',
  ];

  final List<String> _difficulties = [
    'beginner',
    'intermediate',
    'advanced',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _goalController.dispose();
    super.dispose();
  }

  Future<void> _generateRoadmapWithAI() async {
    if (!_formKey.currentState!.validate()) return;

    final generationNotifier = ref.read(roadmapGenerationProvider.notifier);

    await generationNotifier.generateRoadmap(
      goal: _goalController.text.trim(),
      timeframe: _selectedTimeframe,
      difficulty: _selectedDifficulty,
      dailyMinutes: _dailyMinutes,
    );

    final state = ref.read(roadmapGenerationProvider);

    if (state.error != null && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${state.error}')),
      );
    } else if (state.generatedJson != null && mounted) {
      await _saveRoadmap(state.generatedJson!);
    }
  }

  Future<void> _saveRoadmap(String generatedJson) async {
    try {
      final db = ref.read(databaseProvider);
      final uuid = const Uuid();
      final roadmapId = uuid.v4();
      final now = DateTime.now().millisecondsSinceEpoch;

      // Insert roadmap
      await db.insertRoadmap(RoadmapsCompanion(
        id: Value(roadmapId),
        title: Value(_titleController.text.trim()),
        description: Value(_descriptionController.text.trim().isEmpty
            ? null
            : _descriptionController.text.trim()),
        status: const Value('active'),
        dailyMinutes: Value(_dailyMinutes),
        createdAt: Value(now),
        updatedAt: Value(now),
      ));

      // Parse and insert phases
      final data = jsonDecode(generatedJson);
      final phases = data['phases'] as List<dynamic>;

      for (int i = 0; i < phases.length; i++) {
        final phase = phases[i] as Map<String, dynamic>;
        final phaseId = uuid.v4();

        await db.insertPhase(PhasesCompanion(
          id: Value(phaseId),
          roadmapId: Value(roadmapId),
          title: Value(phase['title'] ?? 'Phase ${i + 1}'),
          description: Value(phase['description']),
          orderIndex: Value(i),
          status: const Value('active'),
        ));

        // Insert tasks for this phase
        final tasks = phase['tasks'] as List<dynamic>? ?? [];
        for (int j = 0; j < tasks.length; j++) {
          final task = tasks[j] as Map<String, dynamic>;
          await db.insertTask(TasksCompanion(
            id: Value(uuid.v4()),
            phaseId: Value(phaseId),
            title: Value(task['title'] ?? 'Task ${j + 1}'),
            description: Value(task['description']),
            type: Value(task['type'] ?? 'learning'),
            status: const Value('pending'),
            estimatedMinutes: Value(task['estimated_minutes']),
          ));
        }
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Roadmap created with AI!')),
        );
        context.go('/roadmaps/$roadmapId');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving roadmap: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final generationState = ref.watch(roadmapGenerationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Roadmap'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderSection(),
              const SizedBox(height: 32),

              Text(
                'Roadmap Title',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'e.g., Learn Machine Learning',
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              Text(
                'Description (optional)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Brief description of your learning goal',
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 24),

              Text(
                'Learning Goal',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _goalController,
                decoration: const InputDecoration(
                  hintText:
                      'e.g., I want to become a machine learning engineer in 6 months',
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 24),

              Text(
                'Timeframe',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _timeframes.map((tf) {
                  return ChoiceChip(
                    label: Text(tf),
                    selected: _selectedTimeframe == tf,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedTimeframe = tf);
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              Text(
                'Difficulty Level',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _difficulties.map((diff) {
                  return ChoiceChip(
                    label: Text(diff[0].toUpperCase() + diff.substring(1)),
                    selected: _selectedDifficulty == diff,
                    onSelected: (selected) {
                      if (selected) {
                        setState(() => _selectedDifficulty = diff);
                      }
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              Text(
                'Daily Commitment: $_dailyMinutes minutes',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Slider(
                value: _dailyMinutes.toDouble(),
                min: AppConstants.minDailyMinutes.toDouble(),
                max: AppConstants.maxDailyMinutes.toDouble(),
                divisions:
                    (AppConstants.maxDailyMinutes - AppConstants.minDailyMinutes) ~/
                        15,
                label: '$_dailyMinutes min',
                onChanged: (value) {
                  setState(() => _dailyMinutes = value.round());
                },
              ),
              const SizedBox(height: 32),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: generationState.isGenerating
                      ? null
                      : _generateRoadmapWithAI,
                  child: generationState.isGenerating
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            SizedBox(width: 12),
                            Text('Generating with AI...'),
                          ],
                        )
                      : const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.auto_awesome),
                            SizedBox(width: 8),
                            Text('Generate Roadmap with AI'),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 16),

              if (generationState.error != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error, color: Colors.red),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          generationState.error!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
            Theme.of(context).colorScheme.secondary.withValues(alpha: 0.1),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.auto_awesome,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'AI-Powered Roadmap',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Tell us your learning goal and our AI will create a personalized learning path',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
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
