import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'tables/tables.dart';
import 'models/models.dart';

part 'drift_db.g.dart';

@DriftDatabase(
  tables: [Subjects, Events, EventTypes, Tasks, Groups, Teachers, Rooms],
)
class DriftDB extends _$DriftDB {
  DriftDB([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  Stream<List<EventData>> loadEvents() {
    final query = select(
      events,
    ).join([leftOuterJoin(eventTypes, eventTypes.id.equalsExp(events.typeID))]);

    return query.watch().map((rows) {
      return rows
          .map(
            (row) => EventData(
              event: row.readTable(events),
              type: row.readTableOrNull(eventTypes),
            ),
          )
          .toList();
    });
  }

  Stream<List<Subject>> loadSubjects() => select(subjects).watch();
  Stream<List<Group>> loadGroups() => select(groups).watch();
  Stream<List<Teacher>> loadTeachers() => select(teachers).watch();
  Stream<List<Room>> loadRooms() => select(rooms).watch();

  Future<int> saveEvent(EventsCompanion event) =>
      into(events).insertOnConflictUpdate(event);

  Future<void> saveEvents(Iterable<EventsCompanion> events) =>
      batch((batch) => batch.insertAllOnConflictUpdate(this.events, events));

  Future<void> saveApiEvents(
    Iterable<EventsCompanion> events,
    Iterable<EventTypesCompanion> types,
  ) async => batch((batch) {
    batch.insertAllOnConflictUpdate(eventTypes, types);
    batch.insertAllOnConflictUpdate(this.events, events);
  });

  Future<void> deleteEvents(Iterable<int> eventIDs) => batch(
    (batch) => batch.deleteWhere(events, (event) => event.id.isIn(eventIDs)),
  );

  Future<int> deleteFetchedEvents() =>
      (delete(events)..where((event) => event.isFetched.equals(true))).go();

  Future<void> saveSubjects(Iterable<SubjectsCompanion> subjects) => batch(
    (batch) => batch.insertAllOnConflictUpdate(this.subjects, subjects),
  );

  Future<int> deleteSubject(int subjectID) =>
      (delete(subjects)..where((subject) => subject.id.equals(subjectID))).go();

  Future<void> deleteSubjects(Iterable<int> subjectIDs) => batch(
    (batch) =>
        batch.deleteWhere(subjects, (subject) => subject.id.isIn(subjectIDs)),
  );

  Future<void> saveGroups(Iterable<GroupsCompanion> groups) =>
      batch((batch) => batch.insertAllOnConflictUpdate(this.groups, groups));

  Future<void> saveTeachers(Iterable<TeachersCompanion> teachers) => batch(
    (batch) => batch.insertAllOnConflictUpdate(this.teachers, teachers),
  );

  Future<void> saveRooms(Iterable<RoomsCompanion> rooms) =>
      batch((batch) => batch.insertAllOnConflictUpdate(this.rooms, rooms));

  Stream<List<Task>> loadTasks() => select(tasks).watch();

  Future<int> saveTask(TasksCompanion task) =>
      into(tasks).insertOnConflictUpdate(task);

  Future<void> saveTasks(Iterable<TasksCompanion> tasks) =>
      batch((batch) => batch.insertAllOnConflictUpdate(this.tasks, tasks));

  Future<int> deleteTask(int id) =>
      (delete(tasks)..where((task) => task.id.equals(id))).go();

  Future<int> deleteSupertask(int id) async {
    await (delete(tasks)..where((task) => task.supertaskID.equals(id))).go();
    return deleteTask(id);
  }

  Future<int> deleteGeneratedTasks() =>
      (delete(tasks)..where((task) => task.isGenerated.equals(true))).go();

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'database',
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
