// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTheme _$AppThemeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppTheme', json, ($checkedConvert) {
      final val = AppTheme(
        themeMode: $checkedConvert(
          'theme_mode',
          (v) => $enumDecode(_$AppThemeModeEnumMap, v),
        ),
        color: $checkedConvert(
          'color',
          (v) => $enumDecode(_$AppThemeColorEnumMap, v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'themeMode': 'theme_mode'});

Map<String, dynamic> _$AppThemeToJson(AppTheme instance) => <String, dynamic>{
  'theme_mode': _$AppThemeModeEnumMap[instance.themeMode]!,
  'color': _$AppThemeColorEnumMap[instance.color]!,
};

const _$AppThemeModeEnumMap = {
  AppThemeMode.system: 'system',
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
};

const _$AppThemeColorEnumMap = {
  AppThemeColor.blue: 'blue',
  AppThemeColor.red: 'red',
  AppThemeColor.green: 'green',
  AppThemeColor.yellow: 'yellow',
  AppThemeColor.orange: 'orange',
  AppThemeColor.purple: 'purple',
};
