import 'package:settings_storage/settings_storage.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsStorage settingsStorage})
    : _settingsStorage = settingsStorage;

  final SettingsStorage _settingsStorage;

  Stream<AppTheme> get appTheme => _settingsStorage.appTheme;
  Stream<CalendarMode> get defaultCalendarMode =>
      _settingsStorage.defaultCalendarMode;

  Future<void> setTheme(AppTheme appTheme) =>
      _settingsStorage.setTheme(appTheme);

  Future<void> setDefaultCalendarMode(CalendarMode mode) =>
      _settingsStorage.setDefaultCalendarMode(mode);

  void dispose() => _settingsStorage.close();
}
