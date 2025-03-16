import 'package:drift/drift.dart';

import 'tables.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectId => integer().references(Subjects, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  BoolColumn get isCustom => boolean()();
  IntColumn get typeID => integer().nullable().references(EventTypes, #id)();
  TextColumn get room => text().nullable()();
}
