part of 'schedules_view_cubit.dart';

final class SchedulesViewState extends Equatable {
  const SchedulesViewState({
    required this.groupSchedules,
    required this.teacherSchedules,
    required this.roomSchedules,
  });

  final List<Group> groupSchedules;
  final List<Teacher> teacherSchedules;
  final List<Room> roomSchedules;

  @override
  List<Object> get props => [groupSchedules, teacherSchedules, roomSchedules];
}
