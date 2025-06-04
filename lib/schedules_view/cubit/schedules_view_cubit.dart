import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

part 'schedules_view_state.dart';

class SchedulesViewCubit extends Cubit<SchedulesViewState> {
  SchedulesViewCubit({required UniversityRepository universityRepository})
    : _universityRepository = universityRepository,
      super(
        SchedulesViewState(
          schedules: const [],
          userGroupID: null,
          updateStatus: (false, null),
        ),
      ) {
    _init();
  }

  final UniversityRepository _universityRepository;

  late final StreamSubscription<SavedSchedules> _schedulesSubscription;
  late final StreamSubscription<(bool, ScheduleData?)> _updateSubscription;
  late final StreamSubscription<int?> _userGroupSubscription;
  late final StreamSubscription<ScheduleData?> _selectedScheduleSubscription;

  Future<void> updateSchedule(ScheduleData schedule) =>
      _universityRepository.updateSchedule(schedule);

  Future<void> removeSchedule(ScheduleData schedule) =>
      _universityRepository.removeSchedule(schedule);

  Future<void> selectSchedule(ScheduleData schedule) {
    emit(state.copyWith(scheduleSelected: true));
    return _universityRepository.setSelectedSchedule(schedule);
  }

  Future<String> _getEntityName(ScheduleData schedule) async {
    final groups = await _universityRepository.groups.first;
    final teachers = await _universityRepository.teachers.first;
    final rooms = await _universityRepository.rooms.first;

    return switch (schedule.type) {
      ScheduleType.group => groups.firstWhere((e) => e.id == schedule.id),
      ScheduleType.teacher => teachers.firstWhere((e) => e.id == schedule.id),
      ScheduleType.room => rooms.firstWhere((e) => e.id == schedule.id),
    }.name;
  }

  void _init() {
    _schedulesSubscription = _universityRepository.savedSchedules.listen((
      event,
    ) async {
      final result = <ScheduleInfo>[];
      for (final schedule in event.schedules) {
        result.add((schedule: schedule, name: await _getEntityName(schedule)));
      }

      emit(state.copyWith(schedules: result));
    });

    _updateSubscription = _universityRepository.updateStatus.listen(
      (event) => emit(state.copyWith(updateStatus: event)),
    );

    _userGroupSubscription = _universityRepository.userGroupID.listen(
      (userGroupID) => emit(state.copyWith(userGroupID: userGroupID)),
    );

    _selectedScheduleSubscription = _universityRepository.selectedSchedule
        .listen((schedule) => emit(state.copyWith(selectedSchedule: schedule)));
  }

  @override
  Future<void> close() {
    Future.wait([
      _schedulesSubscription.cancel(),
      _userGroupSubscription.cancel(),
      _updateSubscription.cancel(),
      _selectedScheduleSubscription.cancel(),
    ]);
    return super.close();
  }
}
