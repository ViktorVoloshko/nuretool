import 'models/models.dart';

abstract interface class TeachersApi {
  const TeachersApi();

  /// Returns [List] of [Faculty] which, recursively, contains all [Teacher]s.
  Future<List<Faculty>> fetchTeachers();
}

/// Used to notify about failure during requesting or decoding requested data.
class TeachersRequestFailure implements Exception {}

/// Used to notify about API not returning any teachers after response is
/// processed.
///
/// Since that is practically impossible, it is safe to assume that
/// something went wrong but no problem was detected (no other exception was
/// thrown) until after response was deserialized successfully.
class TeachersNotFoundFailure implements Exception {}
