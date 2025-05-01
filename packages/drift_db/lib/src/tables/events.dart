import 'package:drift/drift.dart';

import '../models/models.dart';

import 'tables.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subject => integer().references(Subjects, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  BoolColumn get isFetched => boolean()();
  IntColumn get baseType => intEnum<EventBaseType>().nullable()();
  IntColumn get typeID =>
      integer().nullable().named('type_id').references(EventTypes, #id)();
  TextColumn get relations => text().map(EventRelations.converter)();
}
