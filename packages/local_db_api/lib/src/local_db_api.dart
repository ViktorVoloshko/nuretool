import 'database/database.dart';

class LocalDBApi {
  LocalDBApi({required AppDatabase database}) : _database = database;

  final AppDatabase _database;

  Stream<List<Event>> loadEvents() =>
      _database.select(_database.events).watch();
  Stream<List<Subject>> loadSubjects() =>
      _database.select(_database.subjects).watch();
  Stream<List<Group>> loadGroups() =>
      _database.select(_database.groups).watch();
  Stream<List<Teacher>> loadTeachers() =>
      _database.select(_database.teachers).watch();
  Stream<List<EventType>> loadEventTypes() =>
      _database.select(_database.eventTypes).watch();

  Future<int> saveEvent(EventsCompanion event) =>
      _database.into(_database.events).insertOnConflictUpdate(event);

  Future<void> saveEvents(List<EventsCompanion> events) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.events, events),
  );
  Future<void> saveSubjects(List<SubjectsCompanion> subjects) =>
      _database.batch(
        (batch) =>
            batch.insertAllOnConflictUpdate(_database.subjects, subjects),
      );
  Future<void> saveGroups(List<GroupsCompanion> groups) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.groups, groups),
  );
  Future<void> saveTeachers(List<TeachersCompanion> teachers) =>
      _database.batch(
        (batch) =>
            batch.insertAllOnConflictUpdate(_database.teachers, teachers),
      );
  Future<void> saveEventTypes(List<EventTypesCompanion> eventTypes) =>
      _database.batch(
        (batch) =>
            batch.insertAllOnConflictUpdate(_database.eventTypes, eventTypes),
      );

  Stream<List<Task>> loadTasks() => _database.select(_database.tasks).watch();

  Future<int> saveTask(TasksCompanion task) =>
      _database.into(_database.tasks).insertOnConflictUpdate(task);
  Future<void> saveTasks(List<TasksCompanion> tasks) => _database.batch(
    (batch) => batch.insertAllOnConflictUpdate(_database.tasks, tasks),
  );
}
