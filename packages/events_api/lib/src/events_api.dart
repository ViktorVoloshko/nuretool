import 'models/models.dart';

abstract interface class EventsApi {
  const EventsApi();

  Future<({List<Event> events, List<Subject> subjects, List<Type> types})>
  fetchEventsForGroup(int groupID, int fromTimestamp, int toTimestamp);

  Future<({List<Event> events, List<Subject> subjects, List<Type> types})>
  fetchEventsForTeacher(int teacherID, int fromTimestamp, int toTimestamp);
}

class EventsRequestFailure implements Exception {}
