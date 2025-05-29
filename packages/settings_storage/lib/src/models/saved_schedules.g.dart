// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_schedules.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SavedSchedules _$SavedSchedulesFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SavedSchedules', json, ($checkedConvert) {
      final val = SavedSchedules(
        schedules: $checkedConvert(
          'schedules',
          (v) =>
              (v as List<dynamic>?)
                  ?.map((e) => ScheduleData.fromJson(e as Map<String, dynamic>))
                  .toSet() ??
              {},
        ),
      );
      return val;
    });

Map<String, dynamic> _$SavedSchedulesToJson(SavedSchedules instance) =>
    <String, dynamic>{'schedules': instance.schedules.toList()};
