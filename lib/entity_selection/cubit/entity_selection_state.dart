part of 'entity_selection_cubit.dart';

final class EntitySelectionState extends Equatable {
  const EntitySelectionState({
    this.groups = const [],
    this.teachers = const [],
    this.rooms = const [],
    this.searchFilter = '',
  });

  final List<Group> groups;
  final List<Teacher> teachers;
  final List<Room> rooms;

  final String searchFilter;

  List<Group> get filteredGroups =>
      groups.where((group) => group.name.contains(searchFilter)).toList();
  List<Group> get filteredTeachers =>
      groups.where((teacher) => teacher.name.contains(searchFilter)).toList();
  List<Group> get filteredRooms =>
      groups.where((room) => room.name.contains(searchFilter)).toList();

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
  );

  @override
  List<Object> get props => [groups, teachers, rooms, searchFilter];
}
