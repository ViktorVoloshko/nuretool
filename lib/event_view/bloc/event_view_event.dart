part of 'event_view_bloc.dart';

sealed class EventViewEvent extends Equatable {
  const EventViewEvent();

  @override
  List<Object> get props => [];
}

final class EventViewOpened extends EventViewEvent {
  const EventViewOpened({required this.eventData});

  final EventData eventData;

  @override
  List<Object> get props => [eventData];
}
