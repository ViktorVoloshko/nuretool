part of 'calendar_view_bloc.dart';

sealed class CalendarViewEvent extends Equatable {
  const CalendarViewEvent();

  @override
  List<Object> get props => [];
}

final class CalendarViewSubscriptionRequested extends CalendarViewEvent {
  const CalendarViewSubscriptionRequested();
}

final class CalendarViewUpdateRequested extends CalendarViewEvent {
  const CalendarViewUpdateRequested({required this.schedule});

  final ScheduleData schedule;

  @override
  List<Object> get props => [schedule];
}
