part of 'schedules_view_cubit.dart';

typedef ScheduleInfo = ({ScheduleData schedule, String name});

final class SchedulesViewState extends Equatable {
  const SchedulesViewState({
    required this.schedules,
    required this.userGroupID,
    required this.updating,
  });

  final List<ScheduleInfo> schedules;
  final int? userGroupID;
  final ScheduleData? updating;

  SchedulesViewState copyWith({
    List<ScheduleInfo>? schedules,
    int? userGroupID,
    required ScheduleData? updating,
  }) => SchedulesViewState(
    schedules: schedules ?? this.schedules,
    userGroupID: userGroupID ?? this.userGroupID,
    updating: updating,
  );

  @override
  List<Object?> get props => [schedules, userGroupID, updating];
}
