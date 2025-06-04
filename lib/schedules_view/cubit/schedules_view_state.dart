part of 'schedules_view_cubit.dart';

typedef ScheduleInfo = ({ScheduleData schedule, String name});

final class SchedulesViewState extends Equatable {
  const SchedulesViewState({
    required this.schedules,
    required this.userGroupID,
    required this.updateStatus,
    this.selectedSchedule,
    this.scheduleSelected = false,
  });

  final List<ScheduleInfo> schedules;
  final int? userGroupID;
  final (bool, ScheduleData?) updateStatus;
  final ScheduleData? selectedSchedule;
  final bool scheduleSelected;

  SchedulesViewState copyWith({
    List<ScheduleInfo>? schedules,
    int? userGroupID,
    (bool, ScheduleData?)? updateStatus,
    ScheduleData? selectedSchedule,
    bool? scheduleSelected,
  }) => SchedulesViewState(
    schedules: schedules ?? this.schedules,
    userGroupID: userGroupID ?? this.userGroupID,
    updateStatus: updateStatus ?? this.updateStatus,
    selectedSchedule: selectedSchedule ?? this.selectedSchedule,
    scheduleSelected: scheduleSelected ?? this.scheduleSelected,
  );

  @override
  List<Object?> get props => [
    schedules,
    userGroupID,
    updateStatus,
    selectedSchedule,
    scheduleSelected,
  ];
}
