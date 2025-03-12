// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Teacher _$TeacherFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Teacher',
  json,
  ($checkedConvert) {
    final val = Teacher(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      fullName: $checkedConvert('full_name', (v) => v as String),
      shortName: $checkedConvert('short_name', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {'fullName': 'full_name', 'shortName': 'short_name'},
);

Map<String, dynamic> _$TeacherToJson(Teacher instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'short_name': instance.shortName,
};
