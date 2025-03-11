import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:groups_api/groups_api.dart';
import 'package:win1251/win1251.dart';

/// API client class for `cist.nure.ua`.
class CistApi implements GroupsApi {
  CistApi({required Dio dio}) : _dio = dio;

  final Dio _dio;
  static const _mirror = 'cist.nure.ua';

  @override
  Future<List<Faculty>> fetchGroups() async {
    final response = await _dio.getUri(
      Uri.https(_mirror, '/ias/app/tt/P_API_GROUP_JSON'),
    );

    final jsonString = response.data.toString().from1251();
    final json = jsonDecode(jsonString);

    final List<Faculty> result = [];
    for (final faculty in json['university']['faculties']) {
      result.add(Faculty.fromJson(faculty));
    }

    return result;
  }
}
