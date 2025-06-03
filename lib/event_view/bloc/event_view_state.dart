part of 'event_view_bloc.dart';

final class EventViewState extends Equatable {
  const EventViewState({required this.eventData});

  final EventData? eventData;

  @override
  List<Object?> get props => [eventData];
}
