import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

import '../models/models.dart';

part 'calendar_view_event.dart';
part 'calendar_view_state.dart';

class CalendarViewBloc extends Bloc<CalendarViewEvent, CalendarViewState> {
  CalendarViewBloc({
    required UniversityRepository universityRepository,
    required SettingsRepository settingsRepository,
  }) : _universityRepository = universityRepository,
       _settingsRepository = settingsRepository,
       super(CalendarViewInitial()) {
    on<CalendarViewSubscriptionRequested>(_onSubscriptionRequested);
    on<CalendarViewUpdateRequested>(_onUpdateRequested);
  }

  final UniversityRepository _universityRepository;
  final SettingsRepository _settingsRepository;

  late final StreamSubscription<List<Subject>> _subjectsSubscription;
  late final StreamSubscription<List<Group>> _groupsSubscription;
  late final StreamSubscription<List<Teacher>> _teachersSubscription;
  late final StreamSubscription<List<Room>> _roomsSubscription;
  late final StreamSubscription<ScheduleData?> _selectedScheduleSubscription;
  late final StreamSubscription<(bool, ScheduleData?)>
  _updateStatusSubscription;

  List<Subject> _subjects = const [];
  List<Group> _groups = const [];
  List<Teacher> _teachers = const [];
  List<Room> _rooms = const [];
  ScheduleData? _schedule;
  String? _scheduleName;

  void _onUpdateRequested(
    CalendarViewUpdateRequested event,
    Emitter<CalendarViewState> emit,
  ) => _universityRepository.updateSchedule(event.schedule);

  void _onSubscriptionRequested(
    CalendarViewSubscriptionRequested event,
    Emitter<CalendarViewState> emit,
  ) async {
    _subjectsSubscription = _universityRepository.subjects.listen(
      (subjects) => _subjects = subjects,
    );
    _groupsSubscription = _universityRepository.groups.listen((groups) {
      _groups = groups;
      _updateScheduleName();
    });
    _teachersSubscription = _universityRepository.teachers.listen((teachers) {
      _teachers = teachers;
      _updateScheduleName();
    });
    _roomsSubscription = _universityRepository.rooms.listen((rooms) {
      _rooms = rooms;
      _updateScheduleName();
    });
    _selectedScheduleSubscription = _universityRepository.selectedSchedule
        .listen((schedule) {
          _schedule = schedule;
          _updateScheduleName();
        });
    _updateStatusSubscription = _universityRepository.updateStatus.listen((
      status,
    ) {
      if (state is CalendarViewSuccess) {
        emit((state as CalendarViewSuccess).copyWith(isUpdating: status.$1));
      }
    });

    await Future.wait([
      emit.forEach(
        _settingsRepository.defaultCalendarMode,
        onData: (calendarMode) => state.copyWith(calendarMode: calendarMode),
      ),
      emit.forEach(
        _universityRepository.scheduleEvents,
        onData: (events) {
          return CalendarViewSuccess(
            schedule: _schedule,
            scheduleName: _scheduleName,
            calendarMode: state.calendarMode,
            isUpdating:
                (state is! CalendarViewSuccess)
                    ? false
                    : (state as CalendarViewSuccess).isUpdating,
            events:
                events
                    .map(
                      (e) => EventData(
                        event: e,
                        subject: _subjects.firstWhere(
                          (subject) => subject.id == e.subject,
                        ),
                        groups:
                            _groups
                                .where((group) => e.groups.contains(group.id))
                                .toList(),
                        teachers:
                            _teachers
                                .where(
                                  (teacher) => e.teachers.contains(teacher.id),
                                )
                                .toList(),
                        room: _rooms.firstWhereOrNull(
                          (room) => room.id == e.room,
                        ),
                      ),
                    )
                    .toList(),
          );
        },
        onError:
            (error, stackTrace) =>
                CalendarViewFailure(message: error.toString()),
      ),
    ]);
  }

  void _updateScheduleName() =>
      _scheduleName =
          _schedule == null
              ? null
              : switch (_schedule!.type) {
                ScheduleType.group =>
                  _groups.firstWhereOrNull((e) => e.id == _schedule!.id)?.name,
                ScheduleType.teacher =>
                  _teachers
                      .firstWhereOrNull((e) => e.id == _schedule!.id)
                      ?.name,
                ScheduleType.room =>
                  _rooms.firstWhereOrNull((e) => e.id == _schedule!.id)?.name,
              };

  @override
  Future<void> close() async {
    await Future.wait([
      _subjectsSubscription.cancel(),
      _groupsSubscription.cancel(),
      _teachersSubscription.cancel(),
      _roomsSubscription.cancel(),
      _selectedScheduleSubscription.cancel(),
      _updateStatusSubscription.cancel(),
    ]);
    return super.close();
  }
}
