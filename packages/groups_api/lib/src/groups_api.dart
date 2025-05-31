import 'models/models.dart';

abstract interface class GroupsApi {
  const GroupsApi();

  /// Returns [List] of [Faculty] which, recursively, contains all [Group]s.
  Future<List<Faculty>> fetchGroups();
}

/// Used to notify about failure during requesting or decoding requested data.
class GroupsRequestFailure implements Exception {}

/// Used to notify about API not returning any groups after response is
/// processed.
///
/// Since that is practically impossible, it is safe to assume that
/// something went wrong but no problem was detected (no other exception was
/// thrown) until after response was deserialized successfully.
class GroupsNotFoundFailure implements Exception {}
