import 'models/models.dart';

class GroupsRequestFailure implements Exception {}

class GroupsNotFoundFailure implements Exception {}

abstract interface class GroupsApi {
  const GroupsApi();

  /// Returns [List] of [Faculty] which, recursively, contains all groups.
  Future<List<Faculty>> fetchGroups();
}
