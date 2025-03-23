import 'package:drift/drift.dart';

import 'tables.dart';

class EventsTeachers extends Table {
  IntColumn get eventID =>
      integer().named('event_id').references(Events, #id)();
  IntColumn get teacherID =>
      integer().named('teacher_id').references(Teachers, #id)();
}
