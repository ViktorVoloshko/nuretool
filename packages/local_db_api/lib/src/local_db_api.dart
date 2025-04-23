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
    ]);

    return query.watch().map((rows) {
      return rows
          .map(
            (row) => EventData(
              event: row.readTable(_database.events),
              type: row.readTableOrNull(_database.eventTypes),
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

  Future<void> saveEvent(EventsCompanion event) => _database.batch((batch) {
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
  });

  Future<void> saveApiEvents(
    Iterable<EventsCompanion> events,
    Iterable<EventTypesCompanion> types,
  ) async => _database.batch((batch) {
    batch.insertAllOnConflictUpdate(_database.eventTypes, types);
    batch.insertAllOnConflictUpdate(_database.events, events);
  });

  Future<void> saveEvents(Iterable<EventsCompanion> events) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.events, events),
  );

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
