import 'dart:async';

import 'package:events_api/events_api.dart' show EventsApi;
import 'package:groups_api/groups_api.dart' show GroupsApi;
import 'package:rooms_api/rooms_api.dart' show RoomsApi;
import 'package:teachers_api/teachers_api.dart' show TeachersApi;
import 'package:local_db_api/local_db_api.dart' as db;
import 'package:rxdart/rxdart.dart' hide Subject;

import 'models/models.dart';

class UniversityRepository {
  UniversityRepository({
    required EventsApi eventsApi,
    required GroupsApi groupsApi,
    required TeachersApi teachersApi,
    required RoomsApi roomsApi,
    required db.LocalDBApi localDBApi,
  }) : _eventsApi = eventsApi,
       _groupsApi = groupsApi,
       _teachersApi = teachersApi,
       _roomsApi = roomsApi,
       _localDBApi = localDBApi {
    _init();
  }

  final EventsApi _eventsApi;
  final GroupsApi _groupsApi;
  final TeachersApi _teachersApi;
  final RoomsApi _roomsApi;
  final db.LocalDBApi _localDBApi;

  final BehaviorSubject<List<Event>> _eventsStreamController =
      BehaviorSubject<List<Event>>.seeded(const []);
  final BehaviorSubject<List<Group>> _groupsStreamController =
      BehaviorSubject<List<Group>>.seeded(const []);
  final BehaviorSubject<List<Teacher>> _teachersStreamController =
      BehaviorSubject<List<Teacher>>.seeded(const []);
  final BehaviorSubject<List<Room>> _roomsStreamController =
      BehaviorSubject<List<Room>>.seeded(const []);
  final BehaviorSubject<List<Subject>> _subjectsStreamController =
      BehaviorSubject<List<Subject>>.seeded(const []);

  Stream<List<Event>> get events => _eventsStreamController.asBroadcastStream();
  Stream<List<Group>> get groups => _groupsStreamController.asBroadcastStream();
  Stream<List<Teacher>> get teachers =>
      _teachersStreamController.asBroadcastStream();
  Stream<List<Room>> get rooms => _roomsStreamController.asBroadcastStream();
  Stream<List<Subject>> get subjects =>
      _subjectsStreamController.asBroadcastStream();

  late final StreamSubscription<List<db.EventData>> _eventsSubscription;
  late final StreamSubscription<List<db.Group>> _groupsSubscription;
  late final StreamSubscription<List<db.Teacher>> _teachersSubscription;
  late final StreamSubscription<List<db.Room>> _roomsSubscription;
  late final StreamSubscription<List<db.Subject>> _subjectsSubscription;

