part of 'entity_selection_cubit.dart';

final class EntitySelectionState extends Equatable {
  const EntitySelectionState({
    this.groups = const [],
    this.teachers = const [],
    this.rooms = const [],
    this.searchFilter = '',
    this.initialTab = EntitySelectionTab.groups,
    this.userGroupSelection = false,
  });

  final List<Group> groups;
  final List<Teacher> teachers;
  final List<Room> rooms;
  final String searchFilter;

  final EntitySelectionTab initialTab;
  final bool userGroupSelection;

  List<Group> get filteredGroups =>
      groups.where((group) => group.name.contains(searchFilter)).toList();
  List<Teacher> get filteredTeachers =>
      teachers.where((teacher) => teacher.name.contains(searchFilter)).toList();
  List<Room> get filteredRooms =>
      rooms.where((room) => room.name.contains(searchFilter)).toList();

  EntitySelectionState copyWith({
    List<Group>? groups,
    List<Teacher>? teachers,
    List<Room>? rooms,
    String? searchFilter,
  }) => EntitySelectionState(
    groups: groups ?? this.groups,
    teachers: teachers ?? this.teachers,
    rooms: rooms ?? this.rooms,
    searchFilter: searchFilter ?? this.searchFilter,
    initialTab: initialTab,
    userGroupSelection: userGroupSelection,
  );

  @override
  List<Object> get props => [
    groups,
    teachers,
    rooms,
    searchFilter,
    initialTab,
    userGroupSelection,
  ];
}

enum EntitySelectionTab { groups, teachers, rooms }
