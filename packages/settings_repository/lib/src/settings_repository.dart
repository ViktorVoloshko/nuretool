import 'package:settings_storage/settings_storage.dart';

class SettingsRepository {
  const SettingsRepository({required SettingsStorage settingsStorage})
    : _settingsStorage = settingsStorage;

  final SettingsStorage _settingsStorage;

  Stream<int?> get userGroupID => _settingsStorage.userGroupID;
  Stream<SavedSchedules> get savedSchedules => _settingsStorage.savedSchedules;
  Stream<AppTheme> get appTheme => _settingsStorage.appTheme;

  Future<void> setUserGroupID(int groupID) =>
      _settingsStorage.setUserGroupID(groupID);

  Future<void> setSavedSchedules(SavedSchedules savedSchedules) =>
      _settingsStorage.setSavedSchedules(savedSchedules);

  Future<void> setTheme(AppTheme appTheme) =>
      _settingsStorage.setTheme(appTheme);

  void dispose() => _settingsStorage.close();
}
