part of 'schedules_view_cubit.dart';

typedef ScheduleInfo = ({ScheduleData schedule, String name});

final class SchedulesViewState extends Equatable {
  const SchedulesViewState({
    required this.schedules,
    required this.userGroupID,
    required this.updateStatus,
  });

  final List<ScheduleInfo> schedules;
  final int? userGroupID;
  final (bool, ScheduleData?) updateStatus;

  SchedulesViewState copyWith({
    List<ScheduleInfo>? schedules,
    int? userGroupID,
    required (bool, ScheduleData?) updateStatus,
  }) => SchedulesViewState(
    schedules: schedules ?? this.schedules,
    userGroupID: userGroupID ?? this.userGroupID,
    updateStatus: updateStatus,
  );

  @override
  List<Object?> get props => [schedules, userGroupID, updateStatus];
}
