import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:local_db_api/local_db_api.dart' as db;
import 'package:events_api/events_api.dart' as api;

import 'models.dart';

@immutable
class Event extends Equatable {
  const Event({
    required this.id,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.isCustom,
    required this.baseType,
    this.type,
    required this.groups,
    required this.teachers,
    this.room,
  });

  Event.fromDBModel(db.Event event, this.type, this.groups, this.teachers)
    : id = event.id,
      subject = event.subjectID,
      startTime = event.startTime,
      endTime = event.endTime,
      isCustom = event.isCustom,
      baseType = event.baseType!.fromDBModel(),
      room = event.relations.room;

  final int id;
  final int subject;
  final DateTime startTime;
  final DateTime endTime;
  final bool isCustom;
  final EventBaseType baseType;
  final EventType? type;
  final List<int> groups;
  final List<int> teachers;
  final int? room;

  db.EventsCompanion toDBModel() => db.EventsCompanion.insert(
    id: Value(id),
    subjectID: subject,
    startTime: startTime,
    endTime: endTime,
    isCustom: isCustom,
    baseType: Value(baseType.toDBModel()),
    typeID: Value.absentIfNull(type?.id),
    relations: db.EventRelations(
      groups: groups,
      teachers: teachers,
      room: room,
    ),
  );

  Event copyWith({
    int? id,
    int? subject,
    DateTime? startTime,
    DateTime? endTime,
    bool? isCustom,
    EventBaseType? baseType,
    EventType? type,
    List<int>? groups,
    List<int>? teachers,
    int? room,
  }) => Event(
    id: id ?? this.id,
    subject: subject ?? this.subject,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isCustom: isCustom ?? this.isCustom,
    baseType: baseType ?? this.baseType,
    type: type ?? this.type,
    groups: groups ?? this.groups,
    teachers: teachers ?? this.teachers,
    room: room ?? this.room,
  );

  @override
  List<Object?> get props => [
    id,
    subject,
    startTime,
    endTime,
    isCustom,
    baseType,
    type,
    groups,
    teachers,
    room,
  ];
}

enum EventBaseType {
  lecture,
  practice,
  laboratory,
  consultation,
  test,
  exam,
  project,
}

extension DomainToDBEventBaseType on EventBaseType {
  db.EventBaseType toDBModel() => switch (this) {
    EventBaseType.lecture => db.EventBaseType.lecture,
    EventBaseType.practice => db.EventBaseType.practice,
    EventBaseType.laboratory => db.EventBaseType.laboratory,
    EventBaseType.consultation => db.EventBaseType.consultation,
    EventBaseType.test => db.EventBaseType.test,
    EventBaseType.exam => db.EventBaseType.exam,
    EventBaseType.project => db.EventBaseType.project,
  };
}

extension DBToDomainEventBaseType on db.EventBaseType {
  EventBaseType fromDBModel() => switch (this) {
    db.EventBaseType.lecture => EventBaseType.lecture,
    db.EventBaseType.practice => EventBaseType.practice,
    db.EventBaseType.laboratory => EventBaseType.laboratory,
    db.EventBaseType.consultation => EventBaseType.consultation,
    db.EventBaseType.test => EventBaseType.test,
    db.EventBaseType.exam => EventBaseType.exam,
    db.EventBaseType.project => EventBaseType.project,
  };
}

db.EventBaseType _fromIDBase(int id) => switch (id) {
  0 => db.EventBaseType.lecture,
  1 => db.EventBaseType.practice,
  2 => db.EventBaseType.laboratory,
  3 => db.EventBaseType.consultation,
  4 || 5 => db.EventBaseType.exam,
  6 => db.EventBaseType.project,
  _ => throw UnimplementedError('id_base $id is not inplemented'),
};

extension ApiToDBEvent on api.Event {
  /// Since cist does not provide IDs for events, you have to retrive ID of
  /// inserted event later to add it
  /// to relations tables with [generateRelations].
  db.EventsCompanion toDBModel([int? roomID]) => db.EventsCompanion.insert(
    subjectID: subjectID,
    startTime: DateTime.fromMillisecondsSinceEpoch(startTime * 1000),
    endTime: DateTime.fromMillisecondsSinceEpoch(endTime * 1000),
    isCustom: false,
    baseType: Value(_fromIDBase(type ~/ 10)),
    typeID: Value(type),
    relations: db.EventRelations(
      groups: groups,
      teachers: teachers,
      room: roomID,
    ),
  );
}
