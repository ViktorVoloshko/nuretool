import 'package:drift/drift.dart';

import 'tables.dart';

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BoolColumn get isDone => boolean().clientDefault(() => false)();
  BoolColumn get isCustom => boolean()();
  IntColumn get supertaskId => integer().nullable()();
  DateTimeColumn get deadline => dateTime().nullable()();
  IntColumn get type => intEnum<Type>().nullable()();
}
