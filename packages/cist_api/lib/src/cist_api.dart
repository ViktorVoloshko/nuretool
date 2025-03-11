import 'package:dio/dio.dart';
import 'package:groups_api/groups_api.dart';
import 'package:rxdart/subjects.dart';

/// API client class for `cist.nure.ua`.
class CistApi implements GroupsApi {
  CistApi({required Dio dio}) : _dio = dio;

  final Dio _dio;

  late final _groupStreamController = BehaviorSubject<List<Faculty>>.seeded(
    const [],
  );

  Stream<List<Faculty>> get groups =>
      _groupStreamController.asBroadcastStream();
}
