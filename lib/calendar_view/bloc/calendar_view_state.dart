part of 'calendar_view_bloc.dart';

sealed class CalendarViewState extends Equatable {
  const CalendarViewState({this.calendarMode = CalendarMode.week});

  final CalendarMode calendarMode;

  CalendarViewState copyWith({CalendarMode? calendarMode});

  @override
  List<Object?> get props => [calendarMode];
}

final class CalendarViewInitial extends CalendarViewState {
  const CalendarViewInitial({super.calendarMode});

  @override
  CalendarViewState copyWith({CalendarMode? calendarMode}) =>
      CalendarViewInitial(calendarMode: calendarMode ?? this.calendarMode);
}

final class CalendarViewFailure extends CalendarViewState {
  const CalendarViewFailure({this.message, super.calendarMode});

  final String? message;

  @override
  CalendarViewState copyWith({String? message, CalendarMode? calendarMode}) =>
      CalendarViewFailure(
        message: message,
        calendarMode: calendarMode ?? this.calendarMode,
      );

  @override
  List<Object?> get props => [message];
}

final class CalendarViewSuccess extends CalendarViewState {
  const CalendarViewSuccess({
    required this.events,
    required this.schedule,
    this.scheduleName,
    super.calendarMode,
  });

  final List<EventData> events;
  final ScheduleData? schedule;
  final String? scheduleName;

  @override
  CalendarViewSuccess copyWith({
    List<EventData>? events,
    ScheduleData? schedule,
    String? scheduleName,
    CalendarMode? calendarMode,
  }) => CalendarViewSuccess(
    events: events ?? this.events,
    schedule: schedule ?? this.schedule,
    scheduleName: scheduleName ?? this.scheduleName,
    calendarMode: calendarMode ?? this.calendarMode,
  );

  @override
  List<Object?> get props => [events, schedule, scheduleName, calendarMode];
}
