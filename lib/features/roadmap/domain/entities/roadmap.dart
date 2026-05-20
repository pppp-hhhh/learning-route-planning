import 'package:equatable/equatable.dart';

class RoadmapEntity extends Equatable {
  final String id;
  final String title;
  final String? description;
  final DateTime? targetDate;
  final String status;
  final int dailyMinutes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? syncedAt;
  final List<PhaseEntity> phases;

  const RoadmapEntity({
    required this.id,
    required this.title,
    this.description,
    this.targetDate,
    required this.status,
    required this.dailyMinutes,
    required this.createdAt,
    required this.updatedAt,
    this.syncedAt,
    this.phases = const [],
  });

  int get totalTasks {
    return phases.fold(0, (sum, phase) => sum + phase.tasks.length);
  }

  int get completedTasks {
    return phases.fold(
        0, (sum, phase) => sum + phase.completedTasksCount);
  }

  double get progress {
    if (totalTasks == 0) return 0;
    return completedTasks / totalTasks;
  }

  RoadmapEntity copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? targetDate,
    String? status,
    int? dailyMinutes,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? syncedAt,
    List<PhaseEntity>? phases,
  }) {
    return RoadmapEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
      dailyMinutes: dailyMinutes ?? this.dailyMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedAt: syncedAt ?? this.syncedAt,
      phases: phases ?? this.phases,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        targetDate,
        status,
        dailyMinutes,
        createdAt,
        updatedAt,
        syncedAt,
        phases,
      ];
}

class PhaseEntity extends Equatable {
  final String id;
  final String roadmapId;
  final String title;
  final String? description;
  final int orderIndex;
  final String status;
  final List<TaskEntity> tasks;

  const PhaseEntity({
    required this.id,
    required this.roadmapId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.status,
    this.tasks = const [],
  });

  int get completedTasksCount {
    return tasks.where((t) => t.status == 'completed').length;
  }

  double get progress {
    if (tasks.isEmpty) return 0;
    return completedTasksCount / tasks.length;
  }

  PhaseEntity copyWith({
    String? id,
    String? roadmapId,
    String? title,
    String? description,
    int? orderIndex,
    String? status,
    List<TaskEntity>? tasks,
  }) {
    return PhaseEntity(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      title: title ?? this.title,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props =>
      [id, roadmapId, title, description, orderIndex, status, tasks];
}

class TaskEntity extends Equatable {
  final String id;
  final String phaseId;
  final String title;
  final String? description;
  final String type;
  final String status;
  final int? estimatedMinutes;
  final DateTime? completedAt;
  final DateTime? dueDate;
  final List<ResourceEntity> resources;

  const TaskEntity({
    required this.id,
    required this.phaseId,
    required this.title,
    this.description,
    required this.type,
    required this.status,
    this.estimatedMinutes,
    this.completedAt,
    this.dueDate,
    this.resources = const [],
  });

  TaskEntity copyWith({
    String? id,
    String? phaseId,
    String? title,
    String? description,
    String? type,
    String? status,
    int? estimatedMinutes,
    DateTime? completedAt,
    DateTime? dueDate,
    List<ResourceEntity>? resources,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      phaseId: phaseId ?? this.phaseId,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      completedAt: completedAt ?? this.completedAt,
      dueDate: dueDate ?? this.dueDate,
      resources: resources ?? this.resources,
    );
  }

  @override
  List<Object?> get props => [
        id,
        phaseId,
        title,
        description,
        type,
        status,
        estimatedMinutes,
        completedAt,
        dueDate,
        resources,
      ];
}

class ResourceEntity extends Equatable {
  final String id;
  final String title;
  final String url;
  final String? type;
  final String? difficulty;
  final int? estimatedMinutes;
  final double? rating;
  final bool isBookmarked;
  final String? notes;
  final DateTime createdAt;

  const ResourceEntity({
    required this.id,
    required this.title,
    required this.url,
    this.type,
    this.difficulty,
    this.estimatedMinutes,
    this.rating,
    required this.isBookmarked,
    this.notes,
    required this.createdAt,
  });

  ResourceEntity copyWith({
    String? id,
    String? title,
    String? url,
    String? type,
    String? difficulty,
    int? estimatedMinutes,
    double? rating,
    bool? isBookmarked,
    String? notes,
    DateTime? createdAt,
  }) {
    return ResourceEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      type: type ?? this.type,
      difficulty: difficulty ?? this.difficulty,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      rating: rating ?? this.rating,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        url,
        type,
        difficulty,
        estimatedMinutes,
        rating,
        isBookmarked,
        notes,
        createdAt,
      ];
}

class FlashcardEntity extends Equatable {
  final String id;
  final String roadmapId;
  final String? taskId;
  final String question;
  final String answer;
  final DateTime? nextReview;
  final double easeFactor;
  final int interval;
  final int repetitions;

  const FlashcardEntity({
    required this.id,
    required this.roadmapId,
    this.taskId,
    required this.question,
    required this.answer,
    this.nextReview,
    required this.easeFactor,
    required this.interval,
    required this.repetitions,
  });

  bool get isDue {
    if (nextReview == null) return true;
    return nextReview!.isBefore(DateTime.now());
  }

  FlashcardEntity copyWith({
    String? id,
    String? roadmapId,
    String? taskId,
    String? question,
    String? answer,
    DateTime? nextReview,
    double? easeFactor,
    int? interval,
    int? repetitions,
  }) {
    return FlashcardEntity(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      taskId: taskId ?? this.taskId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      nextReview: nextReview ?? this.nextReview,
      easeFactor: easeFactor ?? this.easeFactor,
      interval: interval ?? this.interval,
      repetitions: repetitions ?? this.repetitions,
    );
  }

  @override
  List<Object?> get props => [
        id,
        roadmapId,
        taskId,
        question,
        answer,
        nextReview,
        easeFactor,
        interval,
        repetitions,
      ];
}
