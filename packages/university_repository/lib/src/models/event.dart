import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift_db/drift_db.dart' as db;
import 'package:events_api/events_api.dart' as api;

import 'models.dart';

@immutable
class Event extends Equatable {
  const Event({
    this.id,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.isFetched,
    required this.baseType,
    this.type,
    required this.groups,
    required this.teachers,
    this.room,
  });

  Event.fromDBModel(db.Event event, this.type)
    : id = event.id,
      subject = event.subject,
      startTime = event.startTime,
      endTime = event.endTime,
      isFetched = event.isFetched,
      baseType = event.baseType!.fromDBModel(),
      room = event.roomID,
      groups = event.relations.groups,
      teachers = event.relations.teachers;

  final int? id;
  final int subject;
  final DateTime startTime;
  final DateTime endTime;
  final bool isFetched;
  final EventBaseType baseType;
  final EventType? type;
  final List<int> groups;
  final List<int> teachers;
  final int? room;

  db.EventsCompanion toDBModel() => db.EventsCompanion.insert(
    id: Value.absentIfNull(id),
    subject: subject,
    startTime: startTime,
    endTime: endTime,
    isFetched: isFetched,
    baseType: Value(baseType.toDBModel()),
    typeID: Value.absentIfNull(type?.id),
    roomID: Value.absentIfNull(room),
    relations: db.EventRelations(groups: groups, teachers: teachers),
  );

  Event copyWith({
    int? id,
    int? subject,
    DateTime? startTime,
    DateTime? endTime,
    bool? isFetched,
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
    isFetched: isFetched ?? this.isFetched,
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
    isFetched,
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
    subject: subjectID,
    startTime: DateTime.fromMillisecondsSinceEpoch(startTime * 1000),
    endTime: DateTime.fromMillisecondsSinceEpoch(endTime * 1000),
    isFetched: true,
    baseType: Value(_fromIDBase(type ~/ 10)),
    typeID: Value(type),
    roomID: Value.absentIfNull(roomID),
    relations: db.EventRelations(groups: groups, teachers: teachers),
  );
}
