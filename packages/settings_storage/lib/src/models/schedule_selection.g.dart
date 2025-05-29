// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleData _$ScheduleDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ScheduleData', json, ($checkedConvert) {
      final val = ScheduleData(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$ScheduleTypeEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ScheduleDataToJson(ScheduleData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ScheduleTypeEnumMap[instance.type]!,
    };

const _$ScheduleTypeEnumMap = {
  ScheduleType.group: 'group',
  ScheduleType.teacher: 'teacher',
  ScheduleType.room: 'room',
};
