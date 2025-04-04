// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
  List<GeneratedColumn> get $columns => [id, title, shortName];
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
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
  final String title;
  final String shortName;
  const Subject({
    required this.id,
    required this.title,
    required this.shortName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['short_name'] = Variable<String>(shortName);
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: Value(id),
      title: Value(title),
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
      title: serializer.fromJson<String>(json['title']),
      shortName: serializer.fromJson<String>(json['shortName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'shortName': serializer.toJson<String>(shortName),
    };
  }

  Subject copyWith({int? id, String? title, String? shortName}) => Subject(
    id: id ?? this.id,
    title: title ?? this.title,
    shortName: shortName ?? this.shortName,
  );
  Subject copyWithCompanion(SubjectsCompanion data) {
    return Subject(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Subject(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, shortName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Subject &&
          other.id == this.id &&
          other.title == this.title &&
          other.shortName == this.shortName);
}

class SubjectsCompanion extends UpdateCompanion<Subject> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> shortName;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.shortName = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String shortName,
  }) : title = Value(title),
       shortName = Value(shortName);
  static Insertable<Subject> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? shortName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (shortName != null) 'short_name': shortName,
    });
  }

  SubjectsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? shortName,
  }) {
    return SubjectsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      shortName: shortName ?? this.shortName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
          ..write('title: $title, ')
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
  List<GeneratedColumn> get $columns => [id, name, shortName];
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
    );
  }

  @override
  $EventTypesTable createAlias(String alias) {
    return $EventTypesTable(attachedDatabase, alias);
  }
}

class EventType extends DataClass implements Insertable<EventType> {
  final int id;
  final String name;
  final String shortName;
  const EventType({
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

  EventTypesCompanion toCompanion(bool nullToAbsent) {
    return EventTypesCompanion(
      id: Value(id),
      name: Value(name),
      shortName: Value(shortName),
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

  EventType copyWith({int? id, String? name, String? shortName}) => EventType(
    id: id ?? this.id,
    name: name ?? this.name,
    shortName: shortName ?? this.shortName,
  );
  EventType copyWithCompanion(EventTypesCompanion data) {
    return EventType(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      shortName: data.shortName.present ? data.shortName.value : this.shortName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventType(')
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
      (other is EventType &&
          other.id == this.id &&
          other.name == this.name &&
          other.shortName == this.shortName);
}

class EventTypesCompanion extends UpdateCompanion<EventType> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> shortName;
  const EventTypesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.shortName = const Value.absent(),
  });
  EventTypesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String shortName,
  }) : name = Value(name),
       shortName = Value(shortName);
  static Insertable<EventType> custom({
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

  EventTypesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? shortName,
  }) {
    return EventTypesCompanion(
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
    return (StringBuffer('EventTypesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('shortName: $shortName')
          ..write(')'))
        .toString();
  }
}

class $RoomsTable extends Rooms with TableInfo<$RoomsTable, Room> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RoomsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _buildingMeta = const VerificationMeta(
    'building',
  );
  @override
  late final GeneratedColumn<String> building = GeneratedColumn<String>(
    'building',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, building];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rooms';
  @override
  VerificationContext validateIntegrity(
    Insertable<Room> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('building')) {
      context.handle(
        _buildingMeta,
        building.isAcceptableOrUnknown(data['building']!, _buildingMeta),
      );
    } else if (isInserting) {
      context.missing(_buildingMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Room map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Room(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      building:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}building'],
          )!,
    );
  }

  @override
  $RoomsTable createAlias(String alias) {
    return $RoomsTable(attachedDatabase, alias);
  }
}

class Room extends DataClass implements Insertable<Room> {
  final int id;
  final String title;
  final String building;
  const Room({required this.id, required this.title, required this.building});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['building'] = Variable<String>(building);
    return map;
  }

  RoomsCompanion toCompanion(bool nullToAbsent) {
    return RoomsCompanion(
      id: Value(id),
      title: Value(title),
      building: Value(building),
    );
  }

  factory Room.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Room(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      building: serializer.fromJson<String>(json['building']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'building': serializer.toJson<String>(building),
    };
  }

  Room copyWith({int? id, String? title, String? building}) => Room(
    id: id ?? this.id,
    title: title ?? this.title,
    building: building ?? this.building,
  );
  Room copyWithCompanion(RoomsCompanion data) {
    return Room(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      building: data.building.present ? data.building.value : this.building,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Room(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('building: $building')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, building);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Room &&
          other.id == this.id &&
          other.title == this.title &&
          other.building == this.building);
}

class RoomsCompanion extends UpdateCompanion<Room> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> building;
  const RoomsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.building = const Value.absent(),
  });
  RoomsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String building,
  }) : title = Value(title),
       building = Value(building);
  static Insertable<Room> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? building,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (building != null) 'building': building,
    });
  }

  RoomsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? building,
  }) {
    return RoomsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      building: building ?? this.building,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (building.present) {
      map['building'] = Variable<String>(building.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoomsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('building: $building')
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
  @override
  late final GeneratedColumnWithTypeConverter<EventBaseType?, int> baseType =
      GeneratedColumn<int>(
        'base_type',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<EventBaseType?>($EventsTable.$converterbaseTypen);
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
  static const VerificationMeta _roomIDMeta = const VerificationMeta('roomID');
  @override
  late final GeneratedColumn<int> roomID = GeneratedColumn<int>(
    'room_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES rooms (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    subjectID,
    startTime,
    endTime,
    isCustom,
    baseType,
    typeID,
    roomID,
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
    if (data.containsKey('room_id')) {
      context.handle(
        _roomIDMeta,
        roomID.isAcceptableOrUnknown(data['room_id']!, _roomIDMeta),
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
      baseType: $EventsTable.$converterbaseTypen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}base_type'],
        ),
      ),
      typeID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}type_id'],
      ),
      roomID: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}room_id'],
      ),
    );
  }

  @override
  $EventsTable createAlias(String alias) {
    return $EventsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<EventBaseType, int, int> $converterbaseType =
      const EnumIndexConverter<EventBaseType>(EventBaseType.values);
  static JsonTypeConverter2<EventBaseType?, int?, int?> $converterbaseTypen =
      JsonTypeConverter2.asNullable($converterbaseType);
}

