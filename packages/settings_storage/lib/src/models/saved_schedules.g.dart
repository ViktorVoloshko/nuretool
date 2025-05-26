// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedSchedules _$SavedSchedulesFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'SavedSchedules',
  json,
  ($checkedConvert) {
    final val = SavedSchedules(
      groupIDs: $checkedConvert(
        'saved_groups_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toSet() ?? {},
      ),
      teacherIDs: $checkedConvert(
        'saved_teachers_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toSet() ?? {},
      ),
      roomIDs: $checkedConvert(
        'saved_rooms_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toSet() ?? {},
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'groupIDs': 'saved_groups_ids',
    'teacherIDs': 'saved_teachers_ids',
    'roomIDs': 'saved_rooms_ids',
  },
);

Map<String, dynamic> _$SavedSchedulesToJson(SavedSchedules instance) =>
    <String, dynamic>{
      'saved_groups_ids': instance.groupIDs.toList(),
      'saved_teachers_ids': instance.teacherIDs.toList(),
      'saved_rooms_ids': instance.roomIDs.toList(),
    };
