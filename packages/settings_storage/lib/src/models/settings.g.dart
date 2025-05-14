// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Settings _$SettingsFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Settings',
  json,
  ($checkedConvert) {
    final val = Settings(
      theme: $checkedConvert(
        'theme',
        (v) => $enumDecodeNullable(_$AppThemeEnumMap, v) ?? AppTheme.system,
      ),
      userGroupID: $checkedConvert(
        'user_group_id',
        (v) => (v as num?)?.toInt(),
      ),
      savedGroupsIDs: $checkedConvert(
        'saved_groups_ids',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      savedTeachersIDs: $checkedConvert(
        'saved_teachers_ids',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
      savedRoomsIDs: $checkedConvert(
        'saved_rooms_ids',
        (v) => (v as List<dynamic>).map((e) => (e as num).toInt()).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'userGroupID': 'user_group_id',
    'savedGroupsIDs': 'saved_groups_ids',
    'savedTeachersIDs': 'saved_teachers_ids',
    'savedRoomsIDs': 'saved_rooms_ids',
  },
);

Map<String, dynamic> _$SettingsToJson(Settings instance) => <String, dynamic>{
  'theme': _$AppThemeEnumMap[instance.theme]!,
  'user_group_id': instance.userGroupID,
  'saved_groups_ids': instance.savedGroupsIDs,
  'saved_teachers_ids': instance.savedTeachersIDs,
  'saved_rooms_ids': instance.savedRoomsIDs,
};

const _$AppThemeEnumMap = {
  AppTheme.system: 'system',
  AppTheme.light: 'light',
  AppTheme.dark: 'dark',
};
