// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'direction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Direction _$DirectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Direction', json, ($checkedConvert) {
      final val = Direction(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        name: $checkedConvert('name', (v) => v as String),
        shortName: $checkedConvert('short_name', (v) => v as String),
        specialities: $checkedConvert(
          'specialities',
          (v) =>
              (v as List<dynamic>)
                  .map((e) => Speciality.fromJson(e as Map<String, dynamic>))
                  .toList(),
        ),
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

Map<String, dynamic> _$DirectionToJson(Direction instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'short_name': instance.shortName,
  'specialities': instance.specialities,
  'groups': instance.groups,
};
