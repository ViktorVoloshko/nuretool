import 'package:drift/drift.dart';

import 'tables.dart';

class EventsGroups extends Table {
  IntColumn get eventID =>
      integer().named('event_id').references(Events, #id)();
  IntColumn get groupID =>
      integer().named('group_id').references(Groups, #id)();
}
