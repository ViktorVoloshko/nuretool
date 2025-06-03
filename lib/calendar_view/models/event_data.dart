import 'package:equatable/equatable.dart';
import 'package:university_repository/university_repository.dart';

class EventData extends Equatable {
  const EventData({
    required this.event,
    required this.subject,
    required this.groups,
    required this.teachers,
    required this.room,
  });

  final Event event;
  final Subject subject;
  final List<Group> groups;
  final List<Teacher> teachers;
  final Room? room;

  @override
  List<Object?> get props => [event, subject, groups, teachers, room];
}
