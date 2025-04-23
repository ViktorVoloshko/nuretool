import 'package:drift/drift.dart';

import '../../models/models.dart';

import 'tables.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subject => integer().references(Subjects, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  BoolColumn get isCustom => boolean()();
  IntColumn get baseType => intEnum<EventBaseType>().nullable()();
  IntColumn get type => integer().nullable().references(EventTypes, #id)();
  TextColumn get relations => text().map(EventRelations.converter)();
}
