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
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            [],
      ),
      teacherIDs: $checkedConvert(
        'saved_teachers_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            [],
      ),
      roomIDs: $checkedConvert(
        'saved_rooms_ids',
        (v) =>
            (v as List<dynamic>?)?.map((e) => (e as num).toInt()).toList() ??
            [],
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
      'saved_groups_ids': instance.groupIDs,
      'saved_teachers_ids': instance.teacherIDs,
      'saved_rooms_ids': instance.roomIDs,
    };
