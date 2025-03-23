import 'package:events_api/events_api.dart' show EventsApi;
import 'package:groups_api/groups_api.dart' show GroupsApi;
import 'package:teachers_api/teachers_api.dart' show TeachersApi;
import 'package:local_db_api/local_db_api.dart' show AppDatabase;
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

class UniversityRepository {
  UniversityRepository({
    required EventsApi eventsApi,
    required GroupsApi groupsApi,
    required TeachersApi teachersApi,
    required AppDatabase localDBApi,
  }) : _eventsApi = eventsApi,
       _groupsApi = groupsApi,
       _teachersApi = teachersApi,
       _localDBApi = localDBApi;

  final EventsApi _eventsApi;
  final GroupsApi _groupsApi;
  final TeachersApi _teachersApi;
  final AppDatabase _localDBApi;

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
    final groups = <Group>{};

    final response = await _groupsApi.fetchGroups();

    for (final faculty in response) {
      for (final direction in faculty.directions) {
        groups.addAll(
          direction.groups.map((group) => Group.fromApiModel(group)),
        );
        for (final speciality in direction.specialities) {
          groups.addAll(
            speciality.groups.map((group) => Group.fromApiModel(group)),
          );
        }
      }
    }

    _groupsStreamController.add(groups.toList());
  }

  Future<dynamic> dispose() => Future.wait([
    _teachersStreamController.close(),
    _groupsStreamController.close(),
    _eventsStreamController.close(),
  ]);
}
