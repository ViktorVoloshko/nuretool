import 'package:settings_storage/settings_storage.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsStorage settingsStorage})
    : _settingsStorage = settingsStorage;

  final SettingsStorage _settingsStorage;

  Stream<Settings> get settings => _settingsStorage.settings;

  Future<void> saveSettings(Settings settings) =>
      _settingsStorage.updateSettings(settings);

  void dispose() => _settingsStorage.close();
}
