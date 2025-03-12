// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Department',
  json,
  ($checkedConvert) {
    final val = Department(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      fullName: $checkedConvert('full_name', (v) => v as String),
      shortName: $checkedConvert('short_name', (v) => v as String),
      departments: $checkedConvert(
        'departments',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Department.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
      teachers: $checkedConvert(
        'teachers',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Teacher.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      ),
    );
    return val;
  },
  fieldKeyMap: const {'fullName': 'full_name', 'shortName': 'short_name'},
);

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'short_name': instance.shortName,
      'departments': instance.departments,
      'teachers': instance.teachers,
    };
