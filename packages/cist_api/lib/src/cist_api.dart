import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:events_api/events_api.dart';
import 'package:groups_api/groups_api.dart' as groups_api;
import 'package:teachers_api/teachers_api.dart' as teachers_api;
import 'package:enough_convert/enough_convert.dart';

/// API client  for `cist.nure.ua`.
///
/// It's API described in groups_api, teachers_api and events_api docs.
class CistApi
    implements groups_api.GroupsApi, teachers_api.TeachersApi, EventsApi {
  CistApi({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              connectTimeout: const Duration(seconds: 5),
              responseType: ResponseType.plain,
              responseDecoder:
                  (responseBytes, _, _) =>
                      const Windows1251Decoder().convert(responseBytes),
            ),
          );

  final Dio _dio;
  static const _domain = 'cist.nure.ua';

  @override
  Future<List<groups_api.Faculty>> fetchGroups() async {
    final response = await _dio.getUri<String>(
      Uri.https(_domain, '/ias/app/tt/P_API_GROUP_JSON'),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw groups_api.GroupsRequestFailure();
    }

    final Map<String, dynamic> json;
    try {
      json = jsonDecode(response.data!) as Map<String, dynamic>;
    } catch (_) {
      throw groups_api.GroupsRequestFailure();
    }

    final List<groups_api.Faculty> result = [];
    for (final facultyJson in json['university']['faculties']) {
      result.add(groups_api.Faculty.fromJson(facultyJson));
    }
    if (result.isEmpty) throw groups_api.GroupsNotFoundFailure();

    return result;
  }

  @override
  Future<List<teachers_api.Faculty>> fetchTeachers() async {
    final response = await _dio.getUri<String>(
      Uri.https(_domain, '/ias/app/tt/P_API_PODR_JSON'),
    );
    if (response.statusCode != HttpStatus.ok) {
      throw teachers_api.TeachersRequestFailure();
    }

    final Map<String, dynamic> json;
    try {
      json =
          jsonDecode(
                response.data!.replaceRange(
                  response.data!.length - 2,
                  null,
                  ']}}',
                ),
              )
              as Map<String, dynamic>;
    } catch (_) {
      throw teachers_api.TeachersRequestFailure();
    }

    final List<teachers_api.Faculty> result = [];
    for (final facultyJson in json['university']['faculties']) {
      result.add(teachers_api.Faculty.fromJson(facultyJson));
    }
    if (result.isEmpty) throw teachers_api.TeachersNotFoundFailure();

    return result;
  }

  @override
  Future<({List<Event> events, List<Subject> subjects, List<Type> types})>
  fetchEventsForGroup(int groupID, int fromTimestamp, int toTimestamp) async {
    final response = await _dio.getUri<String>(
      Uri.https(_domain, '/ias/app/tt/P_API_EVEN_JSON', {
        'type_id': const ['1'],
        'timetable_id': [groupID.toString()],
        'time_from': [fromTimestamp.toString()],
        'time_to': [toTimestamp.toString()],
        'idClient': const ['KNURESked'],
      }),
    );
    if (response.statusCode != HttpStatus.ok) throw EventsRequestFailure();

    final Map<String, dynamic> json;
    try {
      json = jsonDecode(response.data!) as Map<String, dynamic>;
    } catch (_) {
      throw EventsRequestFailure();
    }

    final List<Event> events = [];
    for (final eventJson in json['events']) {
      events.add(Event.fromJson(eventJson));
    }

    final List<Subject> subjects = [];
    for (final subjectJson in json['subjects']) {
      subjects.add(Subject.fromJson(subjectJson));
    }

    final List<Type> types = [];
    for (final typeJson in json['types']) {
      types.add(Type.fromJson(typeJson));
    }

    return (events: events, subjects: subjects, types: types);
  }

  @override
  Future<({List<Event> events, List<Subject> subjects, List<Type> types})>
  fetchEventsForTeacher(
    int teacherID,
    int fromTimestamp,
    int toTimestamp,
  ) async {
    final response = await _dio.getUri<String>(
      Uri.https(_domain, '/ias/app/tt/P_API_EVEN_JSON', {
        'type_id': const ['2'],
        'timetable_id': [teacherID.toString()],
        'time_from': [fromTimestamp.toString()],
        'time_to': [toTimestamp.toString()],
        'idClient': const ['KNURESked'],
      }),
    );
    if (response.statusCode != HttpStatus.ok) throw EventsRequestFailure();

    final Map<String, dynamic> json;
    try {
      json = jsonDecode(response.data!) as Map<String, dynamic>;
    } catch (_) {
      throw EventsRequestFailure();
    }

    final List<Event> events = [];
    for (final eventJson in json['events']) {
      events.add(Event.fromJson(eventJson));
    }

    final List<Subject> subjects = [];
    for (final subjectJson in json['subjects']) {
      subjects.add(Subject.fromJson(subjectJson));
    }

    final List<Type> types = [];
    for (final typeJson in json['types']) {
      types.add(Type.fromJson(typeJson));
    }

    return (events: events, subjects: subjects, types: types);
  }
}
