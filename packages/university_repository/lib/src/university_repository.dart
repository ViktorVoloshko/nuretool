import 'package:events_api/events_api.dart' show EventsApi;
import 'package:groups_api/groups_api.dart' show GroupsApi;
import 'package:teachers_api/teachers_api.dart' show TeachersApi;
import 'package:local_db_api/local_db_api.dart' hide Event, Group, Teacher;
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

class UniversityRepository {
  UniversityRepository({
    required EventsApi eventsApi,
    required GroupsApi groupsApi,
    required TeachersApi teachersApi,
    required LocalDBApi localDBApi,
  }) : _eventsApi = eventsApi,
       _groupsApi = groupsApi,
       _teachersApi = teachersApi,
       _localDBApi = localDBApi;

  final EventsApi _eventsApi;
  final GroupsApi _groupsApi;
  final TeachersApi _teachersApi;
  final LocalDBApi _localDBApi;

  late final _eventsStreamController = BehaviorSubject<List<Event>>.seeded(
    const [],
  );
  late final _groupsStreamController = BehaviorSubject<List<Group>>.seeded(
    const [],
  );
  late final _teachersStreamController = BehaviorSubject<List<Teacher>>.seeded(
    const [],
  );

  Stream<List<Event>> get events => _eventsStreamController.asBroadcastStream();
  Stream<List<Group>> get groups => _groupsStreamController.asBroadcastStream();
  Stream<List<Teacher>> get teachers =>
      _teachersStreamController.asBroadcastStream();

  Future<void> fetchGroups() async {
    // Since one group may appear multiple times in a JSON, Set is used.
    final groups = <GroupsCompanion>{};

    final response = await _groupsApi.fetchGroups();

    for (final faculty in response) {
      for (final direction in faculty.directions) {
        groups.addAll(direction.groups.map((e) => e.toDBModel()));
        for (final speciality in direction.specialities) {
          groups.addAll(speciality.groups.map((e) => e.toDBModel()));
        }
      }
    }

    return _localDBApi.saveGroups(groups);
  }

  Future<void> fetchTeachers() async {
    final teachers = <TeachersCompanion>[];

    final response = await _teachersApi.fetchTeachers();

    for (final faculty in response) {
      for (final department in faculty.departments) {
        teachers.addAll(department.teachers.map((e) => e.toDBModel()));
        for (final subdepartment in department.departments) {
          teachers.addAll(subdepartment.teachers.map((e) => e.toDBModel()));
        }
      }
    }

    return _localDBApi.saveTeachers(teachers);
  }

  Future<void> fetchEvents(int groupID, DateTime from, DateTime to) async {
    final (:events, :subjects, :types) = await _eventsApi.fetchEventsForGroup(
      groupID,
      from.millisecondsSinceEpoch ~/ 1000,
      to.millisecondsSinceEpoch ~/ 1000,
    );

    _localDBApi.saveSubjects(subjects.map((e) => e.toDBModel()));
    final eventIDs = await _localDBApi.saveApiEvents(
      events.map((e) => e.toDBModel()),
      types.map((e) => e.toDBModel()),
    );

    final relations = (<EventsGroupsCompanion>[], <EventsTeachersCompanion>[]);
    for (int i = 0; i < events.length; i++) {
      final eventRelations = events[i].generateRelations(eventIDs[i]);
      relations.$1.addAll(eventRelations.$1);
      relations.$2.addAll(eventRelations.$2);
    }
    return _localDBApi.saveEventsRelations(relations.$1, relations.$2);
  }

  Future<void> saveEvent(Event event) {
    final (eventDB, groups, teachers) = event.toDBModel();
    return _localDBApi.saveEvent(eventDB, groups, teachers);
  }

  // TODO: Delete event

  Future<dynamic> dispose() => Future.wait([
    _teachersStreamController.close(),
    _groupsStreamController.close(),
    _eventsStreamController.close(),
  ]);
}
