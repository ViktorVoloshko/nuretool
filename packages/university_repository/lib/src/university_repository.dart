import 'dart:async';

import 'package:collection/collection.dart';
import 'package:events_api/events_api.dart'
    show EventsApi, EventsRequestFailure;
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
  final BehaviorSubject<List<Event>> _scheduleEventsStreamController =
      BehaviorSubject<List<Event>>.seeded(const []);
  final BehaviorSubject<List<Group>> _groupsStreamController =
      BehaviorSubject<List<Group>>.seeded(const []);
  final BehaviorSubject<List<Teacher>> _teachersStreamController =
      BehaviorSubject<List<Teacher>>.seeded(const []);
  final BehaviorSubject<List<Room>> _roomsStreamController =
      BehaviorSubject<List<Room>>.seeded(const []);
  final BehaviorSubject<List<Subject>> _subjectsStreamController =
      BehaviorSubject<List<Subject>>.seeded(const []);
  final BehaviorSubject<(bool, ScheduleData?)>
  _updatingScheduleStreamController = BehaviorSubject.seeded((false, null));
  final BehaviorSubject<UniversityRepositoryError?> _errorStreamController =
      BehaviorSubject.seeded(null);

  Stream<List<Event>> get events => _eventsStreamController.asBroadcastStream();
  Stream<List<Event>> get scheduleEvents =>
      _scheduleEventsStreamController.asBroadcastStream();
  Stream<List<Group>> get groups => _groupsStreamController.asBroadcastStream();
  Stream<List<Teacher>> get teachers =>
      _teachersStreamController.asBroadcastStream();
  Stream<List<Room>> get rooms => _roomsStreamController.asBroadcastStream();
  Stream<List<Subject>> get subjects =>
      _subjectsStreamController.asBroadcastStream();
  Stream<(bool, ScheduleData?)> get updateStatus =>
      _updatingScheduleStreamController.asBroadcastStream();
  Stream<UniversityRepositoryError?> get error =>
      _errorStreamController.asBroadcastStream();

  Stream<int?> get userGroupID => _settingsStorage.userGroupID;
  Stream<SavedSchedules> get savedSchedules => _settingsStorage.savedSchedules;
  Stream<ScheduleData?> get selectedSchedule =>
      _settingsStorage.selectedSchedule;

  late final StreamSubscription<List<db.EventData>> _eventsSubscription;
  StreamSubscription<List<db.EventData>>? _scheduleEventsSubscription;
  late final StreamSubscription<List<db.Group>> _groupsSubscription;
  late final StreamSubscription<List<db.Teacher>> _teachersSubscription;
  late final StreamSubscription<List<db.Room>> _roomsSubscription;
  late final StreamSubscription<List<db.Subject>> _subjectsSubscription;
  late final StreamSubscription<ScheduleData?> _selectedScheduleSubscrition;

  Future<void> fetchEntities() async {
    if (_updatingScheduleStreamController.value.$1) return;

    _updatingScheduleStreamController.add((true, null));

    try {
      await fetchGroups();
      await fetchTeachers();
      await fetchRooms();
      _errorStreamController.add(null);
    } catch (e) {
      _errorStreamController.add(UniversityRepositoryError.updateError);
    }

    _updatingScheduleStreamController.add((false, null));
  }

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

  Future<void> setUserGroupID(int groupID) =>
      _settingsStorage.setUserGroupID(groupID);

  Future<void> setSelectedSchedule(ScheduleData schedule) =>
      _settingsStorage.setSelectedSchedule(schedule);

  Future<void> saveEvent(Event event) => _driftDB.saveEvent(event.toDBModel());

  Future<void> deleteEvent(int eventID) => _driftDB.deleteEvent(eventID);

  Future<void> updateSchedule(ScheduleData schedule) async {
    _updatingScheduleStreamController.add((true, schedule));

    final from = DateTime.now().startOfSemester.millisecondsSinceEpoch ~/ 1000;
    final to = DateTime.now().endOfSemester.millisecondsSinceEpoch ~/ 1000;

    try {
      final (:events, :subjects, :types) = await switch (schedule.type) {
        ScheduleType.group => _eventsApi.fetchEventsForGroup(
          schedule.id,
          from,
          to,
        ),
        ScheduleType.teacher => _eventsApi.fetchEventsForTeacher(
          schedule.id,
          from,
          to,
        ),
        ScheduleType.room => _eventsApi.fetchEventsForRoom(
          schedule.id,
          from,
          to,
        ),
      };

      _errorStreamController.add(null);

      await _deleteEvents(schedule);

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
    } on EventsRequestFailure {
      // Probably just no events
      _errorStreamController.add(null);
      return _deleteEvents(schedule);
    } catch (e) {
      _errorStreamController.add(UniversityRepositoryError.updateError);
    } finally {
      _updatingScheduleStreamController.add((false, null));
    }
  }

  Future<void> addSchedule(ScheduleData schedule) async {
    final currentSavedSchedules = await savedSchedules.first;
    _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        schedules: {...currentSavedSchedules.schedules, schedule},
      ),
    );

    return updateSchedule(schedule);
  }

  Future<void> removeSchedule(ScheduleData schedule) async {
    final currentSavedSchedules = await savedSchedules.first;

    _settingsStorage.setSavedSchedules(
      currentSavedSchedules.copyWith(
        schedules: {...currentSavedSchedules.schedules}..remove(schedule),
      ),
    );

    return _deleteEvents(schedule, true);
  }

  Future<void> _deleteEvents(ScheduleData schedule, [bool safe = false]) async {
    final events = _eventsStreamController.value;
    final savedSchedules = await _settingsStorage.savedSchedules.first;

    final eventsToDelete = List<int>.from(
      switch (schedule.type) {
        ScheduleType.group => events.where(
          (event) =>
              event.groups.contains(schedule.id) && !safe
                  ? true
                  : _eventSafeToDelete(event, savedSchedules),
        ),
        ScheduleType.teacher => events.where(
          (event) =>
              event.teachers.contains(schedule.id) && !safe
                  ? true
                  : _eventSafeToDelete(event, savedSchedules),
        ),
        ScheduleType.room => events.where(
          (event) =>
              event.room == schedule.id && !safe
                  ? true
                  : _eventSafeToDelete(event, savedSchedules),
        ),
      }.map((e) => e.id),
    );

    return _driftDB.deleteFetchedEvents(eventsToDelete);
  }

  bool _eventSafeToDelete(Event event, SavedSchedules savedSchedules) {
    if (event.groups.any(
          (group) => savedSchedules.schedules
              .where((e) => e.type == ScheduleType.group)
              .map((e) => e.id)
              .contains(group),
        ) ||
        event.teachers.any(
          (teacher) => savedSchedules.schedules
              .where((e) => e.type == ScheduleType.teacher)
              .map((e) => e.id)
              .contains(teacher),
        ) ||
        savedSchedules.schedules
            .where((e) => e.type == ScheduleType.room)
            .map((e) => e.id)
            .contains(event.room)) {
      return false;
    } else {
      return true;
    }
  }

  Future<dynamic> dispose() async {
    await Future.wait([
      _subjectsSubscription.cancel(),
      _roomsSubscription.cancel(),
      _teachersSubscription.cancel(),
      _groupsSubscription.cancel(),
      if (_scheduleEventsSubscription != null)
        _scheduleEventsSubscription!.cancel(),
      _eventsSubscription.cancel(),
      _selectedScheduleSubscrition.cancel(),
    ]);
    return Future.wait([
      _subjectsStreamController.close(),
      _roomsStreamController.close(),
      _teachersStreamController.close(),
      _groupsStreamController.close(),
      _scheduleEventsStreamController.close(),
      _eventsStreamController.close(),
      _updatingScheduleStreamController.close(),
      _errorStreamController.close(),
    ]);
  }

  Future<void> _init() async {
    _subjectsSubscription = _driftDB.loadSubjects().listen(
      (subjects) => _subjectsStreamController.add(
        subjects.map((e) => Subject.fromDBModel(e)).toList(),
      ),
    );

    _groupsSubscription = _driftDB.loadGroups().listen(
      (groups) => _groupsStreamController.add(
        groups.map((e) => Group.fromDBModel(e)).toList(),
      ),
    );

    _teachersSubscription = _driftDB.loadTeachers().listen(
      (teachers) => _teachersStreamController.add(
        teachers.map((e) => Teacher.fromDBModel(e)).toList(),
      ),
    );

    _roomsSubscription = _driftDB.loadRooms().listen(
      (rooms) => _roomsStreamController.add(
        rooms.map((e) => Room.fromDBModel(e)).toList(),
      ),
    );

    _eventsSubscription = _driftDB.loadEvents().listen((eventsData) {
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

    _selectedScheduleSubscrition = _settingsStorage.selectedSchedule.listen((
      schedule,
    ) {
      if (_scheduleEventsSubscription != null) {
        _scheduleEventsSubscription!.cancel();
      }

      if (schedule == null) {
        _scheduleEventsStreamController.add(const []);
      } else {
        _scheduleEventsSubscription = _driftDB
            .loadScheduleEvents(schedule)
            .listen((eventsData) {
              final events = <Event>[
                ...eventsData.map(
                  (e) => Event.fromDBModel(
                    e.event,
                    (e.type == null) ? null : EventType.fromDBModel(e.type!),
                  ),
                ),
              ];
              _scheduleEventsStreamController.add(events);
            });
      }
    });
  }
}
