// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppTheme _$AppThemeFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppTheme', json, ($checkedConvert) {
      final val = AppTheme(
        appThemeMode: $checkedConvert(
          'app_theme_mode',
          (v) => $enumDecode(_$AppThemeModeEnumMap, v),
        ),
      );
      return val;
    }, fieldKeyMap: const {'appThemeMode': 'app_theme_mode'});

Map<String, dynamic> _$AppThemeToJson(AppTheme instance) => <String, dynamic>{
  'app_theme_mode': _$AppThemeModeEnumMap[instance.appThemeMode]!,
};

const _$AppThemeModeEnumMap = {
  AppThemeMode.system: 'system',
  AppThemeMode.light: 'light',
  AppThemeMode.dark: 'dark',
};
