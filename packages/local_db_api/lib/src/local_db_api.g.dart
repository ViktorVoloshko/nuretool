// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db_api.dart';

// ignore_for_file: type=lint
class $SubjectsTable extends Subjects with TableInfo<$SubjectsTable, Subject> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubjectsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortNameMeta = const VerificationMeta(
    'shortName',
  );
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
    'short_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, shortName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'subjects';
  @override
  VerificationContext validateIntegrity(
    Insertable<Subject> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_name')) {
      context.handle(
        _shortNameMeta,
        shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shortNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Subject map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Subject(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      shortName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}short_name'],
          )!,
    );
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(attachedDatabase, alias);
  }
}

class Subject extends DataClass implements Insertable<Subject> {
  final int id;
  final String name;
  final String shortName;
  const Subject({
    required this.id,
    required this.name,
    required this.shortName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['short_name'] = Variable<String>(shortName);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      name: Value(name),
      shortName: Value(shortName),
    );
  }

  factory Subject.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Subject(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      shortName: serializer.fromJson<String>(json['shortName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'shortName': serializer.toJson<String>(shortName),
    };
  }

  Subject copyWith({int? id, String? name, String? shortName}) => Subject(
    id: id ?? this.id,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, shortName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortName == this.shortName);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> shortName;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String shortName,
  }) : name = Value(name),
       shortName = Value(shortName);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? shortName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortName != null) 'short_name': shortName,
    });
  }

  SubjectsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? shortName,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }
}

class $EventTypesTable extends EventTypes
    with TableInfo<$EventTypesTable, EventType> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortNameMeta = const VerificationMeta(
    'shortName',
  );
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
    'short_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  late final GeneratedColumnWithTypeConverter<EventBaseType, int> baseType =
      GeneratedColumn<int>(
        'base_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<EventBaseType>($EventTypesTable.$converterbaseType);
  @override
  List<GeneratedColumn> get $columns => [id, name, shortName, baseType];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventType> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_name')) {
      context.handle(
        _shortNameMeta,
        shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shortNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventType map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventType(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      shortName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}short_name'],
          )!,
      baseType: $EventTypesTable.$converterbaseType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}base_type'],
        )!,
      ),
    );
  }

  @override
  $EventTypesTable createAlias(String alias) {
    return $EventTypesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EventBaseType, int, int> $converterbaseType =
      const EnumIndexConverter<EventBaseType>(EventBaseType.values);
}

