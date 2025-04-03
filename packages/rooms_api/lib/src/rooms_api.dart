import 'models/models.dart';

abstract interface class RoomsApi {
  const RoomsApi();

  /// Fetches all rooms. Returns `List<Building>` that recursively contains
  /// all rooms.
  Future<List<Building>> fetchRooms();
}

class RoomsRequestFailure implements Exception {}

class RoomsNotFoundFailure implements Exception {}
