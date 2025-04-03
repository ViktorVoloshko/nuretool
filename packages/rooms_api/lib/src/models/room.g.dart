// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Room _$RoomFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Room',
  json,
  ($checkedConvert) {
    final val = Room(
      id: $checkedConvert('id', (v) => Room._stringToInt(v as String)),
      shortName: $checkedConvert('short_name', (v) => v as String),
      floor: $checkedConvert('floor', (v) => v as String),
      isHavePower: $checkedConvert(
        'is_have_power',
        (v) => Room._stringToInt(v as String),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'shortName': 'short_name',
    'isHavePower': 'is_have_power',
  },
);

Map<String, dynamic> _$RoomToJson(Room instance) => <String, dynamic>{
  'id': instance.id,
  'short_name': instance.shortName,
  'floor': instance.floor,
  'is_have_power': instance.isHavePower,
};
