import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:ai_learning_route_planner/core/constants/app_constants.dart';
import 'package:flutter/foundation.dart' show debugPrint, kIsWeb;

part 'app_database.g.dart';

// Tables
class Roadmaps extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  IntColumn get targetDate => integer().nullable()();
  TextColumn get status => text().withDefault(const Constant('active'))();
  IntColumn get dailyMinutes =>
      integer().withDefault(const Constant(30))();
  IntColumn get createdAt => integer()();
  IntColumn get updatedAt => integer()();
  IntColumn get syncedAt => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Phases extends Table {
  TextColumn get id => text()();
  TextColumn get roadmapId => text().references(Roadmaps, #id)();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  IntColumn get orderIndex => integer()();
  TextColumn get status => text().withDefault(const Constant('active'))();

  @override
  Set<Column> get primaryKey => {id};
}

class Tasks extends Table {
  TextColumn get id => text()();
  TextColumn get phaseId => text().references(Phases, #id)();
  TextColumn get title => text()();
  TextColumn get description => text().nullable()();
  TextColumn get type =>
      text().withDefault(const Constant('learning'))();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get estimatedMinutes => integer().nullable()();
  IntColumn get completedAt => integer().nullable()();
  IntColumn get dueDate => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

class Resources extends Table {
  TextColumn get id => text()();
  TextColumn get title => text()();
  TextColumn get url => text()();
  TextColumn get type => text().nullable()();
  TextColumn get difficulty => text().nullable()();
  IntColumn get estimatedMinutes => integer().nullable()();
  RealColumn get rating => real().nullable()();
  BoolColumn get isBookmarked =>
      boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

class TaskResources extends Table {
  TextColumn get taskId => text().references(Tasks, #id)();
  TextColumn get resourceId => text().references(Resources, #id)();

  @override
  Set<Column> get primaryKey => {taskId, resourceId};
}

class Flashcards extends Table {
  TextColumn get id => text()();
  TextColumn get roadmapId => text().references(Roadmaps, #id)();
  TextColumn get taskId => text().nullable().references(Tasks, #id)();
  TextColumn get question => text()();
  TextColumn get answer => text()();
  IntColumn get nextReview => integer().nullable()();
  RealColumn get easeFactor =>
      real().withDefault(const Constant(2.5))();
  IntColumn get interval => integer().withDefault(const Constant(0))();
  IntColumn get repetitions =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

class Reviews extends Table {
  TextColumn get id => text()();
  TextColumn get flashcardId => text().references(Flashcards, #id)();
  IntColumn get quality => integer()();
  IntColumn get reviewedAt => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [
  Roadmaps,
  Phases,
  Tasks,
  Resources,
  TaskResources,
  Flashcards,
  Reviews,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: AppConstants.databaseName,
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('sqlite3.wasm'),
        driftWorker: Uri.parse('drift_worker.js'),
        onResult: (result) {
          if (result.missingFeatures.isNotEmpty) {
            debugPrint('Missing web features: ${result.missingFeatures}');
          }
        },
      ),
    );
  }

  // Roadmap Operations
  Future<List<Roadmap>> getAllRoadmaps() => select(roadmaps).get();

  Stream<List<Roadmap>> watchAllRoadmaps() => select(roadmaps).watch();

  Future<Roadmap?> getRoadmapById(String id) =>
      (select(roadmaps)..where((r) => r.id.equals(id))).getSingleOrNull();

  Future<int> insertRoadmap(RoadmapsCompanion roadmap) =>
      into(roadmaps).insert(roadmap);

  Future<bool> updateRoadmap(RoadmapsCompanion roadmap) =>
      update(roadmaps).replace(roadmap);

  Future<int> deleteRoadmap(String id) =>
      (delete(roadmaps)..where((r) => r.id.equals(id))).go();

  // Phase Operations
  Future<List<Phase>> getPhasesByRoadmapId(String roadmapId) =>
      (select(phases)
            ..where((p) => p.roadmapId.equals(roadmapId))
            ..orderBy([(p) => OrderingTerm.asc(p.orderIndex)]))
          .get();

  Stream<List<Phase>> watchPhasesByRoadmapId(String roadmapId) =>
      (select(phases)
            ..where((p) => p.roadmapId.equals(roadmapId))
            ..orderBy([(p) => OrderingTerm.asc(p.orderIndex)]))
          .watch();

  Future<int> insertPhase(PhasesCompanion phase) =>
      into(phases).insert(phase);

  Future<bool> updatePhase(PhasesCompanion phase) =>
      update(phases).replace(phase);

  Future<int> deletePhase(String id) =>
      (delete(phases)..where((p) => p.id.equals(id))).go();

  // Task Operations
  Future<List<Task>> getTasksByPhaseId(String phaseId) =>
      (select(tasks)..where((t) => t.phaseId.equals(phaseId))).get();

  Stream<List<Task>> watchTasksByPhaseId(String phaseId) =>
      (select(tasks)..where((t) => t.phaseId.equals(phaseId))).watch();

  Future<List<Task>> getTasksByRoadmapId(String roadmapId) async {
    final roadmapPhases = await getPhasesByRoadmapId(roadmapId);
    final phaseIds = roadmapPhases.map((p) => p.id).toList();
    return (select(tasks)..where((t) => t.phaseId.isIn(phaseIds))).get();
  }

  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);

  Future<bool> updateTask(TasksCompanion task) => update(tasks).replace(task);

  Future<int> deleteTask(String id) =>
      (delete(tasks)..where((t) => t.id.equals(id))).go();

  Future<int> getCompletedTaskCount(String roadmapId) async {
    final roadmapTasks = await getTasksByRoadmapId(roadmapId);
    return roadmapTasks.where((t) => t.status == AppConstants.taskCompleted).length;
  }

  Future<int> getTotalTaskCount(String roadmapId) async {
    final roadmapTasks = await getTasksByRoadmapId(roadmapId);
    return roadmapTasks.length;
  }

  // Resource Operations
  Future<List<Resource>> getAllResources() => select(resources).get();

  Stream<List<Resource>> watchAllResources() => select(resources).watch();

  Future<List<Resource>> getBookmarkedResources() =>
      (select(resources)..where((r) => r.isBookmarked.equals(true))).get();

  Stream<List<Resource>> watchBookmarkedResources() =>
      (select(resources)..where((r) => r.isBookmarked.equals(true))).watch();

  Future<int> insertResource(ResourcesCompanion resource) =>
      into(resources).insert(resource);

  Future<bool> updateResource(ResourcesCompanion resource) =>
      update(resources).replace(resource);

  Future<int> deleteResource(String id) =>
      (delete(resources)..where((r) => r.id.equals(id))).go();

  // Task-Resource Operations
  Future<List<Resource>> getResourcesByTaskId(String taskId) async {
    final taskResourceRows = await (select(taskResources)
          ..where((tr) => tr.taskId.equals(taskId)))
        .get();
    final resourceIds = taskResourceRows.map((tr) => tr.resourceId).toList();
    if (resourceIds.isEmpty) return [];
    return (select(resources)..where((r) => r.id.isIn(resourceIds))).get();
  }

  Future<void> linkResourceToTask(String taskId, String resourceId) =>
      into(taskResources).insert(TaskResourcesCompanion(
        taskId: Value(taskId),
        resourceId: Value(resourceId),
      ));

  Future<int> unlinkResourceFromTask(String taskId, String resourceId) =>
      (delete(taskResources)
            ..where(
                (tr) => tr.taskId.equals(taskId) & tr.resourceId.equals(resourceId)))
          .go();

  // Flashcard Operations
  Future<List<Flashcard>> getFlashcardsByRoadmapId(String roadmapId) =>
      (select(flashcards)..where((f) => f.roadmapId.equals(roadmapId))).get();

  Future<List<Flashcard>> getDueFlashcards() async {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (select(flashcards)
          ..where((f) =>
              f.nextReview.isSmallerOrEqualValue(now) |
              f.nextReview.isNull()))
        .get();
  }

  Stream<List<Flashcard>> watchDueFlashcards() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return (select(flashcards)
          ..where((f) =>
              f.nextReview.isSmallerOrEqualValue(now) |
              f.nextReview.isNull()))
        .watch();
  }

  Future<int> insertFlashcard(FlashcardsCompanion flashcard) =>
      into(flashcards).insert(flashcard);

  Future<bool> updateFlashcard(FlashcardsCompanion flashcard) =>
      update(flashcards).replace(flashcard);

  Future<int> deleteFlashcard(String id) =>
      (delete(flashcards)..where((f) => f.id.equals(id))).go();

  // Review Operations
  Future<int> insertReview(ReviewsCompanion review) =>
      into(reviews).insert(review);

  Future<List<Review>> getReviewsByFlashcardId(String flashcardId) =>
      (select(reviews)
            ..where((r) => r.flashcardId.equals(flashcardId))
            ..orderBy([(r) => OrderingTerm.desc(r.reviewedAt)]))
          .get();

  // Statistics
  Future<int> getTotalActiveRoadmaps() async {
    final result = await (select(roadmaps)
          ..where((r) => r.status.equals(AppConstants.statusActive)))
        .get();
    return result.length;
  }

  Future<int> getDueReviewCount() async {
    final dueCards = await getDueFlashcards();
    return dueCards.length;
  }

  Future<Map<String, int>> getRoadmapProgress(String roadmapId) async {
    final total = await getTotalTaskCount(roadmapId);
    final completed = await getCompletedTaskCount(roadmapId);
    return {'total': total, 'completed': completed};
  }

  /// 清除所有数据（用于"清除数据"功能）
  Future<void> clearAllData() async {
    await delete(reviews).go();
    await delete(flashcards).go();
    await delete(taskResources).go();
    await delete(resources).go();
    await delete(tasks).go();
    await delete(phases).go();
    await delete(roadmaps).go();
  }
}