  Future<void> fetchGroups() async {
    // Since one group may appear multiple times in a JSON, Set is used.
    final groups = <db.GroupsCompanion>{};

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
    final teachers = <db.TeachersCompanion>[];

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

  Future<void> fetchRooms() async {
    final rooms = <db.RoomsCompanion>[];

    final response = await _roomsApi.fetchRooms();

    for (final building in response) {
      rooms.addAll(
        building.auditories.map((e) => e.toDBModel(building.shortName)),
      );
    }

    return _localDBApi.saveRooms(rooms);
  }

  Future<void> fetchEventsForGroup(
    int groupID,
    DateTime from,
    DateTime to,
  ) async {
    final (:events, :subjects, :types) = await _eventsApi.fetchEventsForGroup(
      groupID,
      from.millisecondsSinceEpoch ~/ 1000,
      to.millisecondsSinceEpoch ~/ 1000,
    );

    _eventsSubscription.pause();

    _localDBApi.saveSubjects(subjects.map((e) => e.toDBModel()));
    final eventIDs = await _localDBApi.saveApiEvents(
      events.map((e) => e.toDBModel()),
      types.map((e) => e.toDBModel()),
    );

    final relations = (
      <db.EventsGroupsCompanion>[],
      <db.EventsTeachersCompanion>[],
    );
    for (int i = 0; i < events.length; i++) {
      final eventRelations = events[i].generateRelations(eventIDs[i]);
      relations.$1.addAll(eventRelations.$1);
      relations.$2.addAll(eventRelations.$2);
    }

    _eventsSubscription.resume();
    return _localDBApi.saveEventsRelations(relations.$1, relations.$2);
  }

  Future<void> saveEvent(Event event) {
    final (eventDB, groups, teachers) = event.toDBModel();
    return _localDBApi.saveEvent(eventDB, groups, teachers);
  }

  // TODO: Delete event

  Future<dynamic> dispose() async {
    await Future.wait([
      _subjectsSubscription.cancel(),
      _roomsSubscription.cancel(),
      _teachersSubscription.cancel(),
      _groupsSubscription.cancel(),
      _eventsSubscription.cancel(),
    ]);
    return Future.wait([
      _subjectsStreamController.close(),
      _roomsStreamController.close(),
      _teachersStreamController.close(),
      _groupsStreamController.close(),
      _eventsStreamController.close(),
    ]);
  }

  Future<void> _init() async {
    _subjectsSubscription = _localDBApi
        .loadSubjects()
        .asBroadcastStream()
        .listen(
          (subjects) => _subjectsStreamController.add(
            subjects.map((e) => Subject.fromDBModel(e)).toList(),
          ),
        );

    _groupsSubscription = _localDBApi.loadGroups().asBroadcastStream().listen(
      (groups) => _groupsStreamController.add(
        groups.map((e) => Group.fromDBModel(e)).toList(),
      ),
    );

    _teachersSubscription = _localDBApi
        .loadTeachers()
        .asBroadcastStream()
        .listen(
          (teachers) => _teachersStreamController.add(
            teachers.map((e) => Teacher.fromDBModel(e)).toList(),
          ),
        );

    _roomsSubscription = _localDBApi.loadRooms().asBroadcastStream().listen(
      (rooms) => _roomsStreamController.add(
        rooms.map((e) => Room.fromDBModel(e)).toList(),
      ),
    );

    _eventsSubscription = _localDBApi.loadEvents().asBroadcastStream().listen((
      eventsData,
    ) {
      // TODO: Verify this with actual code, might be super slow and error-prone.
      final events = <Event>[];

      final eventIDs = <int>{};
      eventIDs.addAll(eventsData.map((e) => e.event.id));

      final subjects = _subjectsStreamController.value;
      final groups = _groupsStreamController.value;
      final teachers = _teachersStreamController.value;
      // final rooms = _roomsStreamController.value;

      for (final eventID in eventIDs) {
        final eventDatas = eventsData.where((e) => e.event.id == eventID);

        final groupIDs = <int>{};
        final teacherIDs = <int>{};
        for (final eventData in eventDatas) {
          if (eventData.groupID != null) groupIDs.add(eventData.groupID!);
          if (eventData.teacherID != null) teacherIDs.add(eventData.teacherID!);
        }

        subjects
            .firstWhere(
              (subject) => subject.id == eventDatas.first.event.subjectID,
            )
            .events
            .add(eventID);

        for (final groupID in groupIDs) {
          groups.firstWhere((group) => group.id == groupID).events.add(eventID);
        }

        for (final teacherID in teacherIDs) {
          teachers
              .firstWhere((teacher) => teacher.id == teacherID)
              .events
              .add(eventID);
        }

        // rooms
        //     .firstWhere((room) => room.id == eventDatas.first.event.roomID)
        //     .events
        //     .add(eventID);

        events.add(
          Event.fromDBModel(
            eventDatas.first.event,
            (eventDatas.first.type == null)
                ? null
                : EventType.fromDBModel(eventDatas.first.type!),
            groupIDs.toList(),
            teacherIDs.toList(),
          ),
        );
      }

      _eventsStreamController.add(events);
    });
  }
}
