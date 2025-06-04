part of 'more_view_cubit.dart';

final class MoreViewState extends Equatable {
  const MoreViewState({
    required this.appTheme,
    this.userGroup,
    required this.calendarMode,
  });

  final AppTheme appTheme;
  final Group? userGroup;
  final CalendarMode calendarMode;

  MoreViewState copyWith({
    AppTheme? appTheme,
    Group? userGroup,
    CalendarMode? calendarMode,
  }) => MoreViewState(
    appTheme: appTheme ?? this.appTheme,
    userGroup: userGroup ?? this.userGroup,
    calendarMode: calendarMode ?? this.calendarMode,
  );

  @override
  List<Object?> get props => [appTheme, userGroup, calendarMode];
}
