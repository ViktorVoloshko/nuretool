import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:groups_api/groups_api.dart';
import 'package:win1251/win1251.dart';

/// API client class for `cist.nure.ua`.
class CistApi implements GroupsApi {
  CistApi({required Dio dio}) : _dio = dio;

  final Dio _dio;
  static const _domain = 'cist.nure.ua';

  @override
  Future<List<Faculty>> fetchGroups() async {
    final response = await _dio.getUri(
      Uri.https(_domain, '/ias/app/tt/P_API_GROUP_JSON'),
    );
    if (response.statusCode != HttpStatus.ok) throw GroupsRequestFailure();

    final Map<String, dynamic> json;
    try {
      final jsonString = response.data.toString().from1251();
      json = jsonDecode(jsonString);
    } catch (_) {
      throw GroupsRequestFailure();
    }

    final List<Faculty> result = [];
    for (final faculty in json['university']['faculties']) {
      result.add(Faculty.fromJson(faculty));
    }
    if (result.isEmpty) throw GroupsNotFoundFailure();

    return result;
  }
}
