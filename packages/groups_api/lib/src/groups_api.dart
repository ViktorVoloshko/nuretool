import 'models/models.dart';

abstract interface class GroupsApi {
  const GroupsApi();

  /// Returns [List] of [Faculty] which, recursively, contains all groups.
  Future<List<Faculty>> fetchGroups();
}
