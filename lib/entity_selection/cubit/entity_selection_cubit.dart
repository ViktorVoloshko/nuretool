import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

part 'entity_selection_state.dart';

class EntitySelectionCubit extends Cubit<EntitySelectionState> {
  EntitySelectionCubit({
    required UniversityRepository universityRepository,
    EntitySelectionTab initialTab = EntitySelectionTab.groups,
    bool userGroupSelection = false,
  }) : _universityRepository = universityRepository,
       super(
         EntitySelectionState(
           initialTab: initialTab,
           userGroupSelection: userGroupSelection,
         ),
       );

  final UniversityRepository _universityRepository;

  late final StreamSubscription<List<Group>> _groupsSubscription;
  late final StreamSubscription<List<Teacher>> _teachersSubscription;
  late final StreamSubscription<List<Room>> _roomsSubscription;

  void requestSubscription() {
    _groupsSubscription = _universityRepository.groups.listen(
      (groups) => emit(state.copyWith(groups: groups)),
    );

    _teachersSubscription = _universityRepository.teachers.listen(
      (teachers) => emit(state.copyWith(teachers: teachers)),
    );

    _roomsSubscription = _universityRepository.rooms.listen(
      (rooms) => emit(state.copyWith(rooms: rooms)),
    );
  }

  void setSearchValue(String searchValue) =>
      emit(state.copyWith(searchFilter: searchValue));

  void addSchedule(ScheduleData schedule) =>
      _universityRepository.addSchedule(schedule);

  void setUserGroup(int groupID) =>
      _universityRepository.setUserGroupID(groupID);

  @override
  Future<void> close() {
    Future.wait([
      _groupsSubscription.cancel(),
      _teachersSubscription.cancel(),
      _roomsSubscription.cancel(),
    ]);
    return super.close();
  }
}
