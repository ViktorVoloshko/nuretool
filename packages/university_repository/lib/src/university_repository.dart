import 'dart:async';

import 'package:collection/collection.dart';
import 'package:events_api/events_api.dart' show EventsApi;
import 'package:groups_api/groups_api.dart' show GroupsApi;
import 'package:rooms_api/rooms_api.dart' show RoomsApi;
import 'package:settings_storage/settings_storage.dart';
import 'package:teachers_api/teachers_api.dart' show TeachersApi;
import 'package:drift_db/drift_db.dart' as db;
import 'package:rxdart/rxdart.dart' hide Subject;

import 'models/models.dart';
import 'utils/utils.dart';

class UniversityRepository {
  UniversityRepository({
    required EventsApi eventsApi,
    required GroupsApi groupsApi,
    required TeachersApi teachersApi,
    required RoomsApi roomsApi,
    required db.DriftDB driftDB,
    required SettingsStorage settingsStorage,
  }) : _eventsApi = eventsApi,
       _groupsApi = groupsApi,
       _teachersApi = teachersApi,
       _roomsApi = roomsApi,
       _driftDB = driftDB,
       _settingsStorage = settingsStorage {
    _init();
  }

  final EventsApi _eventsApi;
  final GroupsApi _groupsApi;
  final TeachersApi _teachersApi;
  final RoomsApi _roomsApi;
  final db.DriftDB _driftDB;
  final SettingsStorage _settingsStorage;

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

  Stream<int?> get userGroupID => _settingsStorage.userGroupID;
  Stream<SavedSchedules> get savedSchedules => _settingsStorage.savedSchedules;

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

    return _driftDB.saveGroups(groups);
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

