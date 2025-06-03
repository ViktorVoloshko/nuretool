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
    final sb = StringBuffer();
    sb.write(eventData.subject.shortTitle);
    if (eventData.room != null) {
      sb.writeAll([' ', eventData.room!.name]);
    }
    if (eventData.event.type != null) {
      sb.writeAll([' ', eventData.event.type!.shortName]);
    }

    return sb.toString();
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
    EventBaseType.lecture => Colors.amber.shade900,
    EventBaseType.practice => Colors.lightGreen.shade900,
    EventBaseType.laboratory => Colors.purple.shade900,
    EventBaseType.consultation => Colors.blueGrey.shade900,
    EventBaseType.test => Colors.blue.shade900,
    EventBaseType.exam => Colors.red.shade900,
    EventBaseType.project => Colors.pink.shade900,
  };
}
