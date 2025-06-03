import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

import '../models/models.dart';

part 'calendar_view_event.dart';
part 'calendar_view_state.dart';

class CalendarViewBloc extends Bloc<CalendarViewEvent, CalendarViewState> {
  CalendarViewBloc({required UniversityRepository universityRepository})
    : _universityRepository = universityRepository,
      super(CalendarViewInitial()) {
    on<CalendarViewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final UniversityRepository _universityRepository;

  late final StreamSubscription<List<Subject>> _subjectsSubscription;
  late final StreamSubscription<List<Group>> _groupsSubscription;
  late final StreamSubscription<List<Teacher>> _teachersSubscription;
  late final StreamSubscription<List<Room>> _roomsSubscription;
  late final StreamSubscription<ScheduleData?> _selectedScheduleSubscription;

  List<Subject> _subjects = const [];
  List<Group> _groups = const [];
  List<Teacher> _teachers = const [];
  List<Room> _rooms = const [];
  ScheduleData? _schedule;

  @override
  Future<void> close() async {
    await Future.wait([
      _subjectsSubscription.cancel(),
      _groupsSubscription.cancel(),
      _teachersSubscription.cancel(),
      _roomsSubscription.cancel(),
      _selectedScheduleSubscription.cancel(),
    ]);
    return super.close();
  }

  void _onSubscriptionRequested(
    CalendarViewSubscriptionRequested event,
    Emitter<CalendarViewState> emit,
  ) async {
    _subjectsSubscription = _universityRepository.subjects.listen(
      (subjects) => _subjects = subjects,
    );
    _groupsSubscription = _universityRepository.groups.listen(
      (groups) => _groups = groups,
    );
    _teachersSubscription = _universityRepository.teachers.listen(
      (teachers) => _teachers = teachers,
    );
    _roomsSubscription = _universityRepository.rooms.listen(
      (rooms) => _rooms = rooms,
    );
    _selectedScheduleSubscription = _universityRepository.selectedSchedule
        .listen((schedule) => _schedule = schedule);

    await emit.forEach(
      _universityRepository.scheduleEvents,
      onData:
          (events) => CalendarViewSuccess(
            schedule: _schedule,
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
          ),
      onError:
          (error, stackTrace) => CalendarViewFailure(message: error.toString()),
    );
  }
}
