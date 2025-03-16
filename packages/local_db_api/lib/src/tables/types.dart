import 'package:drift/drift.dart';

enum Type {
  lecture,
  practice,
  laboratory,
  consultation,
  test,
  exam,
  courseWork,
  unknown,
}

extension IDBaseToType on Type {
  static Type? fromIDBase(int id) => switch (id) {
    0 => Type.lecture,
    10 => Type.practice,
    20 => Type.laboratory,
    30 => Type.consultation,
    40 => Type.test,
    50 => Type.exam,
    60 => Type.courseWork,
    _ => null,
  };
}

class EventTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get shortName => text()();
  IntColumn get baseType => intEnum<Type>()();
}