class EventType extends DataClass implements Insertable<EventType> {
  final int id;
  final String name;
  final String shortName;
  final EventBaseType baseType;
  const EventType({
    required this.id,
    required this.name,
    required this.shortName,
    required this.baseType,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['short_name'] = Variable<String>(shortName);
    {
      map['base_type'] = Variable<int>(
        $EventTypesTable.$converterbaseType.toSql(baseType),
      );
    }
    return map;
  }

  EventTypesCompanion toCompanion(bool nullToAbsent) {
    return EventTypesCompanion(
      id: Value(id),
      name: Value(name),
      shortName: Value(shortName),
      baseType: Value(baseType),
    );
  }

  factory EventType.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventType(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      shortName: serializer.fromJson<String>(json['shortName']),
      baseType: $EventTypesTable.$converterbaseType.fromJson(
        serializer.fromJson<int>(json['baseType']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'shortName': serializer.toJson<String>(shortName),
      'baseType': serializer.toJson<int>(
        $EventTypesTable.$converterbaseType.toJson(baseType),
      ),
    };
  }

  EventType copyWith({
    int? id,
    String? name,
    String? shortName,
    EventBaseType? baseType,
  }) => EventType(
    id: id ?? this.id,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
    baseType: baseType ?? this.baseType,
  );
  EventType copyWithCompanion(EventTypesCompanion data) {
    return EventType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
      baseType: data.baseType.present ? data.baseType.value : this.baseType,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventType(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName, ')
          ..write('baseType: $baseType')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, shortName, baseType);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventType &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortName == this.shortName &&
          other.baseType == this.baseType);
}

class EventTypesCompanion extends UpdateCompanion<EventType> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> shortName;
  final Value<EventBaseType> baseType;
  const EventTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
    this.baseType = const Value.absent(),
  });
  EventTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String shortName,
    required EventBaseType baseType,
  }) : name = Value(name),
       shortName = Value(shortName),
       baseType = Value(baseType);
  static Insertable<EventType> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? shortName,
    Expression<int>? baseType,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortName != null) 'short_name': shortName,
      if (baseType != null) 'base_type': baseType,
    });
  }

  EventTypesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? shortName,
    Value<EventBaseType>? baseType,
  }) {
    return EventTypesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      baseType: baseType ?? this.baseType,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    if (baseType.present) {
      map['base_type'] = Variable<int>(
        $EventTypesTable.$converterbaseType.toSql(baseType.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName, ')
          ..write('baseType: $baseType')
          ..write(')'))
        .toString();
  }
}

class $EventsTable extends Events with TableInfo<$EventsTable, Event> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _subjectIDMeta = const VerificationMeta(
    'subjectID',
  );
  @override
  late final GeneratedColumn<int> subjectID = GeneratedColumn<int>(
    'subject_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES subjects (id)',
    ),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
  );
  static const VerificationMeta _typeIDMeta = const VerificationMeta('typeID');
  @override
  late final GeneratedColumn<int> typeID = GeneratedColumn<int>(
    'type_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES event_types (id)',
    ),
  );
  static const VerificationMeta _roomMeta = const VerificationMeta('room');
  @override
  late final GeneratedColumn<String> room = GeneratedColumn<String>(
    'room',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectID,
    startTime,
    endTime,
    isCustom,
    typeID,
    room,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events';
  @override
  VerificationContext validateIntegrity(
    Insertable<Event> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('subject_id')) {
      context.handle(
        _subjectIDMeta,
        subjectID.isAcceptableOrUnknown(data['subject_id']!, _subjectIDMeta),
      );
    } else if (isInserting) {
      context.missing(_subjectIDMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    } else if (isInserting) {
      context.missing(_isCustomMeta);
    }
    if (data.containsKey('type_id')) {
      context.handle(
        _typeIDMeta,
        typeID.isAcceptableOrUnknown(data['type_id']!, _typeIDMeta),
      );
    }
    if (data.containsKey('room')) {
      context.handle(
        _roomMeta,
        room.isAcceptableOrUnknown(data['room']!, _roomMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Event map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Event(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      subjectID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}subject_id'],
          )!,
      startTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}start_time'],
          )!,
      endTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}end_time'],
          )!,
      isCustom:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_custom'],
          )!,
      typeID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type_id'],
      ),
      room: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}room'],
      ),
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final int subjectID;
  final DateTime startTime;
  final DateTime endTime;
  final bool isCustom;
  final int? typeID;
  final String? room;
  const Event({
    required this.id,
    required this.subjectID,
    required this.startTime,
    required this.endTime,
    required this.isCustom,
    this.typeID,
    this.room,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectID);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['is_custom'] = Variable<bool>(isCustom);
    if (!nullToAbsent || typeID != null) {
      map['type_id'] = Variable<int>(typeID);
    }
    if (!nullToAbsent || room != null) {
      map['room'] = Variable<String>(room);
    }
    return map;
  }

  EventsCompanion toCompanion(bool nullToAbsent) {
    return EventsCompanion(
      id: Value(id),
      subjectID: Value(subjectID),
      startTime: Value(startTime),
      endTime: Value(endTime),
      isCustom: Value(isCustom),
      typeID:
          typeID == null && nullToAbsent ? const Value.absent() : Value(typeID),
      room: room == null && nullToAbsent ? const Value.absent() : Value(room),
    );
  }

  factory Event.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Event(
      id: serializer.fromJson<int>(json['id']),
      subjectID: serializer.fromJson<int>(json['subjectID']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      typeID: serializer.fromJson<int?>(json['typeID']),
      room: serializer.fromJson<String?>(json['room']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'subjectID': serializer.toJson<int>(subjectID),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'isCustom': serializer.toJson<bool>(isCustom),
      'typeID': serializer.toJson<int?>(typeID),
      'room': serializer.toJson<String?>(room),
    };
  }

  Event copyWith({
    int? id,
    int? subjectID,
    DateTime? startTime,
    DateTime? endTime,
    bool? isCustom,
    Value<int?> typeID = const Value.absent(),
    Value<String?> room = const Value.absent(),
  }) => Event(
    id: id ?? this.id,
    subjectID: subjectID ?? this.subjectID,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isCustom: isCustom ?? this.isCustom,
    typeID: typeID.present ? typeID.value : this.typeID,
    room: room.present ? room.value : this.room,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      subjectID: data.subjectID.present ? data.subjectID.value : this.subjectID,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      typeID: data.typeID.present ? data.typeID.value : this.typeID,
      room: data.room.present ? data.room.value : this.room,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Event(')
          ..write('id: $id, ')
          ..write('subjectID: $subjectID, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('isCustom: $isCustom, ')
          ..write('typeID: $typeID, ')
          ..write('room: $room')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, subjectID, startTime, endTime, isCustom, typeID, room);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.subjectID == this.subjectID &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.isCustom == this.isCustom &&
          other.typeID == this.typeID &&
          other.room == this.room);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<int> subjectID;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<bool> isCustom;
  final Value<int?> typeID;
  final Value<String?> room;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.subjectID = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.typeID = const Value.absent(),
    this.room = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required int subjectID,
    required DateTime startTime,
    required DateTime endTime,
    required bool isCustom,
    this.typeID = const Value.absent(),
    this.room = const Value.absent(),
  }) : subjectID = Value(subjectID),
       startTime = Value(startTime),
       endTime = Value(endTime),
       isCustom = Value(isCustom);
  static Insertable<Event> custom({
    Expression<int>? id,
    Expression<int>? subjectID,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<bool>? isCustom,
    Expression<int>? typeID,
    Expression<String>? room,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectID != null) 'subject_id': subjectID,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (isCustom != null) 'is_custom': isCustom,
      if (typeID != null) 'type_id': typeID,
      if (room != null) 'room': room,
    });
  }

  EventsCompanion copyWith({
    Value<int>? id,
    Value<int>? subjectID,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<bool>? isCustom,
    Value<int?>? typeID,
    Value<String?>? room,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      subjectID: subjectID ?? this.subjectID,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCustom: isCustom ?? this.isCustom,
      typeID: typeID ?? this.typeID,
      room: room ?? this.room,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (subjectID.present) {
      map['subject_id'] = Variable<int>(subjectID.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (typeID.present) {
      map['type_id'] = Variable<int>(typeID.value);
    }
    if (room.present) {
      map['room'] = Variable<String>(room.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsCompanion(')
          ..write('id: $id, ')
          ..write('subjectID: $subjectID, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('isCustom: $isCustom, ')
          ..write('typeID: $typeID, ')
          ..write('room: $room')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isDoneMeta = const VerificationMeta('isDone');
  @override
  late final GeneratedColumn<bool> isDone = GeneratedColumn<bool>(
    'is_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_done" IN (0, 1))',
    ),
    clientDefault: () => false,
  );
  static const VerificationMeta _isCustomMeta = const VerificationMeta(
    'isCustom',
  );
  @override
  late final GeneratedColumn<bool> isCustom = GeneratedColumn<bool>(
    'is_custom',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_custom" IN (0, 1))',
    ),
  );
  static const VerificationMeta _supertaskIdMeta = const VerificationMeta(
    'supertaskId',
  );
  @override
  late final GeneratedColumn<int> supertaskId = GeneratedColumn<int>(
    'supertask_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _deadlineMeta = const VerificationMeta(
    'deadline',
  );
  @override
  late final GeneratedColumn<DateTime> deadline = GeneratedColumn<DateTime>(
    'deadline',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<TaskType?, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<TaskType?>($TasksTable.$convertertypen);
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    isDone,
    isCustom,
    supertaskId,
    deadline,
    type,
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
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_done')) {
      context.handle(
        _isDoneMeta,
        isDone.isAcceptableOrUnknown(data['is_done']!, _isDoneMeta),
      );
    }
    if (data.containsKey('is_custom')) {
      context.handle(
        _isCustomMeta,
        isCustom.isAcceptableOrUnknown(data['is_custom']!, _isCustomMeta),
      );
    } else if (isInserting) {
      context.missing(_isCustomMeta);
    }
    if (data.containsKey('supertask_id')) {
      context.handle(
        _supertaskIdMeta,
        supertaskId.isAcceptableOrUnknown(
          data['supertask_id']!,
          _supertaskIdMeta,
        ),
      );
    }
    if (data.containsKey('deadline')) {
      context.handle(
        _deadlineMeta,
        deadline.isAcceptableOrUnknown(data['deadline']!, _deadlineMeta),
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
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      isDone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_done'],
          )!,
      isCustom:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}is_custom'],
          )!,
      supertaskId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}supertask_id'],
      ),
      deadline: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}deadline'],
      ),
      type: $TasksTable.$convertertypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        ),
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<TaskType, int, int> $convertertype =
      const EnumIndexConverter<TaskType>(TaskType.values);
  static JsonTypeConverter2<TaskType?, int?, int?> $convertertypen =
      JsonTypeConverter2.asNullable($convertertype);
}