    return _driftDB.saveTeachers(teachers);
  }

  Future<void> fetchRooms() async {
    final rooms = <db.RoomsCompanion>[];

    final response = await _roomsApi.fetchRooms();

    for (final building in response) {
      rooms.addAll(building.auditories.map((e) => e.toDBModel()));
    }

    return _driftDB.saveRooms(rooms);
  }

  Future<void> deleteGroupEvents(int groupID) => _driftDB.deleteEvents(
    _groupsStreamController.value
        .firstWhere((group) => group.id == groupID)
        .events,
  );

  Future<void> deleteTeacherEvents(int teacherID) => _driftDB.deleteEvents(
    _teachersStreamController.value
        .firstWhere((teacher) => teacher.id == teacherID)
        .events,
  );

  Future<void> deleteRoomEvents(int roomID) => _driftDB.deleteEvents(
    _roomsStreamController.value.firstWhere((room) => room.id == roomID).events,
  );

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

    await deleteGroupEvents(groupID);

    await _driftDB.saveSubjects(subjects.map((e) => e.toDBModel()));
    return _driftDB.saveApiEvents(
      events.map(
        (e) => e.toDBModel(
          _roomsStreamController.value
              .firstWhereOrNull((room) => room.name == e.auditory)
              ?.id,
        ),
      ),
      types.map((e) => e.toDBModel()),
    );
  }

  Future<void> fetchEventsForTeacher(
    int teacherID,
    DateTime from,
    DateTime to,
  ) async {
    final (:events, :subjects, :types) = await _eventsApi.fetchEventsForTeacher(
      teacherID,
      from.millisecondsSinceEpoch ~/ 1000,
      to.millisecondsSinceEpoch ~/ 1000,
    );

    await deleteTeacherEvents(teacherID);

    _driftDB.saveSubjects(subjects.map((e) => e.toDBModel()));
    return _driftDB.saveApiEvents(
      events.map(
        (e) => e.toDBModel(
          _roomsStreamController.value
              .firstWhereOrNull((room) => room.name == e.auditory)
              ?.id,
        ),
      ),
      types.map((e) => e.toDBModel()),
    );
  }

  Future<void> fetchEventsForRoom(
    int roomID,
    DateTime from,
    DateTime to,
  ) async {
    final (:events, :subjects, :types) = await _eventsApi.fetchEventsForRoom(
      roomID,
      from.millisecondsSinceEpoch ~/ 1000,
      to.millisecondsSinceEpoch ~/ 1000,
    );

    await deleteRoomEvents(roomID);

    _driftDB.saveSubjects(subjects.map((e) => e.toDBModel()));
    return _driftDB.saveApiEvents(
      events.map(
        (e) => e.toDBModel(
          _roomsStreamController.value
              .firstWhereOrNull((room) => room.name == e.auditory)
              ?.id,
        ),
      ),
      types.map((e) => e.toDBModel()),
    );
  }

  Future<void> saveEvent(Event event) => _driftDB.saveEvent(event.toDBModel());

  // TODO: Delete event

  Future<void> setUserGroupID(int groupID) =>
      _settingsStorage.setUserGroupID(groupID);

  Future<void> addGroupSchedule(int groupID) async {
    final currentSavedSchedules = await savedSchedules.first;
    _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        groupIDs: {...currentSavedSchedules.groupIDs, groupID},
      ),
    );

    return fetchEventsForGroup(
      groupID,
      DateTime.now().startOfSemester,
      DateTime.now().endOfSemester,
    );
  }

  Future<void> removeGroupSchedule(int groupID) async {
    final currentSavedSchedules = await savedSchedules.first;

    deleteGroupEvents(groupID);

    return _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        groupIDs: {...currentSavedSchedules.groupIDs}..remove(groupID),
      ),
    );
  }

  Future<void> addTeacherSchedule(int teacherID) async {
    final currentSavedSchedules = await savedSchedules.first;

    fetchEventsForTeacher(
      teacherID,
      DateTime.now().startOfSemester,
      DateTime.now().endOfSemester,
    );

    return _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        teacherIDs: {...currentSavedSchedules.teacherIDs, teacherID},
      ),
    );
  }

  Future<void> removeTeacherSchedule(int teacherID) async {
    final currentSavedSchedules = await savedSchedules.first;

    deleteTeacherEvents(teacherID);

    return _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        teacherIDs: {...currentSavedSchedules.teacherIDs}..remove(teacherID),
      ),
    );
  }

  Future<void> addRoomSchedule(int roomID) async {
    final currentSavedSchedules = await savedSchedules.first;

    fetchEventsForRoom(
      roomID,
      DateTime.now().startOfSemester,
      DateTime.now().endOfSemester,
    );

    return _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        roomIDs: {...currentSavedSchedules.roomIDs, roomID},
      ),
    );
  }

  Future<void> removeRoomSchedule(int roomID) async {
    final currentSavedSchedules = await savedSchedules.first;

    deleteRoomEvents(roomID);

    return _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        roomIDs: {...currentSavedSchedules.roomIDs}..remove(roomID),
      ),
    );
  }

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
    _subjectsSubscription = _driftDB.loadSubjects().asBroadcastStream().listen(
      (subjects) => _subjectsStreamController.add(
        subjects.map((e) => Subject.fromDBModel(e)).toList(),
      ),
    );

    _groupsSubscription = _driftDB.loadGroups().asBroadcastStream().listen(
      (groups) => _groupsStreamController.add(
        groups.map((e) => Group.fromDBModel(e)).toList(),
      ),
    );

    _teachersSubscription = _driftDB.loadTeachers().asBroadcastStream().listen(
      (teachers) => _teachersStreamController.add(
        teachers.map((e) => Teacher.fromDBModel(e)).toList(),
      ),
    );

    _roomsSubscription = _driftDB.loadRooms().asBroadcastStream().listen(
      (rooms) => _roomsStreamController.add(
        rooms.map((e) => Room.fromDBModel(e)).toList(),
      ),
    );

    _eventsSubscription = _driftDB.loadEvents().asBroadcastStream().listen((
      eventsData,
    ) {
      final subjects = _subjectsStreamController.value;
      final groups = _groupsStreamController.value;
      final teachers = _teachersStreamController.value;
      final rooms = _roomsStreamController.value;

      for (final eventData in eventsData) {
        subjects
            .firstWhere((subject) => subject.id == eventData.event.subject)
            .events
            .add(eventData.event.id);

        groups
            .where(
              (group) => eventData.event.relations.groups.contains(group.id),
            )
            .forEach((group) => group.events.add(eventData.event.id));

        teachers
            .where(
              (teacher) =>
                  eventData.event.relations.teachers.contains(teacher.id),
            )
            .forEach((teacher) => teacher.events.add(eventData.event.id));

        rooms
            .firstWhereOrNull((room) => eventData.event.roomID == room.id)
            ?.events
            .add(eventData.event.id);
      }

      final events = <Event>[
        ...eventsData.map(
          (e) => Event.fromDBModel(
            e.event,
            (e.type == null) ? null : EventType.fromDBModel(e.type!),
          ),
        ),
      ];
      _eventsStreamController.add(events);
    });
  }
}
