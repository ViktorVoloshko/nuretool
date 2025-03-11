// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Subject _$SubjectFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Subject', json, ($checkedConvert) {
      final val = Subject(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        title: $checkedConvert('title', (v) => v as String),
        brief: $checkedConvert('brief', (v) => v as String),
        hours: $checkedConvert(
          'hours',
          (v) =>
              (v as List<dynamic>)
                  .map((e) => Hours.fromJson(e as Map<String, dynamic>))
                  .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'brief': instance.brief,
  'hours': instance.hours,
};

Hours _$HoursFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Hours', json, ($checkedConvert) {
      final val = Hours(
        type: $checkedConvert('type', (v) => (v as num).toInt()),
        val: $checkedConvert('val', (v) => (v as num).toInt()),
        teachers: $checkedConvert(
          'teachers',
          (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$HoursToJson(Hours instance) => <String, dynamic>{
  'type': instance.type,
  'val': instance.val,
  'teachers': instance.teachers,
};
