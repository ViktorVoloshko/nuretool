import 'package:drift/drift.dart';

enum TaskType { subject, project, practice, laboratory, test, exam }

class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  BoolColumn get isDone => boolean().clientDefault(() => false)();
  BoolColumn get isCustom => boolean()();
  IntColumn get supertaskID => integer().named('supertask_id').nullable()();
  DateTimeColumn get deadline => dateTime().nullable()();
  IntColumn get type => intEnum<TaskType>().nullable()();
}
