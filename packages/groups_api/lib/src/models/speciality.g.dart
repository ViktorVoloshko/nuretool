// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speciality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Speciality _$SpecialityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Speciality', json, ($checkedConvert) {
      final val = Speciality(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        shortName: $checkedConvert('short_name', (v) => v as String),
        groups: $checkedConvert(
          'groups',
          (v) =>
              (v as List<dynamic>)
                  .map((e) => Group.fromJson(e as Map<String, dynamic>))
                  .toList(),
        ),
      );
      return val;
    }, fieldKeyMap: const {'shortName': 'short_name'});

Map<String, dynamic> _$SpecialityToJson(Speciality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'short_name': instance.shortName,
      'groups': instance.groups,
    };
