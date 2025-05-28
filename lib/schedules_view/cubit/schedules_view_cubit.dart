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
           userGroupID: null,
           updating: false,
         ),
       ) {
    _init();
  }

  final UniversityRepository _universityRepository;

  late final StreamSubscription<SavedSchedules> _schedulesSubscription;
  late final StreamSubscription<int?> _userGroupSubscription;

  Future<void> updateGroupSchedule(int groupID) async {
    emit(state.copyWith(updating: true));
    await _universityRepository.updateGroupSchedule(
      groupID,
      DateTime.now().startOfSemester,
      DateTime.now().endOfSemester,
    );
    emit(state.copyWith(updating: false));
  }

  void removeGroupSchedule(int groupID) =>
      _universityRepository.removeGroupSchedule(groupID);

  void updateTeacherSchedule(int teacherID) =>
      _universityRepository.updateTeacherSchedule(
        teacherID,
        DateTime.now().startOfSemester,
        DateTime.now().endOfSemester,
      );

  void removeTeacherSchedule(int teacherID) =>
      _universityRepository.removeTeacherSchedule(teacherID);

  void updateRoomSchedule(int roomID) =>
      _universityRepository.updateRoomSchedule(
        roomID,
        DateTime.now().startOfSemester,
        DateTime.now().endOfSemester,
      );

  void removeRoomSchedule(int roomID) =>
      _universityRepository.removeRoomSchedule(roomID);

  void _init() {
    _schedulesSubscription = _universityRepository.savedSchedules.listen((
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
        state.copyWith(
          groupSchedules: groups,
          teacherSchedules: teachers,
          roomSchedules: rooms,
        ),
      );
    });

    _userGroupSubscription = _universityRepository.userGroupID.listen(
      (userGroupID) => emit(state.copyWith(userGroupID: userGroupID)),
    );
  }

  @override
  Future<void> close() {
    Future.wait([
      _schedulesSubscription.cancel(),
      _userGroupSubscription.cancel(),
    ]);
    return super.close();
  }
}
