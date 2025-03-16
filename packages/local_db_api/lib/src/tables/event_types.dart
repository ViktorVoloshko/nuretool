import 'package:drift/drift.dart';

enum EventBaseType {
  lecture,
  practice,
  laboratory,
  consultation,
  test,
  exam,
  project,
}

extension IDBaseToType on EventBaseType {
  static EventBaseType fromIDBase(int id) => switch (id) {
    0 => EventBaseType.lecture,
    10 => EventBaseType.practice,
    20 => EventBaseType.laboratory,
    30 => EventBaseType.consultation,
    40 || 50 => EventBaseType.exam,
    60 => EventBaseType.project,
    _ => throw UnimplementedError('id_base $id is not inplemented'),
  };
}

class EventTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get shortName => text()();
  IntColumn get baseType => intEnum<EventBaseType>()();
}
