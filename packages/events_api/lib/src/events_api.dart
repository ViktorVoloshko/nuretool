import 'models/models.dart';

abstract interface class EventsApi {
  const EventsApi();

  /// Fetches and returns [List]s of [Event]s, [Subject]s and [Type]s for
  /// specified [groupID] for specified period of time.
  ///
  /// [fromTimestamp] and [toTimestamp] must be valid Unix timestamps.
  Future<({List<Event> events, List<Subject> subjects, List<Type> types})>
  fetchEventsForGroup(int groupID, int fromTimestamp, int toTimestamp);

  /// Fetches and returns [List]s of [Event]s, [Subject]s and [Type]s for
  /// specified [teacherID] for specified period of time.
  ///
  /// [fromTimestamp] and [toTimestamp] must be valid Unix timestamps.
  Future<({List<Event> events, List<Subject> subjects, List<Type> types})>
  fetchEventsForTeacher(int teacherID, int fromTimestamp, int toTimestamp);
}

/// Used to notify about failure during request or decoding the response.
class EventsRequestFailure implements Exception {}
