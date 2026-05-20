// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $RoadmapsTable extends Roadmaps with TableInfo<$RoadmapsTable, Roadmap> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoadmapsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _targetDateMeta = const VerificationMeta(
    'targetDate',
  );
  @override
  late final GeneratedColumn<int> targetDate = GeneratedColumn<int>(
    'target_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  static const VerificationMeta _dailyMinutesMeta = const VerificationMeta(
    'dailyMinutes',
  );
  @override
  late final GeneratedColumn<int> dailyMinutes = GeneratedColumn<int>(
    'daily_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(30),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<int> updatedAt = GeneratedColumn<int>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<int> syncedAt = GeneratedColumn<int>(
    'synced_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    description,
    targetDate,
    status,
    dailyMinutes,
    createdAt,
    updatedAt,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'roadmaps';
  @override
  VerificationContext validateIntegrity(
    Insertable<Roadmap> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('target_date')) {
      context.handle(
        _targetDateMeta,
        targetDate.isAcceptableOrUnknown(data['target_date']!, _targetDateMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('daily_minutes')) {
      context.handle(
        _dailyMinutesMeta,
        dailyMinutes.isAcceptableOrUnknown(
          data['daily_minutes']!,
          _dailyMinutesMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Roadmap map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Roadmap(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      targetDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_date'],
      ),
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      dailyMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}daily_minutes'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}updated_at'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}synced_at'],
      ),
    );
  }

  @override
  $RoadmapsTable createAlias(String alias) {
    return $RoadmapsTable(attachedDatabase, alias);
  }
}

class Roadmap extends DataClass implements Insertable<Roadmap> {
  final String id;
  final String title;
  final String? description;
  final int? targetDate;
  final String status;
  final int dailyMinutes;
  final int createdAt;
  final int updatedAt;
  final int? syncedAt;
  const Roadmap({
    required this.id,
    required this.title,
    this.description,
    this.targetDate,
    required this.status,
    required this.dailyMinutes,
    required this.createdAt,
    required this.updatedAt,
    this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || targetDate != null) {
      map['target_date'] = Variable<int>(targetDate);
    }
    map['status'] = Variable<String>(status);
    map['daily_minutes'] = Variable<int>(dailyMinutes);
    map['created_at'] = Variable<int>(createdAt);
    map['updated_at'] = Variable<int>(updatedAt);
    if (!nullToAbsent || syncedAt != null) {
      map['synced_at'] = Variable<int>(syncedAt);
    }
    return map;
  }