class Event extends DataClass implements Insertable<Event> {
  final int id;
  final int subjectID;
  final DateTime startTime;
  final DateTime endTime;
  final bool isCustom;
  final EventBaseType? baseType;
  final int? typeID;
  final int? roomID;
  const Event({
    required this.id,
    required this.subjectID,
    required this.startTime,
    required this.endTime,
    required this.isCustom,
    this.baseType,
    this.typeID,
    this.roomID,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['subject_id'] = Variable<int>(subjectID);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    map['is_custom'] = Variable<bool>(isCustom);
    if (!nullToAbsent || baseType != null) {
      map['base_type'] = Variable<int>(
        $EventsTable.$converterbaseTypen.toSql(baseType),
      );
    }
    if (!nullToAbsent || typeID != null) {
      map['type_id'] = Variable<int>(typeID);
    }
    if (!nullToAbsent || roomID != null) {
      map['room_id'] = Variable<int>(roomID);
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
      baseType:
          baseType == null && nullToAbsent
              ? const Value.absent()
              : Value(baseType),
      typeID:
          typeID == null && nullToAbsent ? const Value.absent() : Value(typeID),
      roomID:
          roomID == null && nullToAbsent ? const Value.absent() : Value(roomID),
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
      baseType: $EventsTable.$converterbaseTypen.fromJson(
        serializer.fromJson<int?>(json['baseType']),
      ),
      typeID: serializer.fromJson<int?>(json['typeID']),
      roomID: serializer.fromJson<int?>(json['roomID']),
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
      'baseType': serializer.toJson<int?>(
        $EventsTable.$converterbaseTypen.toJson(baseType),
      ),
      'typeID': serializer.toJson<int?>(typeID),
      'roomID': serializer.toJson<int?>(roomID),
    };
  }

  Event copyWith({
    int? id,
    int? subjectID,
    DateTime? startTime,
    DateTime? endTime,
    bool? isCustom,
    Value<EventBaseType?> baseType = const Value.absent(),
    Value<int?> typeID = const Value.absent(),
    Value<int?> roomID = const Value.absent(),
  }) => Event(
    id: id ?? this.id,
    subjectID: subjectID ?? this.subjectID,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isCustom: isCustom ?? this.isCustom,
    baseType: baseType.present ? baseType.value : this.baseType,
    typeID: typeID.present ? typeID.value : this.typeID,
    roomID: roomID.present ? roomID.value : this.roomID,
  );
  Event copyWithCompanion(EventsCompanion data) {
    return Event(
      id: data.id.present ? data.id.value : this.id,
      subjectID: data.subjectID.present ? data.subjectID.value : this.subjectID,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      baseType: data.baseType.present ? data.baseType.value : this.baseType,
      typeID: data.typeID.present ? data.typeID.value : this.typeID,
      roomID: data.roomID.present ? data.roomID.value : this.roomID,
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
          ..write('baseType: $baseType, ')
          ..write('typeID: $typeID, ')
          ..write('roomID: $roomID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    subjectID,
    startTime,
    endTime,
    isCustom,
    baseType,
    typeID,
    roomID,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Event &&
          other.id == this.id &&
          other.subjectID == this.subjectID &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.isCustom == this.isCustom &&
          other.baseType == this.baseType &&
          other.typeID == this.typeID &&
          other.roomID == this.roomID);
}

class EventsCompanion extends UpdateCompanion<Event> {
  final Value<int> id;
  final Value<int> subjectID;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<bool> isCustom;
  final Value<EventBaseType?> baseType;
  final Value<int?> typeID;
  final Value<int?> roomID;
  const EventsCompanion({
    this.id = const Value.absent(),
    this.subjectID = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.baseType = const Value.absent(),
    this.typeID = const Value.absent(),
    this.roomID = const Value.absent(),
  });
  EventsCompanion.insert({
    this.id = const Value.absent(),
    required int subjectID,
    required DateTime startTime,
    required DateTime endTime,
    required bool isCustom,
    this.baseType = const Value.absent(),
    this.typeID = const Value.absent(),
    this.roomID = const Value.absent(),
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
    Expression<int>? baseType,
    Expression<int>? typeID,
    Expression<int>? roomID,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (subjectID != null) 'subject_id': subjectID,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (isCustom != null) 'is_custom': isCustom,
      if (baseType != null) 'base_type': baseType,
      if (typeID != null) 'type_id': typeID,
      if (roomID != null) 'room_id': roomID,
    });
  }

  EventsCompanion copyWith({
    Value<int>? id,
    Value<int>? subjectID,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<bool>? isCustom,
    Value<EventBaseType?>? baseType,
    Value<int?>? typeID,
    Value<int?>? roomID,
  }) {
    return EventsCompanion(
      id: id ?? this.id,
      subjectID: subjectID ?? this.subjectID,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      isCustom: isCustom ?? this.isCustom,
      baseType: baseType ?? this.baseType,
      typeID: typeID ?? this.typeID,
      roomID: roomID ?? this.roomID,
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
    if (baseType.present) {
      map['base_type'] = Variable<int>(
        $EventsTable.$converterbaseTypen.toSql(baseType.value),
      );
    }
    if (typeID.present) {
      map['type_id'] = Variable<int>(typeID.value);
    }
    if (roomID.present) {
      map['room_id'] = Variable<int>(roomID.value);
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
          ..write('baseType: $baseType, ')
          ..write('typeID: $typeID, ')
          ..write('roomID: $roomID')
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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
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
  static const VerificationMeta _supertaskIDMeta = const VerificationMeta(
    'supertaskID',
  );
  @override
  late final GeneratedColumn<int> supertaskID = GeneratedColumn<int>(
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
    title,
    isDone,
    isCustom,
    supertaskID,
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
        _supertaskIDMeta,
        supertaskID.isAcceptableOrUnknown(
          data['supertask_id']!,
          _supertaskIDMeta,
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
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
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
      supertaskID: attachedDatabase.typeMapping.read(
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
  final String title;
  final bool isDone;
  final bool isCustom;
  final int? supertaskID;
  final DateTime? deadline;
  final TaskType? type;
  const Task({
    required this.id,
    required this.title,
    required this.isDone,
    required this.isCustom,
    this.supertaskID,
    this.deadline,
    this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['is_done'] = Variable<bool>(isDone);
    map['is_custom'] = Variable<bool>(isCustom);
    if (!nullToAbsent || supertaskID != null) {
      map['supertask_id'] = Variable<int>(supertaskID);
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
      title: Value(title),
      isDone: Value(isDone),
      isCustom: Value(isCustom),
      supertaskID:
          supertaskID == null && nullToAbsent
              ? const Value.absent()
              : Value(supertaskID),
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
      title: serializer.fromJson<String>(json['title']),
      isDone: serializer.fromJson<bool>(json['isDone']),
      isCustom: serializer.fromJson<bool>(json['isCustom']),
      supertaskID: serializer.fromJson<int?>(json['supertaskID']),
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
      'title': serializer.toJson<String>(title),
      'isDone': serializer.toJson<bool>(isDone),
      'isCustom': serializer.toJson<bool>(isCustom),
      'supertaskID': serializer.toJson<int?>(supertaskID),
      'deadline': serializer.toJson<DateTime?>(deadline),
      'type': serializer.toJson<int?>($TasksTable.$convertertypen.toJson(type)),
    };
  }

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isCustom,
    Value<int?> supertaskID = const Value.absent(),
    Value<DateTime?> deadline = const Value.absent(),
    Value<TaskType?> type = const Value.absent(),
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    isCustom: isCustom ?? this.isCustom,
    supertaskID: supertaskID.present ? supertaskID.value : this.supertaskID,
    deadline: deadline.present ? deadline.value : this.deadline,
    type: type.present ? type.value : this.type,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      isDone: data.isDone.present ? data.isDone.value : this.isDone,
      isCustom: data.isCustom.present ? data.isCustom.value : this.isCustom,
      supertaskID:
          data.supertaskID.present ? data.supertaskID.value : this.supertaskID,
      deadline: data.deadline.present ? data.deadline.value : this.deadline,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('isCustom: $isCustom, ')
          ..write('supertaskID: $supertaskID, ')
          ..write('deadline: $deadline, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, isDone, isCustom, supertaskID, deadline, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.id == this.id &&
          other.title == this.title &&
          other.isDone == this.isDone &&
          other.isCustom == this.isCustom &&
          other.supertaskID == this.supertaskID &&
          other.deadline == this.deadline &&
          other.type == this.type);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<int> id;
  final Value<String> title;
  final Value<bool> isDone;
  final Value<bool> isCustom;
  final Value<int?> supertaskID;
  final Value<DateTime?> deadline;
  final Value<TaskType?> type;
  const TasksCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.isDone = const Value.absent(),
    this.isCustom = const Value.absent(),
    this.supertaskID = const Value.absent(),
    this.deadline = const Value.absent(),
    this.type = const Value.absent(),
  });
  TasksCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.isDone = const Value.absent(),
    required bool isCustom,
    this.supertaskID = const Value.absent(),
    this.deadline = const Value.absent(),
    this.type = const Value.absent(),
  }) : title = Value(title),
       isCustom = Value(isCustom);
  static Insertable<Task> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<bool>? isDone,
    Expression<bool>? isCustom,
    Expression<int>? supertaskID,
    Expression<DateTime>? deadline,
    Expression<int>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (isDone != null) 'is_done': isDone,
      if (isCustom != null) 'is_custom': isCustom,
      if (supertaskID != null) 'supertask_id': supertaskID,
      if (deadline != null) 'deadline': deadline,
      if (type != null) 'type': type,
    });
  }

  TasksCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<bool>? isDone,
    Value<bool>? isCustom,
    Value<int?>? supertaskID,
    Value<DateTime?>? deadline,
    Value<TaskType?>? type,
  }) {
    return TasksCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isCustom: isCustom ?? this.isCustom,
      supertaskID: supertaskID ?? this.supertaskID,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (isDone.present) {
      map['is_done'] = Variable<bool>(isDone.value);
    }
    if (isCustom.present) {
      map['is_custom'] = Variable<bool>(isCustom.value);
    }
    if (supertaskID.present) {
      map['supertask_id'] = Variable<int>(supertaskID.value);
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
          ..write('title: $title, ')
          ..write('isDone: $isDone, ')
          ..write('isCustom: $isCustom, ')
          ..write('supertaskID: $supertaskID, ')
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

class $EventsGroupsTable extends EventsGroups
    with TableInfo<$EventsGroupsTable, EventsGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIDMeta = const VerificationMeta(
    'eventID',
  );
  @override
  late final GeneratedColumn<int> eventID = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _groupIDMeta = const VerificationMeta(
    'groupID',
  );
  @override
  late final GeneratedColumn<int> groupID = GeneratedColumn<int>(
    'group_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES "groups" (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventID, groupID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventsGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIDMeta,
        eventID.isAcceptableOrUnknown(data['event_id']!, _eventIDMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIDMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(
        _groupIDMeta,
        groupID.isAcceptableOrUnknown(data['group_id']!, _groupIDMeta),
      );
    } else if (isInserting) {
      context.missing(_groupIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EventsGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventsGroup(
      eventID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}event_id'],
          )!,
      groupID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}group_id'],
          )!,
    );
  }

