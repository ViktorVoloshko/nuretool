import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:university_repository/university_repository.dart';

import '../models/models.dart';

part 'calendar_view_event.dart';
part 'calendar_view_state.dart';

class CalendarViewBloc extends Bloc<CalendarViewEvent, CalendarViewState> {
  CalendarViewBloc({required UniversityRepository universityRepository})
    : _universityRepository = universityRepository,
      super(CalendarViewInitial()) {
    on<CalendarViewSubscriptionRequested>(_onSubscriptionRequested);
  }

  final UniversityRepository _universityRepository;

  late final StreamSubscription _subjectsSubscription;
  late final StreamSubscription _roomsSubscription;

  List<Subject> _subjects = const [];
  List<Room> _rooms = const [];

  @override
  Future<void> close() async {
    await Future.wait([
      _subjectsSubscription.cancel(),
      _roomsSubscription.cancel(),
    ]);
    return super.close();
  }

  void _onSubscriptionRequested(
    CalendarViewSubscriptionRequested event,
    Emitter<CalendarViewState> emit,
  ) async {
    _subjectsSubscription = _universityRepository.subjects.listen(
      (subjects) => _subjects = subjects,
    );
    _roomsSubscription = _universityRepository.rooms.listen(
      (rooms) => _rooms = rooms,
    );

    await emit.forEach(
      _universityRepository.scheduleEvents,
      onData:
          (events) => CalendarViewSuccess(
            events:
                events
                    .map(
                      (e) => EventData(
                        event: e,
                        subject: _subjects.firstWhere(
                          (subject) => subject.id == e.subject,
                        ),
                        room: _rooms.firstWhereOrNull(
                          (room) => room.id == e.room,
                        ),
                      ),
                    )
                    .toList(),
          ),
      onError:
          (error, stackTrace) => CalendarViewFailure(message: error.toString()),
    );
  }
}
