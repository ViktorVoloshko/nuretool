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

class EventTypes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get shortName => text()();
  IntColumn get baseType => intEnum<EventBaseType>()();
}