  RoadmapsCompanion toCompanion(bool nullToAbsent) {
    return RoadmapsCompanion(
      id: Value(id),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      targetDate: targetDate == null && nullToAbsent
          ? const Value.absent()
          : Value(targetDate),
      status: Value(status),
      dailyMinutes: Value(dailyMinutes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      syncedAt: syncedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(syncedAt),
    );
  }

  factory Roadmap.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Roadmap(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      targetDate: serializer.fromJson<int?>(json['targetDate']),
      status: serializer.fromJson<String>(json['status']),
      dailyMinutes: serializer.fromJson<int>(json['dailyMinutes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
      updatedAt: serializer.fromJson<int>(json['updatedAt']),
      syncedAt: serializer.fromJson<int?>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'targetDate': serializer.toJson<int?>(targetDate),
      'status': serializer.toJson<String>(status),
      'dailyMinutes': serializer.toJson<int>(dailyMinutes),
      'createdAt': serializer.toJson<int>(createdAt),
      'updatedAt': serializer.toJson<int>(updatedAt),
      'syncedAt': serializer.toJson<int?>(syncedAt),
    };
  }

  Roadmap copyWith({
    String? id,
    String? title,
    Value<String?> description = const Value.absent(),
    Value<int?> targetDate = const Value.absent(),
    String? status,
    int? dailyMinutes,
    int? createdAt,
    int? updatedAt,
    Value<int?> syncedAt = const Value.absent(),
  }) => Roadmap(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    targetDate: targetDate.present ? targetDate.value : this.targetDate,
    status: status ?? this.status,
    dailyMinutes: dailyMinutes ?? this.dailyMinutes,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    syncedAt: syncedAt.present ? syncedAt.value : this.syncedAt,
  );
  Roadmap copyWithCompanion(RoadmapsCompanion data) {
    return Roadmap(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      targetDate: data.targetDate.present
          ? data.targetDate.value
          : this.targetDate,
      status: data.status.present ? data.status.value : this.status,
      dailyMinutes: data.dailyMinutes.present
          ? data.dailyMinutes.value
          : this.dailyMinutes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Roadmap(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status, ')
          ..write('dailyMinutes: $dailyMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    targetDate,
    status,
    dailyMinutes,
    createdAt,
    updatedAt,
    syncedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Roadmap &&
          other.id == this.id &&
          other.title == this.title &&
          other.description == this.description &&
          other.targetDate == this.targetDate &&
          other.status == this.status &&
          other.dailyMinutes == this.dailyMinutes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncedAt == this.syncedAt);
}

class RoadmapsCompanion extends UpdateCompanion<Roadmap> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> description;
  final Value<int?> targetDate;
  final Value<String> status;
  final Value<int> dailyMinutes;
  final Value<int> createdAt;
  final Value<int> updatedAt;
  final Value<int?> syncedAt;
  final Value<int> rowid;
  const RoadmapsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.status = const Value.absent(),
    this.dailyMinutes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RoadmapsCompanion.insert({
    required String id,
    required String title,
    this.description = const Value.absent(),
    this.targetDate = const Value.absent(),
    this.status = const Value.absent(),
    this.dailyMinutes = const Value.absent(),
    required int createdAt,
    required int updatedAt,
    this.syncedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       createdAt = Value(createdAt),
       updatedAt = Value(updatedAt);
  static Insertable<Roadmap> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? targetDate,
    Expression<String>? status,
    Expression<int>? dailyMinutes,
    Expression<int>? createdAt,
    Expression<int>? updatedAt,
    Expression<int>? syncedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (targetDate != null) 'target_date': targetDate,
      if (status != null) 'status': status,
      if (dailyMinutes != null) 'daily_minutes': dailyMinutes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncedAt != null) 'synced_at': syncedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RoadmapsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? description,
    Value<int?>? targetDate,
    Value<String>? status,
    Value<int>? dailyMinutes,
    Value<int>? createdAt,
    Value<int>? updatedAt,
    Value<int?>? syncedAt,
    Value<int>? rowid,
  }) {
    return RoadmapsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      targetDate: targetDate ?? this.targetDate,
      status: status ?? this.status,
      dailyMinutes: dailyMinutes ?? this.dailyMinutes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncedAt: syncedAt ?? this.syncedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (targetDate.present) {
      map['target_date'] = Variable<int>(targetDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (dailyMinutes.present) {
      map['daily_minutes'] = Variable<int>(dailyMinutes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<int>(updatedAt.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<int>(syncedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoadmapsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('targetDate: $targetDate, ')
          ..write('status: $status, ')
          ..write('dailyMinutes: $dailyMinutes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncedAt: $syncedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhasesTable extends Phases with TableInfo<$PhasesTable, Phase> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhasesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roadmapIdMeta = const VerificationMeta(
    'roadmapId',
  );
  @override
  late final GeneratedColumn<String> roadmapId = GeneratedColumn<String>(
    'roadmap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmaps (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _orderIndexMeta = const VerificationMeta(
    'orderIndex',
  );
  @override
  late final GeneratedColumn<int> orderIndex = GeneratedColumn<int>(
    'order_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('active'),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    roadmapId,
    title,
    description,
    orderIndex,
    status,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'phases';
  @override
  VerificationContext validateIntegrity(
    Insertable<Phase> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('roadmap_id')) {
      context.handle(
        _roadmapIdMeta,
        roadmapId.isAcceptableOrUnknown(data['roadmap_id']!, _roadmapIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roadmapIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('order_index')) {
      context.handle(
        _orderIndexMeta,
        orderIndex.isAcceptableOrUnknown(data['order_index']!, _orderIndexMeta),
      );
    } else if (isInserting) {
      context.missing(_orderIndexMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Phase map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Phase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roadmapId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      orderIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}order_index'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
    );
  }

  @override
  $PhasesTable createAlias(String alias) {
    return $PhasesTable(attachedDatabase, alias);
  }
}

class Phase extends DataClass implements Insertable<Phase> {
  final String id;
  final String roadmapId;
  final String title;
  final String? description;
  final int orderIndex;
  final String status;
  const Phase({
    required this.id,
    required this.roadmapId,
    required this.title,
    this.description,
    required this.orderIndex,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['roadmap_id'] = Variable<String>(roadmapId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['order_index'] = Variable<int>(orderIndex);
    map['status'] = Variable<String>(status);
    return map;
  }

  PhasesCompanion toCompanion(bool nullToAbsent) {
    return PhasesCompanion(
      id: Value(id),
      roadmapId: Value(roadmapId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      orderIndex: Value(orderIndex),
      status: Value(status),
    );
  }

  factory Phase.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Phase(
      id: serializer.fromJson<String>(json['id']),
      roadmapId: serializer.fromJson<String>(json['roadmapId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      orderIndex: serializer.fromJson<int>(json['orderIndex']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roadmapId': serializer.toJson<String>(roadmapId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'orderIndex': serializer.toJson<int>(orderIndex),
      'status': serializer.toJson<String>(status),
    };
  }

  Phase copyWith({
    String? id,
    String? roadmapId,
    String? title,
    Value<String?> description = const Value.absent(),
    int? orderIndex,
    String? status,
  }) => Phase(
    id: id ?? this.id,
    roadmapId: roadmapId ?? this.roadmapId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    orderIndex: orderIndex ?? this.orderIndex,
    status: status ?? this.status,
  );
  Phase copyWithCompanion(PhasesCompanion data) {
    return Phase(
      id: data.id.present ? data.id.value : this.id,
      roadmapId: data.roadmapId.present ? data.roadmapId.value : this.roadmapId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      orderIndex: data.orderIndex.present
          ? data.orderIndex.value
          : this.orderIndex,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Phase(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, roadmapId, title, description, orderIndex, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Phase &&
          other.id == this.id &&
          other.roadmapId == this.roadmapId &&
          other.title == this.title &&
          other.description == this.description &&
          other.orderIndex == this.orderIndex &&
          other.status == this.status);
}

class PhasesCompanion extends UpdateCompanion<Phase> {
  final Value<String> id;
  final Value<String> roadmapId;
  final Value<String> title;
  final Value<String?> description;
  final Value<int> orderIndex;
  final Value<String> status;
  final Value<int> rowid;
  const PhasesCompanion({
    this.id = const Value.absent(),
    this.roadmapId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.orderIndex = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhasesCompanion.insert({
    required String id,
    required String roadmapId,
    required String title,
    this.description = const Value.absent(),
    required int orderIndex,
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roadmapId = Value(roadmapId),
       title = Value(title),
       orderIndex = Value(orderIndex);
  static Insertable<Phase> custom({
    Expression<String>? id,
    Expression<String>? roadmapId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? orderIndex,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roadmapId != null) 'roadmap_id': roadmapId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (orderIndex != null) 'order_index': orderIndex,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhasesCompanion copyWith({
    Value<String>? id,
    Value<String>? roadmapId,
    Value<String>? title,
    Value<String?>? description,
    Value<int>? orderIndex,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return PhasesCompanion(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      title: title ?? this.title,
      description: description ?? this.description,
      orderIndex: orderIndex ?? this.orderIndex,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roadmapId.present) {
      map['roadmap_id'] = Variable<String>(roadmapId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (orderIndex.present) {
      map['order_index'] = Variable<int>(orderIndex.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhasesCompanion(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('orderIndex: $orderIndex, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phaseIdMeta = const VerificationMeta(
    'phaseId',
  );
  @override
  late final GeneratedColumn<String> phaseId = GeneratedColumn<String>(
    'phase_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES phases (id)',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('learning'),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _completedAtMeta = const VerificationMeta(
    'completedAt',
  );
  @override
  late final GeneratedColumn<int> completedAt = GeneratedColumn<int>(
    'completed_at',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _dueDateMeta = const VerificationMeta(
    'dueDate',
  );
  @override
  late final GeneratedColumn<int> dueDate = GeneratedColumn<int>(
    'due_date',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    phaseId,
    title,
    description,
    type,
    status,
    estimatedMinutes,
    completedAt,
    dueDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('phase_id')) {
      context.handle(
        _phaseIdMeta,
        phaseId.isAcceptableOrUnknown(data['phase_id']!, _phaseIdMeta),
      );
    } else if (isInserting) {
      context.missing(_phaseIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('completed_at')) {
      context.handle(
        _completedAtMeta,
        completedAt.isAcceptableOrUnknown(
          data['completed_at']!,
          _completedAtMeta,
        ),
      );
    }
    if (data.containsKey('due_date')) {
      context.handle(
        _dueDateMeta,
        dueDate.isAcceptableOrUnknown(data['due_date']!, _dueDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      phaseId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phase_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      ),
      completedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}completed_at'],
      ),
      dueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}due_date'],
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  final String id;
  final String phaseId;
  final String title;
  final String? description;
  final String type;
  final String status;
  final int? estimatedMinutes;
  final int? completedAt;
  final int? dueDate;
  const Task({
    required this.id,
    required this.phaseId,
    required this.title,
    this.description,
    required this.type,
    required this.status,
    this.estimatedMinutes,
    this.completedAt,
    this.dueDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['phase_id'] = Variable<String>(phaseId);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['type'] = Variable<String>(type);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || estimatedMinutes != null) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    }
    if (!nullToAbsent || completedAt != null) {
      map['completed_at'] = Variable<int>(completedAt);
    }
    if (!nullToAbsent || dueDate != null) {
      map['due_date'] = Variable<int>(dueDate);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      phaseId: Value(phaseId),
      title: Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      type: Value(type),
      status: Value(status),
      estimatedMinutes: estimatedMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedMinutes),
      completedAt: completedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(completedAt),
      dueDate: dueDate == null && nullToAbsent
          ? const Value.absent()
          : Value(dueDate),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<String>(json['id']),
      phaseId: serializer.fromJson<String>(json['phaseId']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String?>(json['description']),
      type: serializer.fromJson<String>(json['type']),
      status: serializer.fromJson<String>(json['status']),
      estimatedMinutes: serializer.fromJson<int?>(json['estimatedMinutes']),
      completedAt: serializer.fromJson<int?>(json['completedAt']),
      dueDate: serializer.fromJson<int?>(json['dueDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'phaseId': serializer.toJson<String>(phaseId),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<String>(type),
      'status': serializer.toJson<String>(status),
      'estimatedMinutes': serializer.toJson<int?>(estimatedMinutes),
      'completedAt': serializer.toJson<int?>(completedAt),
      'dueDate': serializer.toJson<int?>(dueDate),
    };
  }

  Task copyWith({
    String? id,
    String? phaseId,
    String? title,
    Value<String?> description = const Value.absent(),
    String? type,
    String? status,
    Value<int?> estimatedMinutes = const Value.absent(),
    Value<int?> completedAt = const Value.absent(),
    Value<int?> dueDate = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    phaseId: phaseId ?? this.phaseId,
    title: title ?? this.title,
    description: description.present ? description.value : this.description,
    type: type ?? this.type,
    status: status ?? this.status,
    estimatedMinutes: estimatedMinutes.present
        ? estimatedMinutes.value
        : this.estimatedMinutes,
    completedAt: completedAt.present ? completedAt.value : this.completedAt,
    dueDate: dueDate.present ? dueDate.value : this.dueDate,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      phaseId: data.phaseId.present ? data.phaseId.value : this.phaseId,
      title: data.title.present ? data.title.value : this.title,
      description: data.description.present
          ? data.description.value
          : this.description,
      type: data.type.present ? data.type.value : this.type,
      status: data.status.present ? data.status.value : this.status,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      completedAt: data.completedAt.present
          ? data.completedAt.value
          : this.completedAt,
      dueDate: data.dueDate.present ? data.dueDate.value : this.dueDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('phaseId: $phaseId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('completedAt: $completedAt, ')
          ..write('dueDate: $dueDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    phaseId,
    title,
    description,
    type,
    status,
    estimatedMinutes,
    completedAt,
    dueDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.phaseId == this.phaseId &&
          other.title == this.title &&
          other.description == this.description &&
          other.type == this.type &&
          other.status == this.status &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.completedAt == this.completedAt &&
          other.dueDate == this.dueDate);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<String> id;
  final Value<String> phaseId;
  final Value<String> title;
  final Value<String?> description;
  final Value<String> type;
  final Value<String> status;
  final Value<int?> estimatedMinutes;
  final Value<int?> completedAt;
  final Value<int?> dueDate;
  final Value<int> rowid;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.phaseId = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TasksCompanion.insert({
    required String id,
    required String phaseId,
    required String title,
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.status = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.completedAt = const Value.absent(),
    this.dueDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       phaseId = Value(phaseId),
       title = Value(title);
  static Insertable<Task> custom({
    Expression<String>? id,
    Expression<String>? phaseId,
    Expression<String>? title,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? status,
    Expression<int>? estimatedMinutes,
    Expression<int>? completedAt,
    Expression<int>? dueDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (phaseId != null) 'phase_id': phaseId,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (status != null) 'status': status,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (completedAt != null) 'completed_at': completedAt,
      if (dueDate != null) 'due_date': dueDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TasksCompanion copyWith({
    Value<String>? id,
    Value<String>? phaseId,
    Value<String>? title,
    Value<String?>? description,
    Value<String>? type,
    Value<String>? status,
    Value<int?>? estimatedMinutes,
    Value<int?>? completedAt,
    Value<int?>? dueDate,
    Value<int>? rowid,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      phaseId: phaseId ?? this.phaseId,
      title: title ?? this.title,
      description: description ?? this.description,
      type: type ?? this.type,
      status: status ?? this.status,
      estimatedMinutes: estimatedMinutes ?? this.estimatedMinutes,
      completedAt: completedAt ?? this.completedAt,
      dueDate: dueDate ?? this.dueDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (phaseId.present) {
      map['phase_id'] = Variable<String>(phaseId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (completedAt.present) {
      map['completed_at'] = Variable<int>(completedAt.value);
    }
    if (dueDate.present) {
      map['due_date'] = Variable<int>(dueDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('phaseId: $phaseId, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('status: $status, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('completedAt: $completedAt, ')
          ..write('dueDate: $dueDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResourcesTable extends Resources
    with TableInfo<$ResourcesTable, Resource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _difficultyMeta = const VerificationMeta(
    'difficulty',
  );
  @override
  late final GeneratedColumn<String> difficulty = GeneratedColumn<String>(
    'difficulty',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _estimatedMinutesMeta = const VerificationMeta(
    'estimatedMinutes',
  );
  @override
  late final GeneratedColumn<int> estimatedMinutes = GeneratedColumn<int>(
    'estimated_minutes',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isBookmarkedMeta = const VerificationMeta(
    'isBookmarked',
  );
  @override
  late final GeneratedColumn<bool> isBookmarked = GeneratedColumn<bool>(
    'is_bookmarked',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_bookmarked" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resources';
  @override
  VerificationContext validateIntegrity(
    Insertable<Resource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('difficulty')) {
      context.handle(
        _difficultyMeta,
        difficulty.isAcceptableOrUnknown(data['difficulty']!, _difficultyMeta),
      );
    }
    if (data.containsKey('estimated_minutes')) {
      context.handle(
        _estimatedMinutesMeta,
        estimatedMinutes.isAcceptableOrUnknown(
          data['estimated_minutes']!,
          _estimatedMinutesMeta,
        ),
      );
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('is_bookmarked')) {
      context.handle(
        _isBookmarkedMeta,
        isBookmarked.isAcceptableOrUnknown(
          data['is_bookmarked']!,
          _isBookmarkedMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Resource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Resource(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      ),
      difficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}difficulty'],
      ),
      estimatedMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}estimated_minutes'],
      ),
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      ),
      isBookmarked: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_bookmarked'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ResourcesTable createAlias(String alias) {
    return $ResourcesTable(attachedDatabase, alias);
  }
}

class Resource extends DataClass implements Insertable<Resource> {
  final String id;
  final String title;
  final String url;
  final String? type;
  final String? difficulty;
  final int? estimatedMinutes;
  final double? rating;
  final bool isBookmarked;
  final String? notes;
  final int createdAt;
  const Resource({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<String>(type);
    }
    if (!nullToAbsent || difficulty != null) {
      map['difficulty'] = Variable<String>(difficulty);
    }
    if (!nullToAbsent || estimatedMinutes != null) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    map['is_bookmarked'] = Variable<bool>(isBookmarked);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['created_at'] = Variable<int>(createdAt);
    return map;
  }

  ResourcesCompanion toCompanion(bool nullToAbsent) {
    return ResourcesCompanion(
      id: Value(id),
      title: Value(title),
      url: Value(url),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
      difficulty: difficulty == null && nullToAbsent
          ? const Value.absent()
          : Value(difficulty),
      estimatedMinutes: estimatedMinutes == null && nullToAbsent
          ? const Value.absent()
          : Value(estimatedMinutes),
      rating: rating == null && nullToAbsent
          ? const Value.absent()
          : Value(rating),
      isBookmarked: Value(isBookmarked),
      notes: notes == null && nullToAbsent
          ? const Value.absent()
          : Value(notes),
      createdAt: Value(createdAt),
    );
  }

  factory Resource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Resource(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      type: serializer.fromJson<String?>(json['type']),
      difficulty: serializer.fromJson<String?>(json['difficulty']),
      estimatedMinutes: serializer.fromJson<int?>(json['estimatedMinutes']),
      rating: serializer.fromJson<double?>(json['rating']),
      isBookmarked: serializer.fromJson<bool>(json['isBookmarked']),
      notes: serializer.fromJson<String?>(json['notes']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'type': serializer.toJson<String?>(type),
      'difficulty': serializer.toJson<String?>(difficulty),
      'estimatedMinutes': serializer.toJson<int?>(estimatedMinutes),
      'rating': serializer.toJson<double?>(rating),
      'isBookmarked': serializer.toJson<bool>(isBookmarked),
      'notes': serializer.toJson<String?>(notes),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  Resource copyWith({
    String? id,
    String? title,
    String? url,
    Value<String?> type = const Value.absent(),
    Value<String?> difficulty = const Value.absent(),
    Value<int?> estimatedMinutes = const Value.absent(),
    Value<double?> rating = const Value.absent(),
    bool? isBookmarked,
    Value<String?> notes = const Value.absent(),
    int? createdAt,
  }) => Resource(
    id: id ?? this.id,
    title: title ?? this.title,
    url: url ?? this.url,
    type: type.present ? type.value : this.type,
    difficulty: difficulty.present ? difficulty.value : this.difficulty,
    estimatedMinutes: estimatedMinutes.present
        ? estimatedMinutes.value
        : this.estimatedMinutes,
    rating: rating.present ? rating.value : this.rating,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    notes: notes.present ? notes.value : this.notes,
    createdAt: createdAt ?? this.createdAt,
  );
  Resource copyWithCompanion(ResourcesCompanion data) {
    return Resource(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      type: data.type.present ? data.type.value : this.type,
      difficulty: data.difficulty.present
          ? data.difficulty.value
          : this.difficulty,
      estimatedMinutes: data.estimatedMinutes.present
          ? data.estimatedMinutes.value
          : this.estimatedMinutes,
      rating: data.rating.present ? data.rating.value : this.rating,
      isBookmarked: data.isBookmarked.present
          ? data.isBookmarked.value
          : this.isBookmarked,
      notes: data.notes.present ? data.notes.value : this.notes,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Resource(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('difficulty: $difficulty, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('rating: $rating, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
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
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Resource &&
          other.id == this.id &&
          other.title == this.title &&
          other.url == this.url &&
          other.type == this.type &&
          other.difficulty == this.difficulty &&
          other.estimatedMinutes == this.estimatedMinutes &&
          other.rating == this.rating &&
          other.isBookmarked == this.isBookmarked &&
          other.notes == this.notes &&
          other.createdAt == this.createdAt);
}

class ResourcesCompanion extends UpdateCompanion<Resource> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> url;
  final Value<String?> type;
  final Value<String?> difficulty;
  final Value<int?> estimatedMinutes;
  final Value<double?> rating;
  final Value<bool> isBookmarked;
  final Value<String?> notes;
  final Value<int> createdAt;
  final Value<int> rowid;
  const ResourcesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.type = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.rating = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.notes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResourcesCompanion.insert({
    required String id,
    required String title,
    required String url,
    this.type = const Value.absent(),
    this.difficulty = const Value.absent(),
    this.estimatedMinutes = const Value.absent(),
    this.rating = const Value.absent(),
    this.isBookmarked = const Value.absent(),
    this.notes = const Value.absent(),
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       url = Value(url),
       createdAt = Value(createdAt);
  static Insertable<Resource> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? type,
    Expression<String>? difficulty,
    Expression<int>? estimatedMinutes,
    Expression<double>? rating,
    Expression<bool>? isBookmarked,
    Expression<String>? notes,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (type != null) 'type': type,
      if (difficulty != null) 'difficulty': difficulty,
      if (estimatedMinutes != null) 'estimated_minutes': estimatedMinutes,
      if (rating != null) 'rating': rating,
      if (isBookmarked != null) 'is_bookmarked': isBookmarked,
      if (notes != null) 'notes': notes,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? url,
    Value<String?>? type,
    Value<String?>? difficulty,
    Value<int?>? estimatedMinutes,
    Value<double?>? rating,
    Value<bool>? isBookmarked,
    Value<String?>? notes,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return ResourcesCompanion(
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
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (difficulty.present) {
      map['difficulty'] = Variable<String>(difficulty.value);
    }
    if (estimatedMinutes.present) {
      map['estimated_minutes'] = Variable<int>(estimatedMinutes.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (isBookmarked.present) {
      map['is_bookmarked'] = Variable<bool>(isBookmarked.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResourcesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('type: $type, ')
          ..write('difficulty: $difficulty, ')
          ..write('estimatedMinutes: $estimatedMinutes, ')
          ..write('rating: $rating, ')
          ..write('isBookmarked: $isBookmarked, ')
          ..write('notes: $notes, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TaskResourcesTable extends TaskResources
    with TableInfo<$TaskResourcesTable, TaskResource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TaskResourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id)',
    ),
  );
  static const VerificationMeta _resourceIdMeta = const VerificationMeta(
    'resourceId',
  );
  @override
  late final GeneratedColumn<String> resourceId = GeneratedColumn<String>(
    'resource_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES resources (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [taskId, resourceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'task_resources';
  @override
  VerificationContext validateIntegrity(
    Insertable<TaskResource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    } else if (isInserting) {
      context.missing(_taskIdMeta);
    }
    if (data.containsKey('resource_id')) {
      context.handle(
        _resourceIdMeta,
        resourceId.isAcceptableOrUnknown(data['resource_id']!, _resourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_resourceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {taskId, resourceId};
  @override
  TaskResource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TaskResource(
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      )!,
      resourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resource_id'],
      )!,
    );
  }

  @override
  $TaskResourcesTable createAlias(String alias) {
    return $TaskResourcesTable(attachedDatabase, alias);
  }
}

class TaskResource extends DataClass implements Insertable<TaskResource> {
  final String taskId;
  final String resourceId;
  const TaskResource({required this.taskId, required this.resourceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task_id'] = Variable<String>(taskId);
    map['resource_id'] = Variable<String>(resourceId);
    return map;
  }

  TaskResourcesCompanion toCompanion(bool nullToAbsent) {
    return TaskResourcesCompanion(
      taskId: Value(taskId),
      resourceId: Value(resourceId),
    );
  }

  factory TaskResource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TaskResource(
      taskId: serializer.fromJson<String>(json['taskId']),
      resourceId: serializer.fromJson<String>(json['resourceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'taskId': serializer.toJson<String>(taskId),
      'resourceId': serializer.toJson<String>(resourceId),
    };
  }

  TaskResource copyWith({String? taskId, String? resourceId}) => TaskResource(
    taskId: taskId ?? this.taskId,
    resourceId: resourceId ?? this.resourceId,
  );
  TaskResource copyWithCompanion(TaskResourcesCompanion data) {
    return TaskResource(
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      resourceId: data.resourceId.present
          ? data.resourceId.value
          : this.resourceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TaskResource(')
          ..write('taskId: $taskId, ')
          ..write('resourceId: $resourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(taskId, resourceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskResource &&
          other.taskId == this.taskId &&
          other.resourceId == this.resourceId);
}

class TaskResourcesCompanion extends UpdateCompanion<TaskResource> {
  final Value<String> taskId;
  final Value<String> resourceId;
  final Value<int> rowid;
  const TaskResourcesCompanion({
    this.taskId = const Value.absent(),
    this.resourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TaskResourcesCompanion.insert({
    required String taskId,
    required String resourceId,
    this.rowid = const Value.absent(),
  }) : taskId = Value(taskId),
       resourceId = Value(resourceId);
  static Insertable<TaskResource> custom({
    Expression<String>? taskId,
    Expression<String>? resourceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (taskId != null) 'task_id': taskId,
      if (resourceId != null) 'resource_id': resourceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TaskResourcesCompanion copyWith({
    Value<String>? taskId,
    Value<String>? resourceId,
    Value<int>? rowid,
  }) {
    return TaskResourcesCompanion(
      taskId: taskId ?? this.taskId,
      resourceId: resourceId ?? this.resourceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (resourceId.present) {
      map['resource_id'] = Variable<String>(resourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TaskResourcesCompanion(')
          ..write('taskId: $taskId, ')
          ..write('resourceId: $resourceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $FlashcardsTable extends Flashcards
    with TableInfo<$FlashcardsTable, Flashcard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FlashcardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roadmapIdMeta = const VerificationMeta(
    'roadmapId',
  );
  @override
  late final GeneratedColumn<String> roadmapId = GeneratedColumn<String>(
    'roadmap_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES roadmaps (id)',
    ),
  );
  static const VerificationMeta _taskIdMeta = const VerificationMeta('taskId');
  @override
  late final GeneratedColumn<String> taskId = GeneratedColumn<String>(
    'task_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id)',
    ),
  );
  static const VerificationMeta _questionMeta = const VerificationMeta(
    'question',
  );
  @override
  late final GeneratedColumn<String> question = GeneratedColumn<String>(
    'question',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerMeta = const VerificationMeta('answer');
  @override
  late final GeneratedColumn<String> answer = GeneratedColumn<String>(
    'answer',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nextReviewMeta = const VerificationMeta(
    'nextReview',
  );
  @override
  late final GeneratedColumn<int> nextReview = GeneratedColumn<int>(
    'next_review',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _easeFactorMeta = const VerificationMeta(
    'easeFactor',
  );
  @override
  late final GeneratedColumn<double> easeFactor = GeneratedColumn<double>(
    'ease_factor',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(2.5),
  );
  static const VerificationMeta _intervalMeta = const VerificationMeta(
    'interval',
  );
  @override
  late final GeneratedColumn<int> interval = GeneratedColumn<int>(
    'interval',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _repetitionsMeta = const VerificationMeta(
    'repetitions',
  );
  @override
  late final GeneratedColumn<int> repetitions = GeneratedColumn<int>(
    'repetitions',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
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
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'flashcards';
  @override
  VerificationContext validateIntegrity(
    Insertable<Flashcard> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('roadmap_id')) {
      context.handle(
        _roadmapIdMeta,
        roadmapId.isAcceptableOrUnknown(data['roadmap_id']!, _roadmapIdMeta),
      );
    } else if (isInserting) {
      context.missing(_roadmapIdMeta);
    }
    if (data.containsKey('task_id')) {
      context.handle(
        _taskIdMeta,
        taskId.isAcceptableOrUnknown(data['task_id']!, _taskIdMeta),
      );
    }
    if (data.containsKey('question')) {
      context.handle(
        _questionMeta,
        question.isAcceptableOrUnknown(data['question']!, _questionMeta),
      );
    } else if (isInserting) {
      context.missing(_questionMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(
        _answerMeta,
        answer.isAcceptableOrUnknown(data['answer']!, _answerMeta),
      );
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('next_review')) {
      context.handle(
        _nextReviewMeta,
        nextReview.isAcceptableOrUnknown(data['next_review']!, _nextReviewMeta),
      );
    }
    if (data.containsKey('ease_factor')) {
      context.handle(
        _easeFactorMeta,
        easeFactor.isAcceptableOrUnknown(data['ease_factor']!, _easeFactorMeta),
      );
    }
    if (data.containsKey('interval')) {
      context.handle(
        _intervalMeta,
        interval.isAcceptableOrUnknown(data['interval']!, _intervalMeta),
      );
    }
    if (data.containsKey('repetitions')) {
      context.handle(
        _repetitionsMeta,
        repetitions.isAcceptableOrUnknown(
          data['repetitions']!,
          _repetitionsMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Flashcard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Flashcard(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      roadmapId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}roadmap_id'],
      )!,
      taskId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}task_id'],
      ),
      question: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question'],
      )!,
      answer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer'],
      )!,
      nextReview: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_review'],
      ),
      easeFactor: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}ease_factor'],
      )!,
      interval: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}interval'],
      )!,
      repetitions: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}repetitions'],
      )!,
    );
  }

  @override
  $FlashcardsTable createAlias(String alias) {
    return $FlashcardsTable(attachedDatabase, alias);
  }
}

class Flashcard extends DataClass implements Insertable<Flashcard> {
  final String id;
  final String roadmapId;
  final String? taskId;
  final String question;
  final String answer;
  final int? nextReview;
  final double easeFactor;
  final int interval;
  final int repetitions;
  const Flashcard({
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
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['roadmap_id'] = Variable<String>(roadmapId);
    if (!nullToAbsent || taskId != null) {
      map['task_id'] = Variable<String>(taskId);
    }
    map['question'] = Variable<String>(question);
    map['answer'] = Variable<String>(answer);
    if (!nullToAbsent || nextReview != null) {
      map['next_review'] = Variable<int>(nextReview);
    }
    map['ease_factor'] = Variable<double>(easeFactor);
    map['interval'] = Variable<int>(interval);
    map['repetitions'] = Variable<int>(repetitions);
    return map;
  }

  FlashcardsCompanion toCompanion(bool nullToAbsent) {
    return FlashcardsCompanion(
      id: Value(id),
      roadmapId: Value(roadmapId),
      taskId: taskId == null && nullToAbsent
          ? const Value.absent()
          : Value(taskId),
      question: Value(question),
      answer: Value(answer),
      nextReview: nextReview == null && nullToAbsent
          ? const Value.absent()
          : Value(nextReview),
      easeFactor: Value(easeFactor),
      interval: Value(interval),
      repetitions: Value(repetitions),
    );
  }

  factory Flashcard.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Flashcard(
      id: serializer.fromJson<String>(json['id']),
      roadmapId: serializer.fromJson<String>(json['roadmapId']),
      taskId: serializer.fromJson<String?>(json['taskId']),
      question: serializer.fromJson<String>(json['question']),
      answer: serializer.fromJson<String>(json['answer']),
      nextReview: serializer.fromJson<int?>(json['nextReview']),
      easeFactor: serializer.fromJson<double>(json['easeFactor']),
      interval: serializer.fromJson<int>(json['interval']),
      repetitions: serializer.fromJson<int>(json['repetitions']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'roadmapId': serializer.toJson<String>(roadmapId),
      'taskId': serializer.toJson<String?>(taskId),
      'question': serializer.toJson<String>(question),
      'answer': serializer.toJson<String>(answer),
      'nextReview': serializer.toJson<int?>(nextReview),
      'easeFactor': serializer.toJson<double>(easeFactor),
      'interval': serializer.toJson<int>(interval),
      'repetitions': serializer.toJson<int>(repetitions),
    };
  }

  Flashcard copyWith({
    String? id,
    String? roadmapId,
    Value<String?> taskId = const Value.absent(),
    String? question,
    String? answer,
    Value<int?> nextReview = const Value.absent(),
    double? easeFactor,
    int? interval,
    int? repetitions,
  }) => Flashcard(
    id: id ?? this.id,
    roadmapId: roadmapId ?? this.roadmapId,
    taskId: taskId.present ? taskId.value : this.taskId,
    question: question ?? this.question,
    answer: answer ?? this.answer,
    nextReview: nextReview.present ? nextReview.value : this.nextReview,
    easeFactor: easeFactor ?? this.easeFactor,
    interval: interval ?? this.interval,
    repetitions: repetitions ?? this.repetitions,
  );
  Flashcard copyWithCompanion(FlashcardsCompanion data) {
    return Flashcard(
      id: data.id.present ? data.id.value : this.id,
      roadmapId: data.roadmapId.present ? data.roadmapId.value : this.roadmapId,
      taskId: data.taskId.present ? data.taskId.value : this.taskId,
      question: data.question.present ? data.question.value : this.question,
      answer: data.answer.present ? data.answer.value : this.answer,
      nextReview: data.nextReview.present
          ? data.nextReview.value
          : this.nextReview,
      easeFactor: data.easeFactor.present
          ? data.easeFactor.value
          : this.easeFactor,
      interval: data.interval.present ? data.interval.value : this.interval,
      repetitions: data.repetitions.present
          ? data.repetitions.value
          : this.repetitions,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Flashcard(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('taskId: $taskId, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('nextReview: $nextReview, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('interval: $interval, ')
          ..write('repetitions: $repetitions')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    roadmapId,
    taskId,
    question,
    answer,
    nextReview,
    easeFactor,
    interval,
    repetitions,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Flashcard &&
          other.id == this.id &&
          other.roadmapId == this.roadmapId &&
          other.taskId == this.taskId &&
          other.question == this.question &&
          other.answer == this.answer &&
          other.nextReview == this.nextReview &&
          other.easeFactor == this.easeFactor &&
          other.interval == this.interval &&
          other.repetitions == this.repetitions);
}

class FlashcardsCompanion extends UpdateCompanion<Flashcard> {
  final Value<String> id;
  final Value<String> roadmapId;
  final Value<String?> taskId;
  final Value<String> question;
  final Value<String> answer;
  final Value<int?> nextReview;
  final Value<double> easeFactor;
  final Value<int> interval;
  final Value<int> repetitions;
  final Value<int> rowid;
  const FlashcardsCompanion({
    this.id = const Value.absent(),
    this.roadmapId = const Value.absent(),
    this.taskId = const Value.absent(),
    this.question = const Value.absent(),
    this.answer = const Value.absent(),
    this.nextReview = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.interval = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  FlashcardsCompanion.insert({
    required String id,
    required String roadmapId,
    this.taskId = const Value.absent(),
    required String question,
    required String answer,
    this.nextReview = const Value.absent(),
    this.easeFactor = const Value.absent(),
    this.interval = const Value.absent(),
    this.repetitions = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       roadmapId = Value(roadmapId),
       question = Value(question),
       answer = Value(answer);
  static Insertable<Flashcard> custom({
    Expression<String>? id,
    Expression<String>? roadmapId,
    Expression<String>? taskId,
    Expression<String>? question,
    Expression<String>? answer,
    Expression<int>? nextReview,
    Expression<double>? easeFactor,
    Expression<int>? interval,
    Expression<int>? repetitions,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (roadmapId != null) 'roadmap_id': roadmapId,
      if (taskId != null) 'task_id': taskId,
      if (question != null) 'question': question,
      if (answer != null) 'answer': answer,
      if (nextReview != null) 'next_review': nextReview,
      if (easeFactor != null) 'ease_factor': easeFactor,
      if (interval != null) 'interval': interval,
      if (repetitions != null) 'repetitions': repetitions,
      if (rowid != null) 'rowid': rowid,
    });
  }

  FlashcardsCompanion copyWith({
    Value<String>? id,
    Value<String>? roadmapId,
    Value<String?>? taskId,
    Value<String>? question,
    Value<String>? answer,
    Value<int?>? nextReview,
    Value<double>? easeFactor,
    Value<int>? interval,
    Value<int>? repetitions,
    Value<int>? rowid,
  }) {
    return FlashcardsCompanion(
      id: id ?? this.id,
      roadmapId: roadmapId ?? this.roadmapId,
      taskId: taskId ?? this.taskId,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      nextReview: nextReview ?? this.nextReview,
      easeFactor: easeFactor ?? this.easeFactor,
      interval: interval ?? this.interval,
      repetitions: repetitions ?? this.repetitions,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (roadmapId.present) {
      map['roadmap_id'] = Variable<String>(roadmapId.value);
    }
    if (taskId.present) {
      map['task_id'] = Variable<String>(taskId.value);
    }
    if (question.present) {
      map['question'] = Variable<String>(question.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (nextReview.present) {
      map['next_review'] = Variable<int>(nextReview.value);
    }
    if (easeFactor.present) {
      map['ease_factor'] = Variable<double>(easeFactor.value);
    }
    if (interval.present) {
      map['interval'] = Variable<int>(interval.value);
    }
    if (repetitions.present) {
      map['repetitions'] = Variable<int>(repetitions.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FlashcardsCompanion(')
          ..write('id: $id, ')
          ..write('roadmapId: $roadmapId, ')
          ..write('taskId: $taskId, ')
          ..write('question: $question, ')
          ..write('answer: $answer, ')
          ..write('nextReview: $nextReview, ')
          ..write('easeFactor: $easeFactor, ')
          ..write('interval: $interval, ')
          ..write('repetitions: $repetitions, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReviewsTable extends Reviews with TableInfo<$ReviewsTable, Review> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReviewsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _flashcardIdMeta = const VerificationMeta(
    'flashcardId',
  );
  @override
  late final GeneratedColumn<String> flashcardId = GeneratedColumn<String>(
    'flashcard_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES flashcards (id)',
    ),
  );
  static const VerificationMeta _qualityMeta = const VerificationMeta(
    'quality',
  );
  @override
  late final GeneratedColumn<int> quality = GeneratedColumn<int>(
    'quality',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _reviewedAtMeta = const VerificationMeta(
    'reviewedAt',
  );
  @override
  late final GeneratedColumn<int> reviewedAt = GeneratedColumn<int>(
    'reviewed_at',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, flashcardId, quality, reviewedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reviews';
  @override
  VerificationContext validateIntegrity(
    Insertable<Review> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('flashcard_id')) {
      context.handle(
        _flashcardIdMeta,
        flashcardId.isAcceptableOrUnknown(
          data['flashcard_id']!,
          _flashcardIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_flashcardIdMeta);
    }
    if (data.containsKey('quality')) {
      context.handle(
        _qualityMeta,
        quality.isAcceptableOrUnknown(data['quality']!, _qualityMeta),
      );
    } else if (isInserting) {
      context.missing(_qualityMeta);
    }
    if (data.containsKey('reviewed_at')) {
      context.handle(
        _reviewedAtMeta,
        reviewedAt.isAcceptableOrUnknown(data['reviewed_at']!, _reviewedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_reviewedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Review map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Review(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      flashcardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}flashcard_id'],
      )!,
      quality: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quality'],
      )!,
      reviewedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}reviewed_at'],
      )!,
    );
  }

  @override
  $ReviewsTable createAlias(String alias) {
    return $ReviewsTable(attachedDatabase, alias);
  }
}

class Review extends DataClass implements Insertable<Review> {
  final String id;
  final String flashcardId;
  final int quality;
  final int reviewedAt;
  const Review({
    required this.id,
    required this.flashcardId,
    required this.quality,
    required this.reviewedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['flashcard_id'] = Variable<String>(flashcardId);
    map['quality'] = Variable<int>(quality);
    map['reviewed_at'] = Variable<int>(reviewedAt);
    return map;
  }

  ReviewsCompanion toCompanion(bool nullToAbsent) {
    return ReviewsCompanion(
      id: Value(id),
      flashcardId: Value(flashcardId),
      quality: Value(quality),
      reviewedAt: Value(reviewedAt),
    );
  }

  factory Review.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Review(
      id: serializer.fromJson<String>(json['id']),
      flashcardId: serializer.fromJson<String>(json['flashcardId']),
      quality: serializer.fromJson<int>(json['quality']),
      reviewedAt: serializer.fromJson<int>(json['reviewedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'flashcardId': serializer.toJson<String>(flashcardId),
      'quality': serializer.toJson<int>(quality),
      'reviewedAt': serializer.toJson<int>(reviewedAt),
    };
  }

  Review copyWith({
    String? id,
    String? flashcardId,
    int? quality,
    int? reviewedAt,
  }) => Review(
    id: id ?? this.id,
    flashcardId: flashcardId ?? this.flashcardId,
    quality: quality ?? this.quality,
    reviewedAt: reviewedAt ?? this.reviewedAt,
  );
  Review copyWithCompanion(ReviewsCompanion data) {
    return Review(
      id: data.id.present ? data.id.value : this.id,
      flashcardId: data.flashcardId.present
          ? data.flashcardId.value
          : this.flashcardId,
      quality: data.quality.present ? data.quality.value : this.quality,
      reviewedAt: data.reviewedAt.present
          ? data.reviewedAt.value
          : this.reviewedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Review(')
          ..write('id: $id, ')
          ..write('flashcardId: $flashcardId, ')
          ..write('quality: $quality, ')
          ..write('reviewedAt: $reviewedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, flashcardId, quality, reviewedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Review &&
          other.id == this.id &&
          other.flashcardId == this.flashcardId &&
          other.quality == this.quality &&
          other.reviewedAt == this.reviewedAt);
}

class ReviewsCompanion extends UpdateCompanion<Review> {
  final Value<String> id;
  final Value<String> flashcardId;
  final Value<int> quality;
  final Value<int> reviewedAt;
  final Value<int> rowid;
  const ReviewsCompanion({
    this.id = const Value.absent(),
    this.flashcardId = const Value.absent(),
    this.quality = const Value.absent(),
    this.reviewedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReviewsCompanion.insert({
    required String id,
    required String flashcardId,
    required int quality,
    required int reviewedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       flashcardId = Value(flashcardId),
       quality = Value(quality),
       reviewedAt = Value(reviewedAt);
  static Insertable<Review> custom({
    Expression<String>? id,
    Expression<String>? flashcardId,
    Expression<int>? quality,
    Expression<int>? reviewedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (flashcardId != null) 'flashcard_id': flashcardId,
      if (quality != null) 'quality': quality,
      if (reviewedAt != null) 'reviewed_at': reviewedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReviewsCompanion copyWith({
    Value<String>? id,
    Value<String>? flashcardId,
    Value<int>? quality,
    Value<int>? reviewedAt,
    Value<int>? rowid,
  }) {
    return ReviewsCompanion(
      id: id ?? this.id,
      flashcardId: flashcardId ?? this.flashcardId,
      quality: quality ?? this.quality,
      reviewedAt: reviewedAt ?? this.reviewedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (flashcardId.present) {
      map['flashcard_id'] = Variable<String>(flashcardId.value);
    }
    if (quality.present) {
      map['quality'] = Variable<int>(quality.value);
    }
    if (reviewedAt.present) {
      map['reviewed_at'] = Variable<int>(reviewedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReviewsCompanion(')
          ..write('id: $id, ')
          ..write('flashcardId: $flashcardId, ')
          ..write('quality: $quality, ')
          ..write('reviewedAt: $reviewedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RoadmapsTable roadmaps = $RoadmapsTable(this);
  late final $PhasesTable phases = $PhasesTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $ResourcesTable resources = $ResourcesTable(this);
  late final $TaskResourcesTable taskResources = $TaskResourcesTable(this);
  late final $FlashcardsTable flashcards = $FlashcardsTable(this);
  late final $ReviewsTable reviews = $ReviewsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    roadmaps,
    phases,
    tasks,
    resources,
    taskResources,
    flashcards,
    reviews,
  ];
}

typedef $$RoadmapsTableCreateCompanionBuilder =
    RoadmapsCompanion Function({
      required String id,
      required String title,
      Value<String?> description,
      Value<int?> targetDate,
      Value<String> status,
      Value<int> dailyMinutes,
      required int createdAt,
      required int updatedAt,
      Value<int?> syncedAt,
      Value<int> rowid,
    });
typedef $$RoadmapsTableUpdateCompanionBuilder =
    RoadmapsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> description,
      Value<int?> targetDate,
      Value<String> status,
      Value<int> dailyMinutes,
      Value<int> createdAt,
      Value<int> updatedAt,
      Value<int?> syncedAt,
      Value<int> rowid,
    });

final class $$RoadmapsTableReferences
    extends BaseReferences<_$AppDatabase, $RoadmapsTable, Roadmap> {
  $$RoadmapsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PhasesTable, List<Phase>> _phasesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.phases,
    aliasName: $_aliasNameGenerator(db.roadmaps.id, db.phases.roadmapId),
  );

  $$PhasesTableProcessedTableManager get phasesRefs {
    final manager = $$PhasesTableTableManager(
      $_db,
      $_db.phases,
    ).filter((f) => f.roadmapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_phasesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FlashcardsTable, List<Flashcard>>
  _flashcardsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.flashcards,
    aliasName: $_aliasNameGenerator(db.roadmaps.id, db.flashcards.roadmapId),
  );

  $$FlashcardsTableProcessedTableManager get flashcardsRefs {
    final manager = $$FlashcardsTableTableManager(
      $_db,
      $_db.flashcards,
    ).filter((f) => f.roadmapId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_flashcardsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoadmapsTableFilterComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dailyMinutes => $composableBuilder(
    column: $table.dailyMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> phasesRefs(
    Expression<bool> Function($$PhasesTableFilterComposer f) f,
  ) {
    final $$PhasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.phases,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhasesTableFilterComposer(
            $db: $db,
            $table: $db.phases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> flashcardsRefs(
    Expression<bool> Function($$FlashcardsTableFilterComposer f) f,
  ) {
    final $$FlashcardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableFilterComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dailyMinutes => $composableBuilder(
    column: $table.dailyMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoadmapsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoadmapsTable> {
  $$RoadmapsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get targetDate => $composableBuilder(
    column: $table.targetDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get dailyMinutes => $composableBuilder(
    column: $table.dailyMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);

  Expression<T> phasesRefs<T extends Object>(
    Expression<T> Function($$PhasesTableAnnotationComposer a) f,
  ) {
    final $$PhasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.phases,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhasesTableAnnotationComposer(
            $db: $db,
            $table: $db.phases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> flashcardsRefs<T extends Object>(
    Expression<T> Function($$FlashcardsTableAnnotationComposer a) f,
  ) {
    final $$FlashcardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.roadmapId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableAnnotationComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RoadmapsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoadmapsTable,
          Roadmap,
          $$RoadmapsTableFilterComposer,
          $$RoadmapsTableOrderingComposer,
          $$RoadmapsTableAnnotationComposer,
          $$RoadmapsTableCreateCompanionBuilder,
          $$RoadmapsTableUpdateCompanionBuilder,
          (Roadmap, $$RoadmapsTableReferences),
          Roadmap,
          PrefetchHooks Function({bool phasesRefs, bool flashcardsRefs})
        > {
  $$RoadmapsTableTableManager(_$AppDatabase db, $RoadmapsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RoadmapsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RoadmapsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RoadmapsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int?> targetDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> dailyMinutes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> updatedAt = const Value.absent(),
                Value<int?> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapsCompanion(
                id: id,
                title: title,
                description: description,
                targetDate: targetDate,
                status: status,
                dailyMinutes: dailyMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<int?> targetDate = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> dailyMinutes = const Value.absent(),
                required int createdAt,
                required int updatedAt,
                Value<int?> syncedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RoadmapsCompanion.insert(
                id: id,
                title: title,
                description: description,
                targetDate: targetDate,
                status: status,
                dailyMinutes: dailyMinutes,
                createdAt: createdAt,
                updatedAt: updatedAt,
                syncedAt: syncedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RoadmapsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({phasesRefs = false, flashcardsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (phasesRefs) db.phases,
                    if (flashcardsRefs) db.flashcards,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (phasesRefs)
                        await $_getPrefetchedData<
                          Roadmap,
                          $RoadmapsTable,
                          Phase
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapsTableReferences
                              ._phasesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapsTableReferences(
                                db,
                                table,
                                p0,
                              ).phasesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roadmapId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (flashcardsRefs)
                        await $_getPrefetchedData<
                          Roadmap,
                          $RoadmapsTable,
                          Flashcard
                        >(
                          currentTable: table,
                          referencedTable: $$RoadmapsTableReferences
                              ._flashcardsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RoadmapsTableReferences(
                                db,
                                table,
                                p0,
                              ).flashcardsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.roadmapId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RoadmapsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoadmapsTable,
      Roadmap,
      $$RoadmapsTableFilterComposer,
      $$RoadmapsTableOrderingComposer,
      $$RoadmapsTableAnnotationComposer,
      $$RoadmapsTableCreateCompanionBuilder,
      $$RoadmapsTableUpdateCompanionBuilder,
      (Roadmap, $$RoadmapsTableReferences),
      Roadmap,
      PrefetchHooks Function({bool phasesRefs, bool flashcardsRefs})
    >;
typedef $$PhasesTableCreateCompanionBuilder =
    PhasesCompanion Function({
      required String id,
      required String roadmapId,
      required String title,
      Value<String?> description,
      required int orderIndex,
      Value<String> status,
      Value<int> rowid,
    });
typedef $$PhasesTableUpdateCompanionBuilder =
    PhasesCompanion Function({
      Value<String> id,
      Value<String> roadmapId,
      Value<String> title,
      Value<String?> description,
      Value<int> orderIndex,
      Value<String> status,
      Value<int> rowid,
    });

final class $$PhasesTableReferences
    extends BaseReferences<_$AppDatabase, $PhasesTable, Phase> {
  $$PhasesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoadmapsTable _roadmapIdTable(_$AppDatabase db) => db.roadmaps
      .createAlias($_aliasNameGenerator(db.phases.roadmapId, db.roadmaps.id));

  $$RoadmapsTableProcessedTableManager get roadmapId {
    final $_column = $_itemColumn<String>('roadmap_id')!;

    final manager = $$RoadmapsTableTableManager(
      $_db,
      $_db.roadmaps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roadmapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _tasksRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.phases.id, db.tasks.phaseId),
  );

  $$TasksTableProcessedTableManager get tasksRefs {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.phaseId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_tasksRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PhasesTableFilterComposer
    extends Composer<_$AppDatabase, $PhasesTable> {
  $$PhasesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapsTableFilterComposer get roadmapId {
    final $$RoadmapsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableFilterComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> tasksRefs(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.phaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PhasesTableOrderingComposer
    extends Composer<_$AppDatabase, $PhasesTable> {
  $$PhasesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapsTableOrderingComposer get roadmapId {
    final $$RoadmapsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PhasesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhasesTable> {
  $$PhasesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get orderIndex => $composableBuilder(
    column: $table.orderIndex,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$RoadmapsTableAnnotationComposer get roadmapId {
    final $$RoadmapsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> tasksRefs<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.phaseId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PhasesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhasesTable,
          Phase,
          $$PhasesTableFilterComposer,
          $$PhasesTableOrderingComposer,
          $$PhasesTableAnnotationComposer,
          $$PhasesTableCreateCompanionBuilder,
          $$PhasesTableUpdateCompanionBuilder,
          (Phase, $$PhasesTableReferences),
          Phase,
          PrefetchHooks Function({bool roadmapId, bool tasksRefs})
        > {
  $$PhasesTableTableManager(_$AppDatabase db, $PhasesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhasesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhasesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhasesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roadmapId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> orderIndex = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhasesCompanion(
                id: id,
                roadmapId: roadmapId,
                title: title,
                description: description,
                orderIndex: orderIndex,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roadmapId,
                required String title,
                Value<String?> description = const Value.absent(),
                required int orderIndex,
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhasesCompanion.insert(
                id: id,
                roadmapId: roadmapId,
                title: title,
                description: description,
                orderIndex: orderIndex,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PhasesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({roadmapId = false, tasksRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (tasksRefs) db.tasks],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (roadmapId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.roadmapId,
                                referencedTable: $$PhasesTableReferences
                                    ._roadmapIdTable(db),
                                referencedColumn: $$PhasesTableReferences
                                    ._roadmapIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (tasksRefs)
                    await $_getPrefetchedData<Phase, $PhasesTable, Task>(
                      currentTable: table,
                      referencedTable: $$PhasesTableReferences._tasksRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$PhasesTableReferences(db, table, p0).tasksRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.phaseId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PhasesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhasesTable,
      Phase,
      $$PhasesTableFilterComposer,
      $$PhasesTableOrderingComposer,
      $$PhasesTableAnnotationComposer,
      $$PhasesTableCreateCompanionBuilder,
      $$PhasesTableUpdateCompanionBuilder,
      (Phase, $$PhasesTableReferences),
      Phase,
      PrefetchHooks Function({bool roadmapId, bool tasksRefs})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      required String id,
      required String phaseId,
      required String title,
      Value<String?> description,
      Value<String> type,
      Value<String> status,
      Value<int?> estimatedMinutes,
      Value<int?> completedAt,
      Value<int?> dueDate,
      Value<int> rowid,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<String> id,
      Value<String> phaseId,
      Value<String> title,
      Value<String?> description,
      Value<String> type,
      Value<String> status,
      Value<int?> estimatedMinutes,
      Value<int?> completedAt,
      Value<int?> dueDate,
      Value<int> rowid,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$AppDatabase, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PhasesTable _phaseIdTable(_$AppDatabase db) => db.phases.createAlias(
    $_aliasNameGenerator(db.tasks.phaseId, db.phases.id),
  );

  $$PhasesTableProcessedTableManager get phaseId {
    final $_column = $_itemColumn<String>('phase_id')!;

    final manager = $$PhasesTableTableManager(
      $_db,
      $_db.phases,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_phaseIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TaskResourcesTable, List<TaskResource>>
  _taskResourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.taskResources,
    aliasName: $_aliasNameGenerator(db.tasks.id, db.taskResources.taskId),
  );

  $$TaskResourcesTableProcessedTableManager get taskResourcesRefs {
    final manager = $$TaskResourcesTableTableManager(
      $_db,
      $_db.taskResources,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskResourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$FlashcardsTable, List<Flashcard>>
  _flashcardsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.flashcards,
    aliasName: $_aliasNameGenerator(db.tasks.id, db.flashcards.taskId),
  );

  $$FlashcardsTableProcessedTableManager get flashcardsRefs {
    final manager = $$FlashcardsTableTableManager(
      $_db,
      $_db.flashcards,
    ).filter((f) => f.taskId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_flashcardsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnFilters(column),
  );

  $$PhasesTableFilterComposer get phaseId {
    final $$PhasesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phaseId,
      referencedTable: $db.phases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhasesTableFilterComposer(
            $db: $db,
            $table: $db.phases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> taskResourcesRefs(
    Expression<bool> Function($$TaskResourcesTableFilterComposer f) f,
  ) {
    final $$TaskResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskResources,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskResourcesTableFilterComposer(
            $db: $db,
            $table: $db.taskResources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> flashcardsRefs(
    Expression<bool> Function($$FlashcardsTableFilterComposer f) f,
  ) {
    final $$FlashcardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableFilterComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dueDate => $composableBuilder(
    column: $table.dueDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$PhasesTableOrderingComposer get phaseId {
    final $$PhasesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phaseId,
      referencedTable: $db.phases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhasesTableOrderingComposer(
            $db: $db,
            $table: $db.phases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get completedAt => $composableBuilder(
    column: $table.completedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get dueDate =>
      $composableBuilder(column: $table.dueDate, builder: (column) => column);

  $$PhasesTableAnnotationComposer get phaseId {
    final $$PhasesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.phaseId,
      referencedTable: $db.phases,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PhasesTableAnnotationComposer(
            $db: $db,
            $table: $db.phases,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> taskResourcesRefs<T extends Object>(
    Expression<T> Function($$TaskResourcesTableAnnotationComposer a) f,
  ) {
    final $$TaskResourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskResources,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskResourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.taskResources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> flashcardsRefs<T extends Object>(
    Expression<T> Function($$FlashcardsTableAnnotationComposer a) f,
  ) {
    final $$FlashcardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.taskId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableAnnotationComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({
            bool phaseId,
            bool taskResourcesRefs,
            bool flashcardsRefs,
          })
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> phaseId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> estimatedMinutes = const Value.absent(),
                Value<int?> completedAt = const Value.absent(),
                Value<int?> dueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                phaseId: phaseId,
                title: title,
                description: description,
                type: type,
                status: status,
                estimatedMinutes: estimatedMinutes,
                completedAt: completedAt,
                dueDate: dueDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String phaseId,
                required String title,
                Value<String?> description = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int?> estimatedMinutes = const Value.absent(),
                Value<int?> completedAt = const Value.absent(),
                Value<int?> dueDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                phaseId: phaseId,
                title: title,
                description: description,
                type: type,
                status: status,
                estimatedMinutes: estimatedMinutes,
                completedAt: completedAt,
                dueDate: dueDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TasksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                phaseId = false,
                taskResourcesRefs = false,
                flashcardsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (taskResourcesRefs) db.taskResources,
                    if (flashcardsRefs) db.flashcards,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (phaseId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.phaseId,
                                    referencedTable: $$TasksTableReferences
                                        ._phaseIdTable(db),
                                    referencedColumn: $$TasksTableReferences
                                        ._phaseIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (taskResourcesRefs)
                        await $_getPrefetchedData<
                          Task,
                          $TasksTable,
                          TaskResource
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableReferences
                              ._taskResourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableReferences(
                                db,
                                table,
                                p0,
                              ).taskResourcesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taskId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (flashcardsRefs)
                        await $_getPrefetchedData<Task, $TasksTable, Flashcard>(
                          currentTable: table,
                          referencedTable: $$TasksTableReferences
                              ._flashcardsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableReferences(
                                db,
                                table,
                                p0,
                              ).flashcardsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.taskId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({
        bool phaseId,
        bool taskResourcesRefs,
        bool flashcardsRefs,
      })
    >;
typedef $$ResourcesTableCreateCompanionBuilder =
    ResourcesCompanion Function({
      required String id,
      required String title,
      required String url,
      Value<String?> type,
      Value<String?> difficulty,
      Value<int?> estimatedMinutes,
      Value<double?> rating,
      Value<bool> isBookmarked,
      Value<String?> notes,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$ResourcesTableUpdateCompanionBuilder =
    ResourcesCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> url,
      Value<String?> type,
      Value<String?> difficulty,
      Value<int?> estimatedMinutes,
      Value<double?> rating,
      Value<bool> isBookmarked,
      Value<String?> notes,
      Value<int> createdAt,
      Value<int> rowid,
    });

final class $$ResourcesTableReferences
    extends BaseReferences<_$AppDatabase, $ResourcesTable, Resource> {
  $$ResourcesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TaskResourcesTable, List<TaskResource>>
  _taskResourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.taskResources,
    aliasName: $_aliasNameGenerator(
      db.resources.id,
      db.taskResources.resourceId,
    ),
  );

  $$TaskResourcesTableProcessedTableManager get taskResourcesRefs {
    final manager = $$TaskResourcesTableTableManager(
      $_db,
      $_db.taskResources,
    ).filter((f) => f.resourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskResourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ResourcesTableFilterComposer
    extends Composer<_$AppDatabase, $ResourcesTable> {
  $$ResourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> taskResourcesRefs(
    Expression<bool> Function($$TaskResourcesTableFilterComposer f) f,
  ) {
    final $$TaskResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskResources,
      getReferencedColumn: (t) => t.resourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskResourcesTableFilterComposer(
            $db: $db,
            $table: $db.taskResources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $ResourcesTable> {
  $$ResourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ResourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResourcesTable> {
  $$ResourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get difficulty => $composableBuilder(
    column: $table.difficulty,
    builder: (column) => column,
  );

  GeneratedColumn<int> get estimatedMinutes => $composableBuilder(
    column: $table.estimatedMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<bool> get isBookmarked => $composableBuilder(
    column: $table.isBookmarked,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> taskResourcesRefs<T extends Object>(
    Expression<T> Function($$TaskResourcesTableAnnotationComposer a) f,
  ) {
    final $$TaskResourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.taskResources,
      getReferencedColumn: (t) => t.resourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TaskResourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.taskResources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ResourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResourcesTable,
          Resource,
          $$ResourcesTableFilterComposer,
          $$ResourcesTableOrderingComposer,
          $$ResourcesTableAnnotationComposer,
          $$ResourcesTableCreateCompanionBuilder,
          $$ResourcesTableUpdateCompanionBuilder,
          (Resource, $$ResourcesTableReferences),
          Resource,
          PrefetchHooks Function({bool taskResourcesRefs})
        > {
  $$ResourcesTableTableManager(_$AppDatabase db, $ResourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String?> type = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<int?> estimatedMinutes = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResourcesCompanion(
                id: id,
                title: title,
                url: url,
                type: type,
                difficulty: difficulty,
                estimatedMinutes: estimatedMinutes,
                rating: rating,
                isBookmarked: isBookmarked,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String url,
                Value<String?> type = const Value.absent(),
                Value<String?> difficulty = const Value.absent(),
                Value<int?> estimatedMinutes = const Value.absent(),
                Value<double?> rating = const Value.absent(),
                Value<bool> isBookmarked = const Value.absent(),
                Value<String?> notes = const Value.absent(),
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => ResourcesCompanion.insert(
                id: id,
                title: title,
                url: url,
                type: type,
                difficulty: difficulty,
                estimatedMinutes: estimatedMinutes,
                rating: rating,
                isBookmarked: isBookmarked,
                notes: notes,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ResourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskResourcesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (taskResourcesRefs) db.taskResources,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (taskResourcesRefs)
                    await $_getPrefetchedData<
                      Resource,
                      $ResourcesTable,
                      TaskResource
                    >(
                      currentTable: table,
                      referencedTable: $$ResourcesTableReferences
                          ._taskResourcesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ResourcesTableReferences(
                            db,
                            table,
                            p0,
                          ).taskResourcesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.resourceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ResourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResourcesTable,
      Resource,
      $$ResourcesTableFilterComposer,
      $$ResourcesTableOrderingComposer,
      $$ResourcesTableAnnotationComposer,
      $$ResourcesTableCreateCompanionBuilder,
      $$ResourcesTableUpdateCompanionBuilder,
      (Resource, $$ResourcesTableReferences),
      Resource,
      PrefetchHooks Function({bool taskResourcesRefs})
    >;
typedef $$TaskResourcesTableCreateCompanionBuilder =
    TaskResourcesCompanion Function({
      required String taskId,
      required String resourceId,
      Value<int> rowid,
    });
typedef $$TaskResourcesTableUpdateCompanionBuilder =
    TaskResourcesCompanion Function({
      Value<String> taskId,
      Value<String> resourceId,
      Value<int> rowid,
    });

final class $$TaskResourcesTableReferences
    extends BaseReferences<_$AppDatabase, $TaskResourcesTable, TaskResource> {
  $$TaskResourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TasksTable _taskIdTable(_$AppDatabase db) => db.tasks.createAlias(
    $_aliasNameGenerator(db.taskResources.taskId, db.tasks.id),
  );

  $$TasksTableProcessedTableManager get taskId {
    final $_column = $_itemColumn<String>('task_id')!;

    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ResourcesTable _resourceIdTable(_$AppDatabase db) =>
      db.resources.createAlias(
        $_aliasNameGenerator(db.taskResources.resourceId, db.resources.id),
      );

  $$ResourcesTableProcessedTableManager get resourceId {
    final $_column = $_itemColumn<String>('resource_id')!;

    final manager = $$ResourcesTableTableManager(
      $_db,
      $_db.resources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_resourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TaskResourcesTableFilterComposer
    extends Composer<_$AppDatabase, $TaskResourcesTable> {
  $$TaskResourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableFilterComposer get taskId {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ResourcesTableFilterComposer get resourceId {
    final $$ResourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceId,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableFilterComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskResourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $TaskResourcesTable> {
  $$TaskResourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableOrderingComposer get taskId {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ResourcesTableOrderingComposer get resourceId {
    final $$ResourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceId,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableOrderingComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskResourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TaskResourcesTable> {
  $$TaskResourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableAnnotationComposer get taskId {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ResourcesTableAnnotationComposer get resourceId {
    final $$ResourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.resourceId,
      referencedTable: $db.resources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.resources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TaskResourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TaskResourcesTable,
          TaskResource,
          $$TaskResourcesTableFilterComposer,
          $$TaskResourcesTableOrderingComposer,
          $$TaskResourcesTableAnnotationComposer,
          $$TaskResourcesTableCreateCompanionBuilder,
          $$TaskResourcesTableUpdateCompanionBuilder,
          (TaskResource, $$TaskResourcesTableReferences),
          TaskResource,
          PrefetchHooks Function({bool taskId, bool resourceId})
        > {
  $$TaskResourcesTableTableManager(_$AppDatabase db, $TaskResourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TaskResourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TaskResourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TaskResourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> taskId = const Value.absent(),
                Value<String> resourceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TaskResourcesCompanion(
                taskId: taskId,
                resourceId: resourceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String taskId,
                required String resourceId,
                Value<int> rowid = const Value.absent(),
              }) => TaskResourcesCompanion.insert(
                taskId: taskId,
                resourceId: resourceId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$TaskResourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({taskId = false, resourceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (taskId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.taskId,
                                referencedTable: $$TaskResourcesTableReferences
                                    ._taskIdTable(db),
                                referencedColumn: $$TaskResourcesTableReferences
                                    ._taskIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (resourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.resourceId,
                                referencedTable: $$TaskResourcesTableReferences
                                    ._resourceIdTable(db),
                                referencedColumn: $$TaskResourcesTableReferences
                                    ._resourceIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TaskResourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TaskResourcesTable,
      TaskResource,
      $$TaskResourcesTableFilterComposer,
      $$TaskResourcesTableOrderingComposer,
      $$TaskResourcesTableAnnotationComposer,
      $$TaskResourcesTableCreateCompanionBuilder,
      $$TaskResourcesTableUpdateCompanionBuilder,
      (TaskResource, $$TaskResourcesTableReferences),
      TaskResource,
      PrefetchHooks Function({bool taskId, bool resourceId})
    >;
typedef $$FlashcardsTableCreateCompanionBuilder =
    FlashcardsCompanion Function({
      required String id,
      required String roadmapId,
      Value<String?> taskId,
      required String question,
      required String answer,
      Value<int?> nextReview,
      Value<double> easeFactor,
      Value<int> interval,
      Value<int> repetitions,
      Value<int> rowid,
    });
typedef $$FlashcardsTableUpdateCompanionBuilder =
    FlashcardsCompanion Function({
      Value<String> id,
      Value<String> roadmapId,
      Value<String?> taskId,
      Value<String> question,
      Value<String> answer,
      Value<int?> nextReview,
      Value<double> easeFactor,
      Value<int> interval,
      Value<int> repetitions,
      Value<int> rowid,
    });

final class $$FlashcardsTableReferences
    extends BaseReferences<_$AppDatabase, $FlashcardsTable, Flashcard> {
  $$FlashcardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RoadmapsTable _roadmapIdTable(_$AppDatabase db) =>
      db.roadmaps.createAlias(
        $_aliasNameGenerator(db.flashcards.roadmapId, db.roadmaps.id),
      );

  $$RoadmapsTableProcessedTableManager get roadmapId {
    final $_column = $_itemColumn<String>('roadmap_id')!;

    final manager = $$RoadmapsTableTableManager(
      $_db,
      $_db.roadmaps,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roadmapIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TasksTable _taskIdTable(_$AppDatabase db) => db.tasks.createAlias(
    $_aliasNameGenerator(db.flashcards.taskId, db.tasks.id),
  );

  $$TasksTableProcessedTableManager? get taskId {
    final $_column = $_itemColumn<String>('task_id');
    if ($_column == null) return null;
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ReviewsTable, List<Review>> _reviewsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.reviews,
    aliasName: $_aliasNameGenerator(db.flashcards.id, db.reviews.flashcardId),
  );

  $$ReviewsTableProcessedTableManager get reviewsRefs {
    final manager = $$ReviewsTableTableManager(
      $_db,
      $_db.reviews,
    ).filter((f) => f.flashcardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_reviewsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$FlashcardsTableFilterComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answer => $composableBuilder(
    column: $table.answer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnFilters(column),
  );

  $$RoadmapsTableFilterComposer get roadmapId {
    final $$RoadmapsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableFilterComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableFilterComposer get taskId {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> reviewsRefs(
    Expression<bool> Function($$ReviewsTableFilterComposer f) f,
  ) {
    final $$ReviewsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviews,
      getReferencedColumn: (t) => t.flashcardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewsTableFilterComposer(
            $db: $db,
            $table: $db.reviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FlashcardsTableOrderingComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get question => $composableBuilder(
    column: $table.question,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answer => $composableBuilder(
    column: $table.answer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get interval => $composableBuilder(
    column: $table.interval,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => ColumnOrderings(column),
  );

  $$RoadmapsTableOrderingComposer get roadmapId {
    final $$RoadmapsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableOrderingComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableOrderingComposer get taskId {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FlashcardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $FlashcardsTable> {
  $$FlashcardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get question =>
      $composableBuilder(column: $table.question, builder: (column) => column);

  GeneratedColumn<String> get answer =>
      $composableBuilder(column: $table.answer, builder: (column) => column);

  GeneratedColumn<int> get nextReview => $composableBuilder(
    column: $table.nextReview,
    builder: (column) => column,
  );

  GeneratedColumn<double> get easeFactor => $composableBuilder(
    column: $table.easeFactor,
    builder: (column) => column,
  );

  GeneratedColumn<int> get interval =>
      $composableBuilder(column: $table.interval, builder: (column) => column);

  GeneratedColumn<int> get repetitions => $composableBuilder(
    column: $table.repetitions,
    builder: (column) => column,
  );

  $$RoadmapsTableAnnotationComposer get roadmapId {
    final $$RoadmapsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roadmapId,
      referencedTable: $db.roadmaps,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoadmapsTableAnnotationComposer(
            $db: $db,
            $table: $db.roadmaps,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TasksTableAnnotationComposer get taskId {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.taskId,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> reviewsRefs<T extends Object>(
    Expression<T> Function($$ReviewsTableAnnotationComposer a) f,
  ) {
    final $$ReviewsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.reviews,
      getReferencedColumn: (t) => t.flashcardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReviewsTableAnnotationComposer(
            $db: $db,
            $table: $db.reviews,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$FlashcardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FlashcardsTable,
          Flashcard,
          $$FlashcardsTableFilterComposer,
          $$FlashcardsTableOrderingComposer,
          $$FlashcardsTableAnnotationComposer,
          $$FlashcardsTableCreateCompanionBuilder,
          $$FlashcardsTableUpdateCompanionBuilder,
          (Flashcard, $$FlashcardsTableReferences),
          Flashcard,
          PrefetchHooks Function({
            bool roadmapId,
            bool taskId,
            bool reviewsRefs,
          })
        > {
  $$FlashcardsTableTableManager(_$AppDatabase db, $FlashcardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FlashcardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FlashcardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FlashcardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> roadmapId = const Value.absent(),
                Value<String?> taskId = const Value.absent(),
                Value<String> question = const Value.absent(),
                Value<String> answer = const Value.absent(),
                Value<int?> nextReview = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> interval = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlashcardsCompanion(
                id: id,
                roadmapId: roadmapId,
                taskId: taskId,
                question: question,
                answer: answer,
                nextReview: nextReview,
                easeFactor: easeFactor,
                interval: interval,
                repetitions: repetitions,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String roadmapId,
                Value<String?> taskId = const Value.absent(),
                required String question,
                required String answer,
                Value<int?> nextReview = const Value.absent(),
                Value<double> easeFactor = const Value.absent(),
                Value<int> interval = const Value.absent(),
                Value<int> repetitions = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => FlashcardsCompanion.insert(
                id: id,
                roadmapId: roadmapId,
                taskId: taskId,
                question: question,
                answer: answer,
                nextReview: nextReview,
                easeFactor: easeFactor,
                interval: interval,
                repetitions: repetitions,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FlashcardsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({roadmapId = false, taskId = false, reviewsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [if (reviewsRefs) db.reviews],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (roadmapId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.roadmapId,
                                    referencedTable: $$FlashcardsTableReferences
                                        ._roadmapIdTable(db),
                                    referencedColumn:
                                        $$FlashcardsTableReferences
                                            ._roadmapIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (taskId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.taskId,
                                    referencedTable: $$FlashcardsTableReferences
                                        ._taskIdTable(db),
                                    referencedColumn:
                                        $$FlashcardsTableReferences
                                            ._taskIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (reviewsRefs)
                        await $_getPrefetchedData<
                          Flashcard,
                          $FlashcardsTable,
                          Review
                        >(
                          currentTable: table,
                          referencedTable: $$FlashcardsTableReferences
                              ._reviewsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$FlashcardsTableReferences(
                                db,
                                table,
                                p0,
                              ).reviewsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.flashcardId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$FlashcardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FlashcardsTable,
      Flashcard,
      $$FlashcardsTableFilterComposer,
      $$FlashcardsTableOrderingComposer,
      $$FlashcardsTableAnnotationComposer,
      $$FlashcardsTableCreateCompanionBuilder,
      $$FlashcardsTableUpdateCompanionBuilder,
      (Flashcard, $$FlashcardsTableReferences),
      Flashcard,
      PrefetchHooks Function({bool roadmapId, bool taskId, bool reviewsRefs})
    >;
typedef $$ReviewsTableCreateCompanionBuilder =
    ReviewsCompanion Function({
      required String id,
      required String flashcardId,
      required int quality,
      required int reviewedAt,
      Value<int> rowid,
    });
typedef $$ReviewsTableUpdateCompanionBuilder =
    ReviewsCompanion Function({
      Value<String> id,
      Value<String> flashcardId,
      Value<int> quality,
      Value<int> reviewedAt,
      Value<int> rowid,
    });

final class $$ReviewsTableReferences
    extends BaseReferences<_$AppDatabase, $ReviewsTable, Review> {
  $$ReviewsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $FlashcardsTable _flashcardIdTable(_$AppDatabase db) =>
      db.flashcards.createAlias(
        $_aliasNameGenerator(db.reviews.flashcardId, db.flashcards.id),
      );

  $$FlashcardsTableProcessedTableManager get flashcardId {
    final $_column = $_itemColumn<String>('flashcard_id')!;

    final manager = $$FlashcardsTableTableManager(
      $_db,
      $_db.flashcards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_flashcardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReviewsTableFilterComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$FlashcardsTableFilterComposer get flashcardId {
    final $$FlashcardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flashcardId,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableFilterComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quality => $composableBuilder(
    column: $table.quality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$FlashcardsTableOrderingComposer get flashcardId {
    final $$FlashcardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flashcardId,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableOrderingComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReviewsTable> {
  $$ReviewsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quality =>
      $composableBuilder(column: $table.quality, builder: (column) => column);

  GeneratedColumn<int> get reviewedAt => $composableBuilder(
    column: $table.reviewedAt,
    builder: (column) => column,
  );

  $$FlashcardsTableAnnotationComposer get flashcardId {
    final $$FlashcardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.flashcardId,
      referencedTable: $db.flashcards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FlashcardsTableAnnotationComposer(
            $db: $db,
            $table: $db.flashcards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReviewsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReviewsTable,
          Review,
          $$ReviewsTableFilterComposer,
          $$ReviewsTableOrderingComposer,
          $$ReviewsTableAnnotationComposer,
          $$ReviewsTableCreateCompanionBuilder,
          $$ReviewsTableUpdateCompanionBuilder,
          (Review, $$ReviewsTableReferences),
          Review,
          PrefetchHooks Function({bool flashcardId})
        > {
  $$ReviewsTableTableManager(_$AppDatabase db, $ReviewsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReviewsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReviewsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReviewsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> flashcardId = const Value.absent(),
                Value<int> quality = const Value.absent(),
                Value<int> reviewedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReviewsCompanion(
                id: id,
                flashcardId: flashcardId,
                quality: quality,
                reviewedAt: reviewedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String flashcardId,
                required int quality,
                required int reviewedAt,
                Value<int> rowid = const Value.absent(),
              }) => ReviewsCompanion.insert(
                id: id,
                flashcardId: flashcardId,
                quality: quality,
                reviewedAt: reviewedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReviewsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({flashcardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (flashcardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.flashcardId,
                                referencedTable: $$ReviewsTableReferences
                                    ._flashcardIdTable(db),
                                referencedColumn: $$ReviewsTableReferences
                                    ._flashcardIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReviewsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReviewsTable,
      Review,
      $$ReviewsTableFilterComposer,
      $$ReviewsTableOrderingComposer,
      $$ReviewsTableAnnotationComposer,
      $$ReviewsTableCreateCompanionBuilder,
      $$ReviewsTableUpdateCompanionBuilder,
      (Review, $$ReviewsTableReferences),
      Review,
      PrefetchHooks Function({bool flashcardId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RoadmapsTableTableManager get roadmaps =>
      $$RoadmapsTableTableManager(_db, _db.roadmaps);
  $$PhasesTableTableManager get phases =>
      $$PhasesTableTableManager(_db, _db.phases);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$ResourcesTableTableManager get resources =>
      $$ResourcesTableTableManager(_db, _db.resources);
  $$TaskResourcesTableTableManager get taskResources =>
      $$TaskResourcesTableTableManager(_db, _db.taskResources);
  $$FlashcardsTableTableManager get flashcards =>
      $$FlashcardsTableTableManager(_db, _db.flashcards);
  $$ReviewsTableTableManager get reviews =>
      $$ReviewsTableTableManager(_db, _db.reviews);
}
