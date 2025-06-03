import 'package:equatable/equatable.dart';
import 'package:university_repository/university_repository.dart';

class EventData extends Equatable {
  const EventData({
    required this.event,
    required this.subject,
    required this.room,
  });

  final Event event;
  final Subject subject;
  final Room? room;

  @override
  List<Object?> get props => [event, subject, room];
}
