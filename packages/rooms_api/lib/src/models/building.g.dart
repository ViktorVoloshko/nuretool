// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Building _$BuildingFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Building',
  json,
  ($checkedConvert) {
    final val = Building(
      id: $checkedConvert('id', (v) => v as String),
      shortName: $checkedConvert('short_name', (v) => v as String),
      fullName: $checkedConvert('full_name', (v) => v as String),
      auditories: $checkedConvert(
        'auditories',
        (v) =>
            (v as List<dynamic>)
                .map((e) => Room.fromJson(e as Map<String, dynamic>))
                .toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'shortName': 'short_name', 'fullName': 'full_name'},
);

Map<String, dynamic> _$BuildingToJson(Building instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'short_name': instance.shortName,
  'auditories': instance.auditories,
};
