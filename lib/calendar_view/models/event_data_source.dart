import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:university_repository/university_repository.dart';

import 'models.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<EventData> events) {
    appointments = events;
  }

  @override
  String getSubject(int index) {
    final eventData = (appointments! as List<EventData>)[index];
    return '${eventData.subject.shortTitle} ${eventData.room?.name}';
  }

  @override
  DateTime getStartTime(int index) =>
      (appointments! as List<EventData>)[index].event.startTime;

  @override
  DateTime getEndTime(int index) =>
      (appointments! as List<EventData>)[index].event.endTime;

  @override
  String? getStartTimeZone(int index) => 'FLE Standard Time';

  @override
  String? getEndTimeZone(int index) => 'FLE Standard Time';

  @override
  Color getColor(int index) => switch ((appointments! as List<EventData>)[index]
      .event
      .baseType) {
    EventBaseType.lecture => Colors.amber,
    EventBaseType.practice => Colors.lightGreen,
    EventBaseType.laboratory => Colors.purple,
    EventBaseType.consultation => Colors.blueGrey,
    EventBaseType.test => Colors.blue,
    EventBaseType.exam => Colors.red,
    EventBaseType.project => Colors.pinkAccent,
  };
}
