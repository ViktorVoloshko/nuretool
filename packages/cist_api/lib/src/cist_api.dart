import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:events_api/events_api.dart';
import 'package:groups_api/groups_api.dart';
import 'package:enough_convert/enough_convert.dart';

/// API client class for `cist.nure.ua`.
class CistApi implements GroupsApi, EventsApi {
  CistApi({required Dio dio}) : _dio = dio;

  final Dio _dio;

  final Windows1251Decoder _decoder = const Windows1251Decoder();
  static const _domain = 'cist.nure.ua';

  @override
  Future<List<Faculty>> fetchGroups() async {
    final response = await _dio.getUri(
      Uri.https(_domain, '/ias/app/tt/P_API_GROUP_JSON'),
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.statusCode != HttpStatus.ok) throw GroupsRequestFailure();

    final Map<String, dynamic> json;
    try {
      final jsonString = _decoder.convert(response.data);
      json = jsonDecode(jsonString);
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
    final response = await _dio.getUri(
      Uri.https(_domain, '/ias/app/tt/P_API_EVEN_JSON', {
        'type_id': ['1'],
        'timetable_id': [groupID.toString()],
        'time_from': [fromTimestamp.toString()],
        'time_to': [toTimestamp.toString()],
        'idClient': ['KNURESked'],
      }),
      options: Options(responseType: ResponseType.bytes),
    );
    if (response.statusCode != HttpStatus.ok) throw EventsRequestFailure();

    final Map<String, dynamic> json;
    try {
      final jsonString = _decoder.convert(response.data);
      json = jsonDecode(jsonString);
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
