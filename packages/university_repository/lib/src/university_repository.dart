import 'package:events_api/events_api.dart' hide Event;
import 'package:groups_api/groups_api.dart' hide Group;
import 'package:rxdart/rxdart.dart';
import 'package:teachers_api/teachers_api.dart' hide Teacher;

import 'models/models.dart';

class UniversityRepository {
  UniversityRepository({
    required EventsApi eventsApi,
    required GroupsApi groupsApi,
    required TeachersApi teachersApi,
  }) : _eventsApi = eventsApi,
       _groupsApi = groupsApi,
       _teachersApi = teachersApi;

  final EventsApi _eventsApi;
  final GroupsApi _groupsApi;
  final TeachersApi _teachersApi;

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
}
