// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Type _$TypeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Type',
  json,
  ($checkedConvert) {
    final val = Type(
      id: $checkedConvert('id', (v) => (v as num).toInt()),
      fullName: $checkedConvert('full_name', (v) => v as String),
      shortName: $checkedConvert('short_name', (v) => v as String),
      idBase: $checkedConvert('id_base', (v) => (v as num).toInt()),
      type: $checkedConvert('type', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'fullName': 'full_name',
    'shortName': 'short_name',
    'idBase': 'id_base',
  },
);

Map<String, dynamic> _$TypeToJson(Type instance) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'short_name': instance.shortName,
  'id_base': instance.idBase,
  'type': instance.type,
};
