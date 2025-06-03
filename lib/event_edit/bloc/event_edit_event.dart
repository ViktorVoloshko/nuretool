part of 'event_edit_bloc.dart';

sealed class EventEditEvent extends Equatable {
  const EventEditEvent();

  @override
  List<Object?> get props => [];
}

final class EventEditOpened extends EventEditEvent {
  const EventEditOpened({
    this.initialEvent,
    required this.schedule,
    required this.availableSubjects,
  });

  final Event? initialEvent;
  final ScheduleData schedule;
  final List<Subject> availableSubjects;

  @override
  List<Object?> get props => [initialEvent, schedule, availableSubjects];
}

final class EventEditDataChanged extends EventEditEvent {
  const EventEditDataChanged({
    this.subjectID,
    this.startTime,
    this.endTime,
    this.type,
  });

  final int? subjectID;
  final DateTime? startTime;
  final DateTime? endTime;
  final EventBaseType? type;

  @override
  List<Object?> get props => [subjectID, startTime, endTime, type];
}

final class EventEditDeleted extends EventEditEvent {
  const EventEditDeleted();
}

final class EventEditConfirmed extends EventEditEvent {
  const EventEditConfirmed();
}
