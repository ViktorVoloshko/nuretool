// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Event _$EventFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Event',
  json,
  ($checkedConvert) {
    final val = Event(
      subjectId: $checkedConvert('subject_id', (v) => (v as num).toInt()),
      startTime: $checkedConvert('start_time', (v) => (v as num).toInt()),
      endTime: $checkedConvert('end_time', (v) => (v as num).toInt()),
      type: $checkedConvert('type', (v) => (v as num).toInt()),
      numberPair: $checkedConvert('number_pair', (v) => (v as num).toInt()),
      auditory: $checkedConvert('auditory', (v) => v as String),
      teachers: $checkedConvert(
        'teachers',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      groups: $checkedConvert(
        'groups',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'subjectId': 'subject_id',
    'startTime': 'start_time',
    'endTime': 'end_time',
    'numberPair': 'number_pair',
  },
);

Map<String, dynamic> _$EventToJson(Event instance) => <String, dynamic>{
  'subject_id': instance.subjectId,
  'start_time': instance.startTime,
  'end_time': instance.endTime,
  'type': instance.type,
  'number_pair': instance.numberPair,
  'auditory': instance.auditory,
  'teachers': instance.teachers,
  'groups': instance.groups,
};