class Task extends DataClass implements Insertable<Task> {
  final int id;
  final String name;
  final bool isDone;
  final bool isCustom;
  final int? supertaskId;
  final DateTime? deadline;
  final TaskType? type;
  const Task({
    required this.id,
    required this.name,
    required this.isDone,
    required this.isCustom,
    this.supertaskId,
    this.deadline,
    this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_done'] = Variable<bool>(isDone);
    map['is_custom'] = Variable<bool>(isCustom);
    if (!nullToAbsent || supertaskId != null) {
      map['supertask_id'] = Variable<int>(supertaskId);
    }
    if (!nullToAbsent || deadline != null) {
      map['deadline'] = Variable<DateTime>(deadline);
    }
    if (!nullToAbsent || type != null) {
      map['type'] = Variable<int>($TasksTable.$convertertypen.toSql(type));
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      id: Value(id),
      name: Value(name),
      isDone: Value(isDone),
      isCustom: Value(isCustom),
      supertaskId:
          supertaskId == null && nullToAbsent
              ? const Value.absent()
              : Value(supertaskId),
      deadline:
          deadline == null && nullToAbsent
              ? const Value.absent()
              : Value(deadline),
      type: type == null && nullToAbsent ? const Value.absent() : Value(type),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      supertaskId: serializer.fromJson<int?>(json['supertaskId']),
      deadline: serializer.fromJson<DateTime?>(json['deadline']),
      type: $TasksTable.$convertertypen.fromJson(
        serializer.fromJson<int?>(json['type']),
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'isDone': serializer.toJson<bool>(isDone),
      'isCustom': serializer.toJson<bool>(isCustom),
      'supertaskId': serializer.toJson<int?>(supertaskId),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'type': serializer.toJson<int?>($TasksTable.$convertertypen.toJson(type)),
    };
  }

  Task copyWith({
    int? id,
    String? name,
    bool? isDone,
    bool? isCustom,
    Value<int?> supertaskId = const Value.absent(),
    Value<DateTime?> deadline = const Value.absent(),
    Value<TaskType?> type = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    name: name ?? this.name,
    isDone: isDone ?? this.isDone,
    isCustom: isCustom ?? this.isCustom,
    supertaskId: supertaskId.present ? supertaskId.value : this.supertaskId,
    deadline: deadline.present ? deadline.value : this.deadline,
    type: type.present ? type.value : this.type,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      supertaskId:
          data.supertaskId.present ? data.supertaskId.value : this.supertaskId,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDone: $isDone, ')
          ..write('isCustom: $isCustom, ')
          ..write('supertaskId: $supertaskId, ')
          ..write('deadline: $deadline, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, isDone, isCustom, supertaskId, deadline, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.name == this.name &&
          other.isDone == this.isDone &&
          other.isCustom == this.isCustom &&
          other.supertaskId == this.supertaskId &&
          other.deadline == this.deadline &&
          other.type == this.type);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isDone;
  final Value<bool> isCustom;
  final Value<int?> supertaskId;
  final Value<DateTime?> deadline;
  final Value<TaskType?> type;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isDone = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.supertaskId = const Value.absent(),
    this.deadline = const Value.absent(),
    this.type = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.isDone = const Value.absent(),
    required bool isCustom,
    this.supertaskId = const Value.absent(),
    this.deadline = const Value.absent(),
    this.type = const Value.absent(),
  }) : name = Value(name),
       isCustom = Value(isCustom);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isDone,
    Expression<bool>? isCustom,
    Expression<int>? supertaskId,
    Expression<DateTime>? deadline,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isDone != null) 'is_done': isDone,
      if (isCustom != null) 'is_custom': isCustom,
      if (supertaskId != null) 'supertask_id': supertaskId,
      if (deadline != null) 'deadline': deadline,
      if (type != null) 'type': type,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<bool>? isDone,
    Value<bool>? isCustom,
    Value<int?>? supertaskId,
    Value<DateTime?>? deadline,
    Value<TaskType?>? type,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isDone: isDone ?? this.isDone,
      isCustom: isCustom ?? this.isCustom,
      supertaskId: supertaskId ?? this.supertaskId,
      deadline: deadline ?? this.deadline,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (supertaskId.present) {
      map['supertask_id'] = Variable<int>(supertaskId.value);
    }
    if (deadline.present) {
      map['deadline'] = Variable<DateTime>(deadline.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $TasksTable.$convertertypen.toSql(type.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isDone: $isDone, ')
          ..write('isCustom: $isCustom, ')
          ..write('supertaskId: $supertaskId, ')
          ..write('deadline: $deadline, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $GroupsTable extends Groups with TableInfo<$GroupsTable, Group> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<Group> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Group map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Group(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $GroupsTable createAlias(String alias) {
    return $GroupsTable(attachedDatabase, alias);
  }
}

class Group extends DataClass implements Insertable<Group> {
  final int id;
  final String name;
  const Group({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  GroupsCompanion toCompanion(bool nullToAbsent) {
    return GroupsCompanion(id: Value(id), name: Value(name));
  }

  factory Group.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Group(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Group copyWith({int? id, String? name}) =>
      Group(id: id ?? this.id, name: name ?? this.name);
  Group copyWithCompanion(GroupsCompanion data) {
    return Group(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Group(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Group && other.id == this.id && other.name == this.name);
}

class GroupsCompanion extends UpdateCompanion<Group> {
  final Value<int> id;
  final Value<String> name;
  const GroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  GroupsCompanion.insert({this.id = const Value.absent(), required String name})
    : name = Value(name);
  static Insertable<Group> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  GroupsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return GroupsCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TeachersTable extends Teachers with TableInfo<$TeachersTable, Teacher> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TeachersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _shortNameMeta = const VerificationMeta(
    'shortName',
  );
  @override
  late final GeneratedColumn<String> shortName = GeneratedColumn<String>(
    'short_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, shortName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'teachers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Teacher> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('short_name')) {
      context.handle(
        _shortNameMeta,
        shortName.isAcceptableOrUnknown(data['short_name']!, _shortNameMeta),
      );
    } else if (isInserting) {
      context.missing(_shortNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Teacher map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Teacher(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      shortName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}short_name'],
          )!,
    );
  }

  @override
  $TeachersTable createAlias(String alias) {
    return $TeachersTable(attachedDatabase, alias);
  }
}

class Teacher extends DataClass implements Insertable<Teacher> {
  final int id;
  final String name;
  final String shortName;
  const Teacher({
    required this.id,
    required this.name,
    required this.shortName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['short_name'] = Variable<String>(shortName);
    return map;
  }

  TeachersCompanion toCompanion(bool nullToAbsent) {
    return TeachersCompanion(
      id: Value(id),
      name: Value(name),
      shortName: Value(shortName),
    );
  }

  factory Teacher.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Teacher(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      shortName: serializer.fromJson<String>(json['shortName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'shortName': serializer.toJson<String>(shortName),
    };
  }

  Teacher copyWith({int? id, String? name, String? shortName}) => Teacher(
    id: id ?? this.id,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
  );
  Teacher copyWithCompanion(TeachersCompanion data) {
    return Teacher(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Teacher(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, shortName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Teacher &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortName == this.shortName);
}

class TeachersCompanion extends UpdateCompanion<Teacher> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> shortName;
  const TeachersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
  });
  TeachersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String shortName,
  }) : name = Value(name),
       shortName = Value(shortName);
  static Insertable<Teacher> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? shortName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (shortName != null) 'short_name': shortName,
    });
  }

  TeachersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? shortName,
  }) {
    return TeachersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (shortName.present) {
      map['short_name'] = Variable<String>(shortName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TeachersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }
}

abstract class _$LocalDBApi extends GeneratedDatabase {
  _$LocalDBApi(QueryExecutor e) : super(e);
  $LocalDBApiManager get managers => $LocalDBApiManager(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $EventTypesTable eventTypes = $EventTypesTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $TeachersTable teachers = $TeachersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    subjects,
    eventTypes,
    events,
    tasks,
    groups,
    teachers,
  ];
}

typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      required String name,
      required String shortName,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> shortName,
    });

final class $$SubjectsTableReferences
    extends BaseReferences<_$LocalDBApi, $SubjectsTable, Subject> {
  $$SubjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$LocalDBApi db,
  ) => MultiTypedResultKey.fromTable(
    db.events,
    aliasName: $_aliasNameGenerator(db.subjects.id, db.events.subjectID),
  );

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.subjectID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SubjectsTableFilterComposer
    extends Composer<_$LocalDBApi, $SubjectsTable> {
  $$SubjectsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventsRefs(
    Expression<bool> Function($$EventsTableFilterComposer f) f,
  ) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.subjectID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableOrderingComposer
    extends Composer<_$LocalDBApi, $SubjectsTable> {
  $$SubjectsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$LocalDBApi, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortName =>
      $composableBuilder(column: $table.shortName, builder: (column) => column);

  Expression<T> eventsRefs<T extends Object>(
    Expression<T> Function($$EventsTableAnnotationComposer a) f,
  ) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.subjectID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SubjectsTableTableManager
    extends
        RootTableManager<
          _$LocalDBApi,
          $SubjectsTable,
          Subject,
          $$SubjectsTableFilterComposer,
          $$SubjectsTableOrderingComposer,
          $$SubjectsTableAnnotationComposer,
          $$SubjectsTableCreateCompanionBuilder,
          $$SubjectsTableUpdateCompanionBuilder,
          (Subject, $$SubjectsTableReferences),
          Subject,
          PrefetchHooks Function({bool eventsRefs})
        > {
  $$SubjectsTableTableManager(_$LocalDBApi db, $SubjectsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SubjectsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SubjectsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SubjectsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> shortName = const Value.absent(),
              }) => SubjectsCompanion(id: id, name: name, shortName: shortName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String shortName,
              }) => SubjectsCompanion.insert(
                id: id,
                name: name,
                shortName: shortName,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SubjectsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventsRefs) db.events],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventsRefs)
                    await $_getPrefetchedData<Subject, $SubjectsTable, Event>(
                      currentTable: table,
                      referencedTable: $$SubjectsTableReferences
                          ._eventsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SubjectsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.subjectID == item.id,
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

typedef $$SubjectsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDBApi,
      $SubjectsTable,
      Subject,
      $$SubjectsTableFilterComposer,
      $$SubjectsTableOrderingComposer,
      $$SubjectsTableAnnotationComposer,
      $$SubjectsTableCreateCompanionBuilder,
      $$SubjectsTableUpdateCompanionBuilder,
      (Subject, $$SubjectsTableReferences),
      Subject,
      PrefetchHooks Function({bool eventsRefs})
    >;
typedef $$EventTypesTableCreateCompanionBuilder =
    EventTypesCompanion Function({
      Value<int> id,
      required String name,
      required String shortName,
      required EventBaseType baseType,
    });
typedef $$EventTypesTableUpdateCompanionBuilder =
    EventTypesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> shortName,
      Value<EventBaseType> baseType,
    });