  @override
  $EventsGroupsTable createAlias(String alias) {
    return $EventsGroupsTable(attachedDatabase, alias);
  }
}

class EventsGroup extends DataClass implements Insertable<EventsGroup> {
  final int eventID;
  final int groupID;
  const EventsGroup({required this.eventID, required this.groupID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<int>(eventID);
    map['group_id'] = Variable<int>(groupID);
    return map;
  }

  EventsGroupsCompanion toCompanion(bool nullToAbsent) {
    return EventsGroupsCompanion(
      eventID: Value(eventID),
      groupID: Value(groupID),
    );
  }

  factory EventsGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventsGroup(
      eventID: serializer.fromJson<int>(json['eventID']),
      groupID: serializer.fromJson<int>(json['groupID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventID': serializer.toJson<int>(eventID),
      'groupID': serializer.toJson<int>(groupID),
    };
  }

  EventsGroup copyWith({int? eventID, int? groupID}) => EventsGroup(
    eventID: eventID ?? this.eventID,
    groupID: groupID ?? this.groupID,
  );
  EventsGroup copyWithCompanion(EventsGroupsCompanion data) {
    return EventsGroup(
      eventID: data.eventID.present ? data.eventID.value : this.eventID,
      groupID: data.groupID.present ? data.groupID.value : this.groupID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventsGroup(')
          ..write('eventID: $eventID, ')
          ..write('groupID: $groupID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(eventID, groupID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventsGroup &&
          other.eventID == this.eventID &&
          other.groupID == this.groupID);
}

class EventsGroupsCompanion extends UpdateCompanion<EventsGroup> {
  final Value<int> eventID;
  final Value<int> groupID;
  final Value<int> rowid;
  const EventsGroupsCompanion({
    this.eventID = const Value.absent(),
    this.groupID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsGroupsCompanion.insert({
    required int eventID,
    required int groupID,
    this.rowid = const Value.absent(),
  }) : eventID = Value(eventID),
       groupID = Value(groupID);
  static Insertable<EventsGroup> custom({
    Expression<int>? eventID,
    Expression<int>? groupID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventID != null) 'event_id': eventID,
      if (groupID != null) 'group_id': groupID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsGroupsCompanion copyWith({
    Value<int>? eventID,
    Value<int>? groupID,
    Value<int>? rowid,
  }) {
    return EventsGroupsCompanion(
      eventID: eventID ?? this.eventID,
      groupID: groupID ?? this.groupID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventID.present) {
      map['event_id'] = Variable<int>(eventID.value);
    }
    if (groupID.present) {
      map['group_id'] = Variable<int>(groupID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsGroupsCompanion(')
          ..write('eventID: $eventID, ')
          ..write('groupID: $groupID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EventsTeachersTable extends EventsTeachers
    with TableInfo<$EventsTeachersTable, EventsTeacher> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventsTeachersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _eventIDMeta = const VerificationMeta(
    'eventID',
  );
  @override
  late final GeneratedColumn<int> eventID = GeneratedColumn<int>(
    'event_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES events (id)',
    ),
  );
  static const VerificationMeta _teacherIDMeta = const VerificationMeta(
    'teacherID',
  );
  @override
  late final GeneratedColumn<int> teacherID = GeneratedColumn<int>(
    'teacher_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES teachers (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [eventID, teacherID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'events_teachers';
  @override
  VerificationContext validateIntegrity(
    Insertable<EventsTeacher> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('event_id')) {
      context.handle(
        _eventIDMeta,
        eventID.isAcceptableOrUnknown(data['event_id']!, _eventIDMeta),
      );
    } else if (isInserting) {
      context.missing(_eventIDMeta);
    }
    if (data.containsKey('teacher_id')) {
      context.handle(
        _teacherIDMeta,
        teacherID.isAcceptableOrUnknown(data['teacher_id']!, _teacherIDMeta),
      );
    } else if (isInserting) {
      context.missing(_teacherIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EventsTeacher map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventsTeacher(
      eventID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}event_id'],
          )!,
      teacherID:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}teacher_id'],
          )!,
    );
  }

  @override
  $EventsTeachersTable createAlias(String alias) {
    return $EventsTeachersTable(attachedDatabase, alias);
  }
}

class EventsTeacher extends DataClass implements Insertable<EventsTeacher> {
  final int eventID;
  final int teacherID;
  const EventsTeacher({required this.eventID, required this.teacherID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['event_id'] = Variable<int>(eventID);
    map['teacher_id'] = Variable<int>(teacherID);
    return map;
  }

  EventsTeachersCompanion toCompanion(bool nullToAbsent) {
    return EventsTeachersCompanion(
      eventID: Value(eventID),
      teacherID: Value(teacherID),
    );
  }

  factory EventsTeacher.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventsTeacher(
      eventID: serializer.fromJson<int>(json['eventID']),
      teacherID: serializer.fromJson<int>(json['teacherID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'eventID': serializer.toJson<int>(eventID),
      'teacherID': serializer.toJson<int>(teacherID),
    };
  }

  EventsTeacher copyWith({int? eventID, int? teacherID}) => EventsTeacher(
    eventID: eventID ?? this.eventID,
    teacherID: teacherID ?? this.teacherID,
  );
  EventsTeacher copyWithCompanion(EventsTeachersCompanion data) {
    return EventsTeacher(
      eventID: data.eventID.present ? data.eventID.value : this.eventID,
      teacherID: data.teacherID.present ? data.teacherID.value : this.teacherID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventsTeacher(')
          ..write('eventID: $eventID, ')
          ..write('teacherID: $teacherID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(eventID, teacherID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventsTeacher &&
          other.eventID == this.eventID &&
          other.teacherID == this.teacherID);
}

class EventsTeachersCompanion extends UpdateCompanion<EventsTeacher> {
  final Value<int> eventID;
  final Value<int> teacherID;
  final Value<int> rowid;
  const EventsTeachersCompanion({
    this.eventID = const Value.absent(),
    this.teacherID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EventsTeachersCompanion.insert({
    required int eventID,
    required int teacherID,
    this.rowid = const Value.absent(),
  }) : eventID = Value(eventID),
       teacherID = Value(teacherID);
  static Insertable<EventsTeacher> custom({
    Expression<int>? eventID,
    Expression<int>? teacherID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (eventID != null) 'event_id': eventID,
      if (teacherID != null) 'teacher_id': teacherID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EventsTeachersCompanion copyWith({
    Value<int>? eventID,
    Value<int>? teacherID,
    Value<int>? rowid,
  }) {
    return EventsTeachersCompanion(
      eventID: eventID ?? this.eventID,
      teacherID: teacherID ?? this.teacherID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (eventID.present) {
      map['event_id'] = Variable<int>(eventID.value);
    }
    if (teacherID.present) {
      map['teacher_id'] = Variable<int>(teacherID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventsTeachersCompanion(')
          ..write('eventID: $eventID, ')
          ..write('teacherID: $teacherID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SubjectsTable subjects = $SubjectsTable(this);
  late final $EventTypesTable eventTypes = $EventTypesTable(this);
  late final $RoomsTable rooms = $RoomsTable(this);
  late final $EventsTable events = $EventsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $GroupsTable groups = $GroupsTable(this);
  late final $TeachersTable teachers = $TeachersTable(this);
  late final $EventsGroupsTable eventsGroups = $EventsGroupsTable(this);
  late final $EventsTeachersTable eventsTeachers = $EventsTeachersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    subjects,
    eventTypes,
    rooms,
    events,
    tasks,
    groups,
    teachers,
    eventsGroups,
    eventsTeachers,
  ];
}

typedef $$SubjectsTableCreateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      required String title,
      required String shortName,
    });
typedef $$SubjectsTableUpdateCompanionBuilder =
    SubjectsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> shortName,
    });

final class $$SubjectsTableReferences
    extends BaseReferences<_$AppDatabase, $SubjectsTable, Subject> {
  $$SubjectsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$AppDatabase db,
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
    extends Composer<_$AppDatabase, $SubjectsTable> {
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
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
    extends Composer<_$AppDatabase, $SubjectsTable> {
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get shortName => $composableBuilder(
    column: $table.shortName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SubjectsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubjectsTable> {
  $$SubjectsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

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
          _$AppDatabase,
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
  $$SubjectsTableTableManager(_$AppDatabase db, $SubjectsTable table)
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
                Value<String> title = const Value.absent(),
                Value<String> shortName = const Value.absent(),
              }) =>
                  SubjectsCompanion(id: id, title: title, shortName: shortName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String shortName,
              }) => SubjectsCompanion.insert(
                id: id,
                title: title,
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
      _$AppDatabase,
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
    });
typedef $$EventTypesTableUpdateCompanionBuilder =
    EventTypesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> shortName,
    });

final class $$EventTypesTableReferences
    extends BaseReferences<_$AppDatabase, $EventTypesTable, EventType> {
  $$EventTypesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$AppDatabase db,
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
    extends Composer<_$AppDatabase, $EventTypesTable> {
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
    extends Composer<_$AppDatabase, $EventTypesTable> {
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
}

class $$EventTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventTypesTable> {
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
          _$AppDatabase,
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
  $$EventTypesTableTableManager(_$AppDatabase db, $EventTypesTable table)
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
              }) =>
                  EventTypesCompanion(id: id, name: name, shortName: shortName),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String shortName,
              }) => EventTypesCompanion.insert(
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
      _$AppDatabase,
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
typedef $$RoomsTableCreateCompanionBuilder =
    RoomsCompanion Function({
      Value<int> id,
      required String title,
      required String building,
    });
typedef $$RoomsTableUpdateCompanionBuilder =
    RoomsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> building,
    });

final class $$RoomsTableReferences
    extends BaseReferences<_$AppDatabase, $RoomsTable, Room> {
  $$RoomsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTable, List<Event>> _eventsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.events,
    aliasName: $_aliasNameGenerator(db.rooms.id, db.events.roomID),
  );

  $$EventsTableProcessedTableManager get eventsRefs {
    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.roomID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RoomsTableFilterComposer extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableFilterComposer({
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get building => $composableBuilder(
    column: $table.building,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> eventsRefs(
    Expression<bool> Function($$EventsTableFilterComposer f) f,
  ) {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.roomID,
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

class $$RoomsTableOrderingComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableOrderingComposer({
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get building => $composableBuilder(
    column: $table.building,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RoomsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RoomsTable> {
  $$RoomsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get building =>
      $composableBuilder(column: $table.building, builder: (column) => column);

  Expression<T> eventsRefs<T extends Object>(
    Expression<T> Function($$EventsTableAnnotationComposer a) f,
  ) {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.roomID,
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

class $$RoomsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RoomsTable,
          Room,
          $$RoomsTableFilterComposer,
          $$RoomsTableOrderingComposer,
          $$RoomsTableAnnotationComposer,
          $$RoomsTableCreateCompanionBuilder,
          $$RoomsTableUpdateCompanionBuilder,
          (Room, $$RoomsTableReferences),
          Room,
          PrefetchHooks Function({bool eventsRefs})
        > {
  $$RoomsTableTableManager(_$AppDatabase db, $RoomsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RoomsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RoomsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$RoomsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> building = const Value.absent(),
              }) => RoomsCompanion(id: id, title: title, building: building),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String building,
              }) => RoomsCompanion.insert(
                id: id,
                title: title,
                building: building,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RoomsTableReferences(db, table, e),
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
                    await $_getPrefetchedData<Room, $RoomsTable, Event>(
                      currentTable: table,
                      referencedTable: $$RoomsTableReferences._eventsRefsTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$RoomsTableReferences(db, table, p0).eventsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.roomID == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RoomsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RoomsTable,
      Room,
      $$RoomsTableFilterComposer,
      $$RoomsTableOrderingComposer,
      $$RoomsTableAnnotationComposer,
      $$RoomsTableCreateCompanionBuilder,
      $$RoomsTableUpdateCompanionBuilder,
      (Room, $$RoomsTableReferences),
      Room,
      PrefetchHooks Function({bool eventsRefs})
    >;
typedef $$EventsTableCreateCompanionBuilder =
    EventsCompanion Function({
      Value<int> id,
      required int subjectID,
      required DateTime startTime,
      required DateTime endTime,
      required bool isCustom,
      Value<EventBaseType?> baseType,
      Value<int?> typeID,
      Value<int?> roomID,
    });
typedef $$EventsTableUpdateCompanionBuilder =
    EventsCompanion Function({
      Value<int> id,
      Value<int> subjectID,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<bool> isCustom,
      Value<EventBaseType?> baseType,
      Value<int?> typeID,
      Value<int?> roomID,
    });

final class $$EventsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTable, Event> {
  $$EventsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SubjectsTable _subjectIDTable(_$AppDatabase db) => db.subjects
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

  static $EventTypesTable _typeIDTable(_$AppDatabase db) => db.eventTypes
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

  static $RoomsTable _roomIDTable(_$AppDatabase db) =>
      db.rooms.createAlias($_aliasNameGenerator(db.events.roomID, db.rooms.id));

  $$RoomsTableProcessedTableManager? get roomID {
    final $_column = $_itemColumn<int>('room_id');
    if ($_column == null) return null;
    final manager = $$RoomsTableTableManager(
      $_db,
      $_db.rooms,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_roomIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EventsGroupsTable, List<EventsGroup>>
  _eventsGroupsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventsGroups,
    aliasName: $_aliasNameGenerator(db.events.id, db.eventsGroups.eventID),
  );

  $$EventsGroupsTableProcessedTableManager get eventsGroupsRefs {
    final manager = $$EventsGroupsTableTableManager(
      $_db,
      $_db.eventsGroups,
    ).filter((f) => f.eventID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EventsTeachersTable, List<EventsTeacher>>
  _eventsTeachersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventsTeachers,
    aliasName: $_aliasNameGenerator(db.events.id, db.eventsTeachers.eventID),
  );

  $$EventsTeachersTableProcessedTableManager get eventsTeachersRefs {
    final manager = $$EventsTeachersTableTableManager(
      $_db,
      $_db.eventsTeachers,
    ).filter((f) => f.eventID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsTeachersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EventsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTable> {
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

  ColumnWithTypeConverterFilters<EventBaseType?, EventBaseType, int>
  get baseType => $composableBuilder(
    column: $table.baseType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
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

  $$RoomsTableFilterComposer get roomID {
    final $$RoomsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomID,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableFilterComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> eventsGroupsRefs(
    Expression<bool> Function($$EventsGroupsTableFilterComposer f) f,
  ) {
    final $$EventsGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsGroups,
      getReferencedColumn: (t) => t.eventID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsGroupsTableFilterComposer(
            $db: $db,
            $table: $db.eventsGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> eventsTeachersRefs(
    Expression<bool> Function($$EventsTeachersTableFilterComposer f) f,
  ) {
    final $$EventsTeachersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsTeachers,
      getReferencedColumn: (t) => t.eventID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTeachersTableFilterComposer(
            $db: $db,
            $table: $db.eventsTeachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTable> {
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

  ColumnOrderings<int> get baseType => $composableBuilder(
    column: $table.baseType,
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

  $$RoomsTableOrderingComposer get roomID {
    final $$RoomsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomID,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableOrderingComposer(
            $db: $db,
            $table: $db.rooms,
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
    extends Composer<_$AppDatabase, $EventsTable> {
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

  GeneratedColumnWithTypeConverter<EventBaseType?, int> get baseType =>
      $composableBuilder(column: $table.baseType, builder: (column) => column);

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

  $$RoomsTableAnnotationComposer get roomID {
    final $$RoomsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.roomID,
      referencedTable: $db.rooms,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RoomsTableAnnotationComposer(
            $db: $db,
            $table: $db.rooms,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> eventsGroupsRefs<T extends Object>(
    Expression<T> Function($$EventsGroupsTableAnnotationComposer a) f,
  ) {
    final $$EventsGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsGroups,
      getReferencedColumn: (t) => t.eventID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.eventsGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> eventsTeachersRefs<T extends Object>(
    Expression<T> Function($$EventsTeachersTableAnnotationComposer a) f,
  ) {
    final $$EventsTeachersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsTeachers,
      getReferencedColumn: (t) => t.eventID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTeachersTableAnnotationComposer(
            $db: $db,
            $table: $db.eventsTeachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EventsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTable,
          Event,
          $$EventsTableFilterComposer,
          $$EventsTableOrderingComposer,
          $$EventsTableAnnotationComposer,
          $$EventsTableCreateCompanionBuilder,
          $$EventsTableUpdateCompanionBuilder,
          (Event, $$EventsTableReferences),
          Event,
          PrefetchHooks Function({
            bool subjectID,
            bool typeID,
            bool roomID,
            bool eventsGroupsRefs,
            bool eventsTeachersRefs,
          })
        > {
  $$EventsTableTableManager(_$AppDatabase db, $EventsTable table)
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
                Value<EventBaseType?> baseType = const Value.absent(),
                Value<int?> typeID = const Value.absent(),
                Value<int?> roomID = const Value.absent(),
              }) => EventsCompanion(
                id: id,
                subjectID: subjectID,
                startTime: startTime,
                endTime: endTime,
                isCustom: isCustom,
                baseType: baseType,
                typeID: typeID,
                roomID: roomID,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int subjectID,
                required DateTime startTime,
                required DateTime endTime,
                required bool isCustom,
                Value<EventBaseType?> baseType = const Value.absent(),
                Value<int?> typeID = const Value.absent(),
                Value<int?> roomID = const Value.absent(),
              }) => EventsCompanion.insert(
                id: id,
                subjectID: subjectID,
                startTime: startTime,
                endTime: endTime,
                isCustom: isCustom,
                baseType: baseType,
                typeID: typeID,
                roomID: roomID,
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
          prefetchHooksCallback: ({
            subjectID = false,
            typeID = false,
            roomID = false,
            eventsGroupsRefs = false,
            eventsTeachersRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventsGroupsRefs) db.eventsGroups,
                if (eventsTeachersRefs) db.eventsTeachers,
              ],
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
                if (roomID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.roomID,
                            referencedTable: $$EventsTableReferences
                                ._roomIDTable(db),
                            referencedColumn:
                                $$EventsTableReferences._roomIDTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventsGroupsRefs)
                    await $_getPrefetchedData<Event, $EventsTable, EventsGroup>(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences
                          ._eventsGroupsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsGroupsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventID == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (eventsTeachersRefs)
                    await $_getPrefetchedData<
                      Event,
                      $EventsTable,
                      EventsTeacher
                    >(
                      currentTable: table,
                      referencedTable: $$EventsTableReferences
                          ._eventsTeachersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EventsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsTeachersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.eventID == item.id,
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

typedef $$EventsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTable,
      Event,
      $$EventsTableFilterComposer,
      $$EventsTableOrderingComposer,
      $$EventsTableAnnotationComposer,
      $$EventsTableCreateCompanionBuilder,
      $$EventsTableUpdateCompanionBuilder,
      (Event, $$EventsTableReferences),
      Event,
      PrefetchHooks Function({
        bool subjectID,
        bool typeID,
        bool roomID,
        bool eventsGroupsRefs,
        bool eventsTeachersRefs,
      })
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      required String title,
      Value<bool> isDone,
      required bool isCustom,
      Value<int?> supertaskID,
      Value<DateTime?> deadline,
      Value<TaskType?> type,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<bool> isDone,
      Value<bool> isCustom,
      Value<int?> supertaskID,
      Value<DateTime?> deadline,
      Value<TaskType?> type,
    });

class $$TasksTableFilterComposer extends Composer<_$AppDatabase, $TasksTable> {
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
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

  ColumnFilters<int> get supertaskID => $composableBuilder(
    column: $table.supertaskID,
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

class $$TasksTableOrderingComposer
    extends Composer<_$AppDatabase, $TasksTable> {
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
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

  ColumnOrderings<int> get supertaskID => $composableBuilder(
    column: $table.supertaskID,
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
    extends Composer<_$AppDatabase, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<bool> get isDone =>
      $composableBuilder(column: $table.isDone, builder: (column) => column);

  GeneratedColumn<bool> get isCustom =>
      $composableBuilder(column: $table.isCustom, builder: (column) => column);

  GeneratedColumn<int> get supertaskID => $composableBuilder(
    column: $table.supertaskID,
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
          _$AppDatabase,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
          Task,
          PrefetchHooks Function()
        > {
  $$TasksTableTableManager(_$AppDatabase db, $TasksTable table)
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
                Value<String> title = const Value.absent(),
                Value<bool> isDone = const Value.absent(),
                Value<bool> isCustom = const Value.absent(),
                Value<int?> supertaskID = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<TaskType?> type = const Value.absent(),
              }) => TasksCompanion(
                id: id,
                title: title,
                isDone: isDone,
                isCustom: isCustom,
                supertaskID: supertaskID,
                deadline: deadline,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<bool> isDone = const Value.absent(),
                required bool isCustom,
                Value<int?> supertaskID = const Value.absent(),
                Value<DateTime?> deadline = const Value.absent(),
                Value<TaskType?> type = const Value.absent(),
              }) => TasksCompanion.insert(
                id: id,
                title: title,
                isDone: isDone,
                isCustom: isCustom,
                supertaskID: supertaskID,
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
      _$AppDatabase,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, BaseReferences<_$AppDatabase, $TasksTable, Task>),
      Task,
      PrefetchHooks Function()
    >;
typedef $$GroupsTableCreateCompanionBuilder =
    GroupsCompanion Function({Value<int> id, required String name});
typedef $$GroupsTableUpdateCompanionBuilder =
    GroupsCompanion Function({Value<int> id, Value<String> name});

final class $$GroupsTableReferences
    extends BaseReferences<_$AppDatabase, $GroupsTable, Group> {
  $$GroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsGroupsTable, List<EventsGroup>>
  _eventsGroupsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventsGroups,
    aliasName: $_aliasNameGenerator(db.groups.id, db.eventsGroups.groupID),
  );

  $$EventsGroupsTableProcessedTableManager get eventsGroupsRefs {
    final manager = $$EventsGroupsTableTableManager(
      $_db,
      $_db.eventsGroups,
    ).filter((f) => f.groupID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsGroupsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GroupsTableFilterComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
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

  Expression<bool> eventsGroupsRefs(
    Expression<bool> Function($$EventsGroupsTableFilterComposer f) f,
  ) {
    final $$EventsGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsGroups,
      getReferencedColumn: (t) => t.groupID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsGroupsTableFilterComposer(
            $db: $db,
            $table: $db.eventsGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $GroupsTable> {
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
    extends Composer<_$AppDatabase, $GroupsTable> {
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

  Expression<T> eventsGroupsRefs<T extends Object>(
    Expression<T> Function($$EventsGroupsTableAnnotationComposer a) f,
  ) {
    final $$EventsGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsGroups,
      getReferencedColumn: (t) => t.groupID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.eventsGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GroupsTable,
          Group,
          $$GroupsTableFilterComposer,
          $$GroupsTableOrderingComposer,
          $$GroupsTableAnnotationComposer,
          $$GroupsTableCreateCompanionBuilder,
          $$GroupsTableUpdateCompanionBuilder,
          (Group, $$GroupsTableReferences),
          Group,
          PrefetchHooks Function({bool eventsGroupsRefs})
        > {
  $$GroupsTableTableManager(_$AppDatabase db, $GroupsTable table)
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
                          $$GroupsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventsGroupsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (eventsGroupsRefs) db.eventsGroups],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventsGroupsRefs)
                    await $_getPrefetchedData<Group, $GroupsTable, EventsGroup>(
                      currentTable: table,
                      referencedTable: $$GroupsTableReferences
                          ._eventsGroupsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$GroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsGroupsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.groupID == item.id,
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

typedef $$GroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GroupsTable,
      Group,
      $$GroupsTableFilterComposer,
      $$GroupsTableOrderingComposer,
      $$GroupsTableAnnotationComposer,
      $$GroupsTableCreateCompanionBuilder,
      $$GroupsTableUpdateCompanionBuilder,
      (Group, $$GroupsTableReferences),
      Group,
      PrefetchHooks Function({bool eventsGroupsRefs})
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

final class $$TeachersTableReferences
    extends BaseReferences<_$AppDatabase, $TeachersTable, Teacher> {
  $$TeachersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EventsTeachersTable, List<EventsTeacher>>
  _eventsTeachersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.eventsTeachers,
    aliasName: $_aliasNameGenerator(
      db.teachers.id,
      db.eventsTeachers.teacherID,
    ),
  );

  $$EventsTeachersTableProcessedTableManager get eventsTeachersRefs {
    final manager = $$EventsTeachersTableTableManager(
      $_db,
      $_db.eventsTeachers,
    ).filter((f) => f.teacherID.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_eventsTeachersRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TeachersTableFilterComposer
    extends Composer<_$AppDatabase, $TeachersTable> {
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

  Expression<bool> eventsTeachersRefs(
    Expression<bool> Function($$EventsTeachersTableFilterComposer f) f,
  ) {
    final $$EventsTeachersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsTeachers,
      getReferencedColumn: (t) => t.teacherID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTeachersTableFilterComposer(
            $db: $db,
            $table: $db.eventsTeachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeachersTableOrderingComposer
    extends Composer<_$AppDatabase, $TeachersTable> {
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
    extends Composer<_$AppDatabase, $TeachersTable> {
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

  Expression<T> eventsTeachersRefs<T extends Object>(
    Expression<T> Function($$EventsTeachersTableAnnotationComposer a) f,
  ) {
    final $$EventsTeachersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.eventsTeachers,
      getReferencedColumn: (t) => t.teacherID,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTeachersTableAnnotationComposer(
            $db: $db,
            $table: $db.eventsTeachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TeachersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TeachersTable,
          Teacher,
          $$TeachersTableFilterComposer,
          $$TeachersTableOrderingComposer,
          $$TeachersTableAnnotationComposer,
          $$TeachersTableCreateCompanionBuilder,
          $$TeachersTableUpdateCompanionBuilder,
          (Teacher, $$TeachersTableReferences),
          Teacher,
          PrefetchHooks Function({bool eventsTeachersRefs})
        > {
  $$TeachersTableTableManager(_$AppDatabase db, $TeachersTable table)
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
                          $$TeachersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventsTeachersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (eventsTeachersRefs) db.eventsTeachers,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (eventsTeachersRefs)
                    await $_getPrefetchedData<
                      Teacher,
                      $TeachersTable,
                      EventsTeacher
                    >(
                      currentTable: table,
                      referencedTable: $$TeachersTableReferences
                          ._eventsTeachersRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$TeachersTableReferences(
                                db,
                                table,
                                p0,
                              ).eventsTeachersRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.teacherID == item.id,
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

typedef $$TeachersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TeachersTable,
      Teacher,
      $$TeachersTableFilterComposer,
      $$TeachersTableOrderingComposer,
      $$TeachersTableAnnotationComposer,
      $$TeachersTableCreateCompanionBuilder,
      $$TeachersTableUpdateCompanionBuilder,
      (Teacher, $$TeachersTableReferences),
      Teacher,
      PrefetchHooks Function({bool eventsTeachersRefs})
    >;
typedef $$EventsGroupsTableCreateCompanionBuilder =
    EventsGroupsCompanion Function({
      required int eventID,
      required int groupID,
      Value<int> rowid,
    });
typedef $$EventsGroupsTableUpdateCompanionBuilder =
    EventsGroupsCompanion Function({
      Value<int> eventID,
      Value<int> groupID,
      Value<int> rowid,
    });

final class $$EventsGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $EventsGroupsTable, EventsGroup> {
  $$EventsGroupsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EventsTable _eventIDTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.eventsGroups.eventID, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventID {
    final $_column = $_itemColumn<int>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GroupsTable _groupIDTable(_$AppDatabase db) => db.groups.createAlias(
    $_aliasNameGenerator(db.eventsGroups.groupID, db.groups.id),
  );

  $$GroupsTableProcessedTableManager get groupID {
    final $_column = $_itemColumn<int>('group_id')!;

    final manager = $$GroupsTableTableManager(
      $_db,
      $_db.groups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groupIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventsGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $EventsGroupsTable> {
  $$EventsGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableFilterComposer get eventID {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventID,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$GroupsTableFilterComposer get groupID {
    final $$GroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupID,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableFilterComposer(
            $db: $db,
            $table: $db.groups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsGroupsTable> {
  $$EventsGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableOrderingComposer get eventID {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventID,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GroupsTableOrderingComposer get groupID {
    final $$GroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupID,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableOrderingComposer(
            $db: $db,
            $table: $db.groups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsGroupsTable> {
  $$EventsGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableAnnotationComposer get eventID {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventID,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$GroupsTableAnnotationComposer get groupID {
    final $$GroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groupID,
      referencedTable: $db.groups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.groups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsGroupsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsGroupsTable,
          EventsGroup,
          $$EventsGroupsTableFilterComposer,
          $$EventsGroupsTableOrderingComposer,
          $$EventsGroupsTableAnnotationComposer,
          $$EventsGroupsTableCreateCompanionBuilder,
          $$EventsGroupsTableUpdateCompanionBuilder,
          (EventsGroup, $$EventsGroupsTableReferences),
          EventsGroup,
          PrefetchHooks Function({bool eventID, bool groupID})
        > {
  $$EventsGroupsTableTableManager(_$AppDatabase db, $EventsGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EventsGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EventsGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$EventsGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> eventID = const Value.absent(),
                Value<int> groupID = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsGroupsCompanion(
                eventID: eventID,
                groupID: groupID,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int eventID,
                required int groupID,
                Value<int> rowid = const Value.absent(),
              }) => EventsGroupsCompanion.insert(
                eventID: eventID,
                groupID: groupID,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EventsGroupsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventID = false, groupID = false}) {
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
                if (eventID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventID,
                            referencedTable: $$EventsGroupsTableReferences
                                ._eventIDTable(db),
                            referencedColumn:
                                $$EventsGroupsTableReferences
                                    ._eventIDTable(db)
                                    .id,
                          )
                          as T;
                }
                if (groupID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.groupID,
                            referencedTable: $$EventsGroupsTableReferences
                                ._groupIDTable(db),
                            referencedColumn:
                                $$EventsGroupsTableReferences
                                    ._groupIDTable(db)
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

typedef $$EventsGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsGroupsTable,
      EventsGroup,
      $$EventsGroupsTableFilterComposer,
      $$EventsGroupsTableOrderingComposer,
      $$EventsGroupsTableAnnotationComposer,
      $$EventsGroupsTableCreateCompanionBuilder,
      $$EventsGroupsTableUpdateCompanionBuilder,
      (EventsGroup, $$EventsGroupsTableReferences),
      EventsGroup,
      PrefetchHooks Function({bool eventID, bool groupID})
    >;
typedef $$EventsTeachersTableCreateCompanionBuilder =
    EventsTeachersCompanion Function({
      required int eventID,
      required int teacherID,
      Value<int> rowid,
    });
typedef $$EventsTeachersTableUpdateCompanionBuilder =
    EventsTeachersCompanion Function({
      Value<int> eventID,
      Value<int> teacherID,
      Value<int> rowid,
    });

final class $$EventsTeachersTableReferences
    extends BaseReferences<_$AppDatabase, $EventsTeachersTable, EventsTeacher> {
  $$EventsTeachersTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $EventsTable _eventIDTable(_$AppDatabase db) => db.events.createAlias(
    $_aliasNameGenerator(db.eventsTeachers.eventID, db.events.id),
  );

  $$EventsTableProcessedTableManager get eventID {
    final $_column = $_itemColumn<int>('event_id')!;

    final manager = $$EventsTableTableManager(
      $_db,
      $_db.events,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_eventIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $TeachersTable _teacherIDTable(_$AppDatabase db) =>
      db.teachers.createAlias(
        $_aliasNameGenerator(db.eventsTeachers.teacherID, db.teachers.id),
      );

  $$TeachersTableProcessedTableManager get teacherID {
    final $_column = $_itemColumn<int>('teacher_id')!;

    final manager = $$TeachersTableTableManager(
      $_db,
      $_db.teachers,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_teacherIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EventsTeachersTableFilterComposer
    extends Composer<_$AppDatabase, $EventsTeachersTable> {
  $$EventsTeachersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableFilterComposer get eventID {
    final $$EventsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventID,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$TeachersTableFilterComposer get teacherID {
    final $$TeachersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherID,
      referencedTable: $db.teachers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeachersTableFilterComposer(
            $db: $db,
            $table: $db.teachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTeachersTableOrderingComposer
    extends Composer<_$AppDatabase, $EventsTeachersTable> {
  $$EventsTeachersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableOrderingComposer get eventID {
    final $$EventsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventID,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EventsTableOrderingComposer(
            $db: $db,
            $table: $db.events,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$TeachersTableOrderingComposer get teacherID {
    final $$TeachersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherID,
      referencedTable: $db.teachers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeachersTableOrderingComposer(
            $db: $db,
            $table: $db.teachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTeachersTableAnnotationComposer
    extends Composer<_$AppDatabase, $EventsTeachersTable> {
  $$EventsTeachersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$EventsTableAnnotationComposer get eventID {
    final $$EventsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.eventID,
      referencedTable: $db.events,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }

  $$TeachersTableAnnotationComposer get teacherID {
    final $$TeachersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.teacherID,
      referencedTable: $db.teachers,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TeachersTableAnnotationComposer(
            $db: $db,
            $table: $db.teachers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EventsTeachersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EventsTeachersTable,
          EventsTeacher,
          $$EventsTeachersTableFilterComposer,
          $$EventsTeachersTableOrderingComposer,
          $$EventsTeachersTableAnnotationComposer,
          $$EventsTeachersTableCreateCompanionBuilder,
          $$EventsTeachersTableUpdateCompanionBuilder,
          (EventsTeacher, $$EventsTeachersTableReferences),
          EventsTeacher,
          PrefetchHooks Function({bool eventID, bool teacherID})
        > {
  $$EventsTeachersTableTableManager(
    _$AppDatabase db,
    $EventsTeachersTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EventsTeachersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$EventsTeachersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$EventsTeachersTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> eventID = const Value.absent(),
                Value<int> teacherID = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EventsTeachersCompanion(
                eventID: eventID,
                teacherID: teacherID,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int eventID,
                required int teacherID,
                Value<int> rowid = const Value.absent(),
              }) => EventsTeachersCompanion.insert(
                eventID: eventID,
                teacherID: teacherID,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EventsTeachersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({eventID = false, teacherID = false}) {
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
                if (eventID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.eventID,
                            referencedTable: $$EventsTeachersTableReferences
                                ._eventIDTable(db),
                            referencedColumn:
                                $$EventsTeachersTableReferences
                                    ._eventIDTable(db)
                                    .id,
                          )
                          as T;
                }
                if (teacherID) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.teacherID,
                            referencedTable: $$EventsTeachersTableReferences
                                ._teacherIDTable(db),
                            referencedColumn:
                                $$EventsTeachersTableReferences
                                    ._teacherIDTable(db)
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

typedef $$EventsTeachersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EventsTeachersTable,
      EventsTeacher,
      $$EventsTeachersTableFilterComposer,
      $$EventsTeachersTableOrderingComposer,
      $$EventsTeachersTableAnnotationComposer,
      $$EventsTeachersTableCreateCompanionBuilder,
      $$EventsTeachersTableUpdateCompanionBuilder,
      (EventsTeacher, $$EventsTeachersTableReferences),
      EventsTeacher,
      PrefetchHooks Function({bool eventID, bool teacherID})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SubjectsTableTableManager get subjects =>
      $$SubjectsTableTableManager(_db, _db.subjects);
  $$EventTypesTableTableManager get eventTypes =>
      $$EventTypesTableTableManager(_db, _db.eventTypes);
  $$RoomsTableTableManager get rooms =>
      $$RoomsTableTableManager(_db, _db.rooms);
  $$EventsTableTableManager get events =>
      $$EventsTableTableManager(_db, _db.events);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$GroupsTableTableManager get groups =>
      $$GroupsTableTableManager(_db, _db.groups);
  $$TeachersTableTableManager get teachers =>
      $$TeachersTableTableManager(_db, _db.teachers);
  $$EventsGroupsTableTableManager get eventsGroups =>
      $$EventsGroupsTableTableManager(_db, _db.eventsGroups);
  $$EventsTeachersTableTableManager get eventsTeachers =>
      $$EventsTeachersTableTableManager(_db, _db.eventsTeachers);
}
