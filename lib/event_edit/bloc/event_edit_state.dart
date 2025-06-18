part of 'event_edit_bloc.dart';

final class EventEditState extends Equatable {
  const EventEditState({
    this.status = EventEditStatus.initial,
    this.eventID,
    this.subjectID,
    this.type,
    this.startTime,
    this.endTime,
    this.error,
    this.availableSubjects = const [],
    this.schedule,
  });

  final EventEditStatus status;
  final int? eventID;

  final int? subjectID;
  final EventBaseType? type;
  final DateTime? startTime;
  final DateTime? endTime;
  final EventEditError? error;

  final List<Subject> availableSubjects;
  final ScheduleData? schedule;

  EventEditState copyWith({
    EventEditStatus? status,
    int? eventID,
    int? subjectID,
    EventBaseType? type,
    DateTime? startTime,
    DateTime? endTime,
    EventEditError? error,
    List<Subject>? availableSubjects,
    ScheduleData? schedule,
  }) => EventEditState(
    status: status ?? this.status,
    eventID: eventID ?? this.eventID,
    subjectID: subjectID ?? this.subjectID,
    type: type ?? this.type,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    error: error ?? this.error,
    availableSubjects: availableSubjects ?? this.availableSubjects,
    schedule: schedule ?? this.schedule,
  );

  @override
  List<Object?> get props => [
    status,
    eventID,
    subjectID,
    type,
    startTime,
    endTime,
    error,
    availableSubjects,
    schedule,
  ];
}

enum EventEditStatus { initial, ready, saved }

enum EventEditError { noSubject, noDateTime, dateTimeStartAfterEnd, noType }
