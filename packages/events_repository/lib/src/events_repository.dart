import 'package:events_api/events_api.dart' hide Event;
import 'package:groups_api/groups_api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:teachers_api/teachers_api.dart';

import 'models/models.dart';

class EventsRepository {
  EventsRepository({
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

  Stream<List<Event>> get events => _eventsStreamController.asBroadcastStream();
}
