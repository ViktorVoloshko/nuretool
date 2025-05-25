import 'package:settings_storage/settings_storage.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsStorage settingsStorage})
    : _settingsStorage = settingsStorage;

  final SettingsStorage _settingsStorage;

  Stream<AppTheme> get appTheme => _settingsStorage.appTheme;

  Future<void> setTheme(AppTheme appTheme) =>
      _settingsStorage.setTheme(appTheme);

  void dispose() => _settingsStorage.close();
}
