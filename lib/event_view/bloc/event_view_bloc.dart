import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../calendar_view/calendar_view.dart';

part 'event_view_event.dart';
part 'event_view_state.dart';

class EventViewBloc extends Bloc<EventViewEvent, EventViewState> {
  EventViewBloc() : super(EventViewState(eventData: null)) {
    on<EventViewOpened>(_onOpened);
  }

  void _onOpened(EventViewOpened event, Emitter<EventViewState> emit) =>
      emit(EventViewState(eventData: event.eventData));
}
