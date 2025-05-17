// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_selection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleSelection _$ScheduleSelectionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ScheduleSelection', json, ($checkedConvert) {
      final val = ScheduleSelection(
        id: $checkedConvert('id', (v) => (v as num).toInt()),
        type: $checkedConvert(
          'type',
          (v) => $enumDecode(_$ScheduleSelectionTypeEnumMap, v),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ScheduleSelectionToJson(ScheduleSelection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$ScheduleSelectionTypeEnumMap[instance.type]!,
    };

const _$ScheduleSelectionTypeEnumMap = {
  ScheduleSelectionType.group: 'group',
  ScheduleSelectionType.teacher: 'teacher',
  ScheduleSelectionType.room: 'room',
};