final class $$EventTypesTableReferences
    extends BaseReferences<_$LocalDBApi, $EventTypesTable, EventType> {
  $$EventTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$LocalDBApi db,
  ) => MultiTypedResultKey.fromTable(
    db.events,
    aliasName: $_aliasNameGenerator(db.eventTypes.id, db.events.typeID),
  );

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.typeID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventTypesTableFilterComposer
    extends Composer<_$LocalDBApi, $EventTypesTable> {
  $$EventTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<EventBaseType, EventBaseType, int>
  get baseType => $composableBuilder(
    column: $table.baseType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> eventsRefs(
    Expression<bool> Function($$EventsTableFilterComposer f) f,
  ) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.typeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableFilterComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventTypesTableOrderingComposer
    extends Composer<_$LocalDBApi, $EventTypesTable> {
  $$EventTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get baseType => $composableBuilder(
    column: $table.baseType,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EventTypesTableAnnotationComposer
    extends Composer<_$LocalDBApi, $EventTypesTable> {
  $$EventTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortName =>
      $composableBuilder(column: $table.shortName, builder: (column) => column);

  GeneratedColumnWithTypeConverter<EventBaseType, int> get baseType =>
      $composableBuilder(column: $table.baseType, builder: (column) => column);

  Expression<T> eventsRefs<T extends Object>(
    Expression<T> Function($$EventsTableAnnotationComposer a) f,
  ) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.typeID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableAnnotationComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventTypesTableTableManager
    extends
        RootTableManager<
          _$LocalDBApi,
          $EventTypesTable,
          EventType,
          $$EventTypesTableFilterComposer,
          $$EventTypesTableOrderingComposer,
          $$EventTypesTableAnnotationComposer,
          $$EventTypesTableCreateCompanionBuilder,
          $$EventTypesTableUpdateCompanionBuilder,
          (EventType, $$EventTypesTableReferences),
          EventType,
          PrefetchHooks Function({bool eventsRefs})
        > {
  $$EventTypesTableTableManager(_$LocalDBApi db, $EventTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EventTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EventTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$EventTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> shortName = const Value.absent(),
                Value<EventBaseType> baseType = const Value.absent(),
              }) => EventTypesCompanion(
                id: id,
                name: name,
                shortName: shortName,
                baseType: baseType,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String shortName,
                required EventBaseType baseType,
              }) => EventTypesCompanion.insert(
                id: id,
                name: name,
                shortName: shortName,
                baseType: baseType,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EventTypesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventsRefs) db.events],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventsRefs)
                    await $_getPrefetchedData<
                      EventType,
                      $EventTypesTable,
                      Event
                    >(
                      currentTable: table,
                      referencedTable: $$EventTypesTableReferences
                          ._eventsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.typeID == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EventTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDBApi,
      $EventTypesTable,
      EventType,
      $$EventTypesTableFilterComposer,
      $$EventTypesTableOrderingComposer,
      $$EventTypesTableAnnotationComposer,
      $$EventTypesTableCreateCompanionBuilder,
      $$EventTypesTableUpdateCompanionBuilder,
      (EventType, $$EventTypesTableReferences),
      EventType,
      PrefetchHooks Function({bool eventsRefs})
    >;
typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      Value<int> id,
      required int subjectID,
      required DateTime startTime,
      required DateTime endTime,
      required bool isCustom,
      Value<int?> typeID,
      Value<String?> room,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      Value<int> id,
      Value<int> subjectID,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<bool> isCustom,
      Value<int?> typeID,
      Value<String?> room,
    });

final class $$EventsTableReferences
    extends BaseReferences<_$LocalDBApi, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectsTable _subjectIDTable(_$LocalDBApi db) => db.subjects
      .createAlias($_aliasNameGenerator(db.events.subjectID, db.subjects.id));

  $$SubjectsTableProcessedTableManager get subjectID {
    final $_column = $_itemColumn<int>('subject_id')!;

    final manager = $$SubjectsTableTableManager(
      $_db,
      $_db.subjects,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_subjectIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EventTypesTable _typeIDTable(_$LocalDBApi db) => db.eventTypes
      .createAlias($_aliasNameGenerator(db.events.typeID, db.eventTypes.id));

  $$EventTypesTableProcessedTableManager? get typeID {
    final $_column = $_itemColumn<int>('type_id');
    if ($_column == null) return null;
    final manager = $$EventTypesTableTableManager(
      $_db,
      $_db.eventTypes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_typeIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventsTableFilterComposer extends Composer<_$LocalDBApi, $EventsTable> {
  $$EventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get room => $composableBuilder(
    column: $table.room,
    builder: (column) => ColumnFilters(column),
  );

  $$SubjectsTableFilterComposer get subjectID {
    final $$SubjectsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectID,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableFilterComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableFilterComposer get typeID {
    final $$EventTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.typeID,
      referencedTable: $db.eventTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableFilterComposer(
            $db: $db,
            $table: $db.eventTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTableOrderingComposer
    extends Composer<_$LocalDBApi, $EventsTable> {
  $$EventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get room => $composableBuilder(
    column: $table.room,
    builder: (column) => ColumnOrderings(column),
  );

  $$SubjectsTableOrderingComposer get subjectID {
    final $$SubjectsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectID,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableOrderingComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableOrderingComposer get typeID {
    final $$EventTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.typeID,
      referencedTable: $db.eventTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableOrderingComposer(
            $db: $db,
            $table: $db.eventTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTableAnnotationComposer
    extends Composer<_$LocalDBApi, $EventsTable> {
  $$EventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<String> get room =>
      $composableBuilder(column: $table.room, builder: (column) => column);

  $$SubjectsTableAnnotationComposer get subjectID {
    final $$SubjectsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.subjectID,
      referencedTable: $db.subjects,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubjectsTableAnnotationComposer(
            $db: $db,
            $table: $db.subjects,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EventTypesTableAnnotationComposer get typeID {
    final $$EventTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.typeID,
      referencedTable: $db.eventTypes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.eventTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$LocalDBApi,
          $EventsTable,
          Event,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (Event, $$EventsTableReferences),
          Event,
          PrefetchHooks Function({bool subjectID, bool typeID})
        > {
  $$EventsTableTableManager(_$LocalDBApi db, $EventsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$EventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> subjectID = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int?> typeID = const Value.absent(),
                Value<String?> room = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                subjectID: subjectID,
                startTime: startTime,
                endTime: endTime,
                isCustom: isCustom,
                typeID: typeID,
                room: room,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int subjectID,
                required DateTime startTime,
                required DateTime endTime,
                required bool isCustom,
                Value<int?> typeID = const Value.absent(),
                Value<String?> room = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                subjectID: subjectID,
                startTime: startTime,
                endTime: endTime,
                isCustom: isCustom,
                typeID: typeID,
                room: room,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EventsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({subjectID = false, typeID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
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
                if (subjectID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.subjectID,
                            referencedTable: $$EventsTableReferences
                                ._subjectIDTable(db),
                            referencedColumn:
                                $$EventsTableReferences._subjectIDTable(db).id,
                          )
                          as T;
                }
                if (typeID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.typeID,
                            referencedTable: $$EventsTableReferences
                                ._typeIDTable(db),
                            referencedColumn:
                                $$EventsTableReferences._typeIDTable(db).id,
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

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDBApi,
      $EventsTable,
      Event,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (Event, $$EventsTableReferences),
      Event,
      PrefetchHooks Function({bool subjectID, bool typeID})
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String name,
      Value<bool> isDone,
      required bool isCustom,
      Value<int?> supertaskId,
      Value<DateTime?> deadline,
      Value<TaskType?> type,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<bool> isDone,
      Value<bool> isCustom,
      Value<int?> supertaskId,
      Value<DateTime?> deadline,
      Value<TaskType?> type,
    });

class $$TasksTableFilterComposer extends Composer<_$LocalDBApi, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get supertaskId => $composableBuilder(
    column: $table.supertaskId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<TaskType?, TaskType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );
}

class $$TasksTableOrderingComposer extends Composer<_$LocalDBApi, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDone => $composableBuilder(
    column: $table.isDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCustom => $composableBuilder(
    column: $table.isCustom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get supertaskId => $composableBuilder(
    column: $table.supertaskId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get deadline => $composableBuilder(
    column: $table.deadline,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TasksTableAnnotationComposer
    extends Composer<_$LocalDBApi, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<int> get supertaskId => $composableBuilder(
    column: $table.supertaskId,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get deadline =>
      $composableBuilder(column: $table.deadline, builder: (column) => column);

  GeneratedColumnWithTypeConverter<TaskType?, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$LocalDBApi,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, BaseReferences<_$LocalDBApi, $TasksTable, Task>),
          Task,
          PrefetchHooks Function()
        > {
  $$TasksTableTableManager(_$LocalDBApi db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int?> supertaskId = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<TaskType?> type = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                name: name,
                isDone: isDone,
                isCustom: isCustom,
                supertaskId: supertaskId,
                deadline: deadline,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<bool> isDone = const Value.absent(),
                required bool isCustom,
                Value<int?> supertaskId = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<TaskType?> type = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                name: name,
                isDone: isDone,
                isCustom: isCustom,
                supertaskId: supertaskId,
                deadline: deadline,
                type: type,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDBApi,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, BaseReferences<_$LocalDBApi, $TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;
typedef $$GroupsTableCreateCompanionBuilder =
    GroupsCompanion Function({Value<int> id, required String name});
typedef $$GroupsTableUpdateCompanionBuilder =
    GroupsCompanion Function({Value<int> id, Value<String> name});

class $$GroupsTableFilterComposer extends Composer<_$LocalDBApi, $GroupsTable> {
  $$GroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$GroupsTableOrderingComposer
    extends Composer<_$LocalDBApi, $GroupsTable> {
  $$GroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GroupsTableAnnotationComposer
    extends Composer<_$LocalDBApi, $GroupsTable> {
  $$GroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$GroupsTableTableManager
    extends
        RootTableManager<
          _$LocalDBApi,
          $GroupsTable,
          Group,
          $$GroupsTableFilterComposer,
          $$GroupsTableOrderingComposer,
          $$GroupsTableAnnotationComposer,
          $$GroupsTableCreateCompanionBuilder,
          $$GroupsTableUpdateCompanionBuilder,
          (Group, BaseReferences<_$LocalDBApi, $GroupsTable, Group>),
          Group,
          PrefetchHooks Function()
        > {
  $$GroupsTableTableManager(_$LocalDBApi db, $GroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$GroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$GroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$GroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => GroupsCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  GroupsCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$GroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDBApi,
      $GroupsTable,
      Group,
      $$GroupsTableFilterComposer,
      $$GroupsTableOrderingComposer,
      $$GroupsTableAnnotationComposer,
      $$GroupsTableCreateCompanionBuilder,
      $$GroupsTableUpdateCompanionBuilder,
      (Group, BaseReferences<_$LocalDBApi, $GroupsTable, Group>),
      Group,
      PrefetchHooks Function()
    >;
typedef $$TeachersTableCreateCompanionBuilder =
    TeachersCompanion Function({
      Value<int> id,
      required String name,
      required String shortName,
    });
typedef $$TeachersTableUpdateCompanionBuilder =
    TeachersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> shortName,
    });

class $$TeachersTableFilterComposer
    extends Composer<_$LocalDBApi, $TeachersTable> {
  $$TeachersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TeachersTableOrderingComposer
    extends Composer<_$LocalDBApi, $TeachersTable> {
  $$TeachersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TeachersTableAnnotationComposer
    extends Composer<_$LocalDBApi, $TeachersTable> {
  $$TeachersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get shortName =>
      $composableBuilder(column: $table.shortName, builder: (column) => column);
}

class $$TeachersTableTableManager
    extends
        RootTableManager<
          _$LocalDBApi,
          $TeachersTable,
          Teacher,
          $$TeachersTableFilterComposer,
          $$TeachersTableOrderingComposer,
          $$TeachersTableAnnotationComposer,
          $$TeachersTableCreateCompanionBuilder,
          $$TeachersTableUpdateCompanionBuilder,
          (Teacher, BaseReferences<_$LocalDBApi, $TeachersTable, Teacher>),
          Teacher,
          PrefetchHooks Function()
        > {
  $$TeachersTableTableManager(_$LocalDBApi db, $TeachersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TeachersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TeachersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TeachersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> shortName = const Value.absent(),
              }) => TeachersCompanion(id: id, name: name, shortName: shortName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String shortName,
              }) => TeachersCompanion.insert(
                id: id,
                name: name,
                shortName: shortName,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TeachersTableProcessedTableManager =
    ProcessedTableManager<
      _$LocalDBApi,
      $TeachersTable,
      Teacher,
      $$TeachersTableFilterComposer,
      $$TeachersTableOrderingComposer,
      $$TeachersTableAnnotationComposer,
      $$TeachersTableCreateCompanionBuilder,
      $$TeachersTableUpdateCompanionBuilder,
      (Teacher, BaseReferences<_$LocalDBApi, $TeachersTable, Teacher>),
      Teacher,
      PrefetchHooks Function()
    >;

class $LocalDBApiManager {
  final _$LocalDBApi _db;
  $LocalDBApiManager(this._db);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$EventTypesTableTableManager get eventTypes =>
      $$EventTypesTableTableManager(_db, _db.eventTypes);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
  $$TeachersTableTableManager get teachers =>
      $$TeachersTableTableManager(_db, _db.teachers);
}
