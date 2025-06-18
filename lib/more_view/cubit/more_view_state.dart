part of 'more_view_cubit.dart';

final class MoreViewState extends Equatable {
  const MoreViewState({
    required this.appTheme,
    this.userGroup,
    required this.calendarMode,
    required this.isUpdating,
  });

  final AppTheme appTheme;
  final Group? userGroup;
  final CalendarMode calendarMode;
  final bool isUpdating;

  MoreViewState copyWith({
    AppTheme? appTheme,
    Group? userGroup,
    CalendarMode? calendarMode,
    bool? isUpdating,
  }) => MoreViewState(
    appTheme: appTheme ?? this.appTheme,
    userGroup: userGroup ?? this.userGroup,
    calendarMode: calendarMode ?? this.calendarMode,
    isUpdating: isUpdating ?? this.isUpdating,
  );

  @override
  List<Object?> get props => [appTheme, userGroup, calendarMode, isUpdating];
}
