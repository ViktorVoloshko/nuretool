import 'package:drift/drift.dart';

import 'tables.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectID =>
      integer().named('subject_id').references(Subjects, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  BoolColumn get isCustom => boolean()();
  IntColumn get baseType => intEnum<EventBaseType>().nullable()();
  IntColumn get typeID =>
      integer().nullable().named('type_id').references(EventTypes, #id)();
  IntColumn get roomID =>
      integer().nullable().named('room_id').references(Rooms, #id)();
}
