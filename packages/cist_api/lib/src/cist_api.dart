import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:events_api/events_api.dart';
import 'package:groups_api/groups_api.dart';
import 'package:enough_convert/enough_convert.dart';

/// API client  for `cist.nure.ua`.
///
/// It's API described in groups_api, teachers_api and events_api docs.
class CistApi implements GroupsApi, EventsApi {
  CistApi({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              responseType: ResponseType.plain,
              responseDecoder:
                  (responseBytes, _, _) =>
                      const Windows1251Decoder().convert(responseBytes),
            ),
          );

  final Dio _dio;
  static const _domain = 'cist.nure.ua';

  @override
  Future<List<Faculty>> fetchGroups() async {
    final response = await _dio.getUri<String>(
      Uri.https(_domain, '/ias/app/tt/P_API_GROUP_JSON'),
    );
    if (response.statusCode != HttpStatus.ok) throw GroupsRequestFailure();

    final Map<String, dynamic> json;
    try {
      json = jsonDecode(response.data!) as Map<String, dynamic>;
    } catch (_) {
      throw GroupsRequestFailure();
    }

    final List<Faculty> result = [];
    for (final facultyJson in json['university']['faculties']) {
      result.add(Faculty.fromJson(facultyJson));
    }
    if (result.isEmpty) throw GroupsNotFoundFailure();

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
  fetchEventsForTeacher(int teacherID, int fromTimestamp, int toTimestamp) {
    // TODO: implement fetchEventsForTeacher
    throw UnimplementedError();
  }
}
