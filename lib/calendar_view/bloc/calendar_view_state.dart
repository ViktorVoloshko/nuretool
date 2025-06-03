part of 'calendar_view_bloc.dart';

sealed class CalendarViewState extends Equatable {
  const CalendarViewState();

  @override
  List<Object?> get props => [];
}

final class CalendarViewInitial extends CalendarViewState {
  const CalendarViewInitial();
}

final class CalendarViewFailure extends CalendarViewState {
  const CalendarViewFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class CalendarViewSuccess extends CalendarViewState {
  const CalendarViewSuccess({required this.events, required this.schedule});

  final List<EventData> events;
  final ScheduleData? schedule;

  @override
  List<Object?> get props => [events, schedule];
}
