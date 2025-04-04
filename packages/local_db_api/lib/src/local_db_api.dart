import 'package:drift/drift.dart';

import 'models/models.dart';
import 'database/database.dart';

class LocalDBApi {
  LocalDBApi({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  Stream<List<EventData>> loadEvents() {
    final query = _database.select(_database.events).join([
      leftOuterJoin(
        _database.eventTypes,
        _database.eventTypes.id.equalsExp(_database.events.typeID),
      ),
      leftOuterJoin(
        _database.eventsGroups,
        _database.events.id.equalsExp(_database.eventsGroups.eventID),
      ),
      leftOuterJoin(
        _database.eventsTeachers,
        _database.events.id.equalsExp(_database.eventsTeachers.eventID),
      ),
    ]);

    return query.watch().map((rows) {
      return rows
          .map(
            (row) => EventData(
              event: row.readTable(_database.events),
              type: row.readTableOrNull(_database.eventTypes),
              groupID: row.read(_database.eventsGroups.groupID),
              teacherID: row.read(_database.eventsTeachers.teacherID),
            ),
          )
          .toList();
    });
  }

  Stream<List<Subject>> loadSubjects() =>
      _database.select(_database.subjects).watch();
  Stream<List<Group>> loadGroups() =>
      _database.select(_database.groups).watch();
  Stream<List<Teacher>> loadTeachers() =>
      _database.select(_database.teachers).watch();
  Stream<List<Room>> loadRooms() => _database.select(_database.rooms).watch();

  Future<void> saveEvent(
    EventsCompanion event,
    Iterable<EventsGroupsCompanion> groups,
    Iterable<EventsTeachersCompanion> teachers,
  ) => _database.batch((batch) {
    batch.insert(
      _database.events,
      event,
      // onConflict: DoUpdate(
      //   (old) => event,
      //   target: [
      //     _database.events.startTime,
      //     _database.events.endTime,
      //     _database.events.baseType,
      //     _database.events.room,
      //     _database.events.subjectID,
      //   ],
      // ),
    );
    // TODO: Cleanup old records in relations tables
    batch.insertAllOnConflictUpdate(_database.eventsGroups, groups);
    batch.insertAllOnConflictUpdate(_database.eventsTeachers, teachers);
  });

  Future<List<int>> saveApiEvents(
    Iterable<EventsCompanion> events,
    Iterable<EventTypesCompanion> types,
  ) async {
    await _database.batch(
      (batch) => batch.insertAllOnConflictUpdate(_database.eventTypes, types),
    );

    final eventIDs = <int>[];
    for (final event in events) {
      eventIDs.add(
        await _database.into(_database.events).insertOnConflictUpdate(event),
      );
    }
    return eventIDs;
  }

  Future<void> saveEventsRelations(
    Iterable<EventsGroupsCompanion> groups,
    Iterable<EventsTeachersCompanion> teachers,
  ) => _database.batch((batch) {
    batch.insertAllOnConflictUpdate(_database.eventsGroups, groups);
    batch.insertAllOnConflictUpdate(_database.eventsTeachers, teachers);
  });

  Future<void> saveEvents(
    Iterable<EventsCompanion> events,
    Iterable<EventType> types,
    Iterable<EventsGroupsCompanion> groups,
    Iterable<EventsTeachersCompanion> teachers,
  ) => _database.batch((batch) {
    batch.insertAllOnConflictUpdate(_database.events, events);
    batch.insertAllOnConflictUpdate(_database.eventTypes, types);
    batch.insertAllOnConflictUpdate(_database.eventsGroups, groups);
    batch.insertAllOnConflictUpdate(_database.eventsTeachers, teachers);
  });

  Future<void> saveSubjects(Iterable<SubjectsCompanion> subjects) =>
      _database.batch(
        (batch) =>
            batch.insertAllOnConflictUpdate(_database.subjects, subjects),
      );

  Future<void> saveGroups(Iterable<GroupsCompanion> groups) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.groups, groups),
  );

  Future<void> saveTeachers(Iterable<TeachersCompanion> teachers) =>
      _database.batch(
        (batch) =>
            batch.insertAllOnConflictUpdate(_database.teachers, teachers),
      );

  Future<void> saveRooms(Iterable<RoomsCompanion> rooms) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.rooms, rooms),
  );

  Stream<List<Task>> loadTasks() => _database.select(_database.tasks).watch();

  Future<int> saveTask(TasksCompanion task) =>
      _database.into(_database.tasks).insertOnConflictUpdate(task);

  Future<void> saveTasks(Iterable<TasksCompanion> tasks) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.tasks, tasks),
  );

  Future<void> dispose() => _database.close();
}
