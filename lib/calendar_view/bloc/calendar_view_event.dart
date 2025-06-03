part of 'calendar_view_bloc.dart';

sealed class CalendarViewEvent extends Equatable {
  const CalendarViewEvent();

  @override
  List<Object> get props => [];
}

final class CalendarViewSubscriptionRequested extends CalendarViewEvent {
  const CalendarViewSubscriptionRequested();
}
