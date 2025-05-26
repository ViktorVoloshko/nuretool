import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

part 'schedules_view_state.dart';

class SchedulesViewCubit extends Cubit<SchedulesViewState> {
  SchedulesViewCubit({
    required UniversityRepository universityRepository,
    required SettingsRepository settingsRepository,
  }) : _universityRepository = universityRepository,
       super(
         SchedulesViewState(
           groupSchedules: const [],
           teacherSchedules: const [],
           roomSchedules: const [],
         ),
       ) {
    _init();
  }

  final UniversityRepository _universityRepository;

  late final StreamSubscription<SavedSchedules> _subscription;

  void removeGroupSchedule(int groupID) =>
      _universityRepository.removeGroupSchedule(groupID);

  void _init() {
    _subscription = _universityRepository.savedSchedules.listen((
      schedules,
    ) async {
      final groups =
          (await _universityRepository.groups.first)
              .where((element) => schedules.groupIDs.contains(element.id))
              .toList();
      final teachers =
          (await _universityRepository.teachers.first)
              .where((element) => schedules.teacherIDs.contains(element.id))
              .toList();
      final rooms =
          (await _universityRepository.rooms.first)
              .where((element) => schedules.roomIDs.contains(element.id))
              .toList();

      emit(
        SchedulesViewState(
          groupSchedules: groups,
          teacherSchedules: teachers,
          roomSchedules: rooms,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
