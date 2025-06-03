import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

part 'event_edit_event.dart';
part 'event_edit_state.dart';

class EventEditBloc extends Bloc<EventEditEvent, EventEditState> {
  EventEditBloc({required UniversityRepository universityRepository})
    : _universityRepository = universityRepository,
      super(EventEditState()) {
    on<EventEditOpened>(_onOpened);
    on<EventEditDataChanged>(_onDataChanged);
    on<EventEditDeleted>(_onDeleted);
    on<EventEditConfirmed>(_onConfirmed);
  }

  final UniversityRepository _universityRepository;

  void _onOpened(EventEditOpened event, Emitter<EventEditState> emit) => emit(
    EventEditState(
      status: EventEditStatus.ready,
      eventID: event.initialEvent?.id,
      subjectID: event.initialEvent?.subject,
      startTime: event.initialEvent?.startTime ?? DateTime.now(),
      endTime:
          event.initialEvent?.endTime ??
          DateTime.now().add(const Duration(minutes: 95)),
      type: event.initialEvent?.baseType,
      schedule: event.schedule,
      availableSubjects: event.availableSubjects,
    ),
  );

  void _onDataChanged(
    EventEditDataChanged event,
    Emitter<EventEditState> emit,
  ) => emit(
    state.copyWith(
      subjectID: event.subjectID,
      startTime: event.startTime,
      endTime: event.endTime,
      type: event.type,
    ),
  );

  void _onDeleted(EventEditDeleted event, Emitter<EventEditState> emit) {
    _universityRepository.deleteEvent(state.eventID!);
    emit(state.copyWith(status: EventEditStatus.saved));
  }

  void _onConfirmed(EventEditConfirmed event, Emitter<EventEditState> emit) {
    final error = _validate(state);
    if (error != null) {
      emit(state.copyWith(error: error));
    } else {
      _universityRepository.saveEvent(
        Event(
          id: state.eventID,
          subject: state.subjectID!,
          startTime: state.startTime!,
          endTime: state.endTime!,
          isFetched: false,
          baseType: state.type!,
          groups: [
            if (state.schedule!.type == ScheduleType.group) state.schedule!.id,
          ],
          teachers: [
            if (state.schedule!.type == ScheduleType.teacher)
              state.schedule!.id,
          ],
          room:
              state.schedule!.type == ScheduleType.room
                  ? state.schedule!.id
                  : null,
        ),
      );
      emit(state.copyWith(status: EventEditStatus.saved));
    }
  }

  EventEditError? _validate(EventEditState state) {
    if (state.subjectID == null) return EventEditError.noSubject;
    if (state.startTime == null || state.endTime == null) {
      return EventEditError.noDateTime;
    }
    if (state.type == null) return EventEditError.noType;
    return null;
  }
}
