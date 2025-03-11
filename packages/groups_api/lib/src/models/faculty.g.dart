// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faculty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faculty _$FacultyFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Faculty', json, ($checkedConvert) {
      final val = Faculty(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        shortName: $checkedConvert('short_name', (v) => v as String),
        directions: $checkedConvert(
          'directions',
          (v) =>
              (v as List<dynamic>)
                  .map((e) => Direction.fromJson(e as Map<String, dynamic>))
                  .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'shortName': 'short_name'});

Map<String, dynamic> _$FacultyToJson(Faculty instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'short_name': instance.shortName,
  'directions': instance.directions,
};
