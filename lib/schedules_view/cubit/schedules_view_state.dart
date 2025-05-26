part of 'schedules_view_cubit.dart';

final class SchedulesViewState extends Equatable {
  const SchedulesViewState({
    required this.groupSchedules,
    required this.teacherSchedules,
    required this.roomSchedules,
    required this.userGroupID,
  });

  final List<Group> groupSchedules;
  final List<Teacher> teacherSchedules;
  final List<Room> roomSchedules;

  final int? userGroupID;

  SchedulesViewState copyWith({
    List<Group>? groupSchedules,
    List<Teacher>? teacherSchedules,
    List<Room>? roomSchedules,
    int? userGroupID,
  }) => SchedulesViewState(
    groupSchedules: groupSchedules ?? this.groupSchedules,
    teacherSchedules: teacherSchedules ?? this.teacherSchedules,
    roomSchedules: roomSchedules ?? this.roomSchedules,
    userGroupID: userGroupID ?? this.userGroupID,
  );

  @override
  List<Object?> get props => [
    groupSchedules,
    teacherSchedules,
    roomSchedules,
    userGroupID,
  ];
}
