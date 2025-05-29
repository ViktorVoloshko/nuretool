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
          updating: null,
        ),
      ) {
    _init();
  }

  final UniversityRepository _universityRepository;

  late final StreamSubscription<SavedSchedules> _schedulesSubscription;
  late final StreamSubscription<ScheduleData?> _updatingSubscription;
  late final StreamSubscription<int?> _userGroupSubscription;

  Future<void> updateSchedule(ScheduleData schedule) =>
      _universityRepository.updateSchedule(schedule);

  Future<void> removeSchedule(ScheduleData schedule) =>
      _universityRepository.removeSchedule(schedule);

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

      emit(state.copyWith(schedules: result, updating: state.updating));
    });

    _updatingSubscription = _universityRepository.updatingSchedule.listen(
      (event) => emit(state.copyWith(updating: event)),
    );

    _userGroupSubscription = _universityRepository.userGroupID.listen(
      (userGroupID) => emit(
        state.copyWith(userGroupID: userGroupID, updating: state.updating),
      ),
    );
  }

  @override
  Future<void> close() {
    Future.wait([
      _schedulesSubscription.cancel(),
      _userGroupSubscription.cancel(),
      _updatingSubscription.cancel(),
    ]);
    return super.close();
  }
}
