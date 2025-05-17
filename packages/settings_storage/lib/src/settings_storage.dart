import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/models.dart';

class SettingsStorage {
  SettingsStorage({required SharedPreferencesWithCache storage})
    : _storage = storage {
    _init();
  }

  final SharedPreferencesWithCache _storage;

  late final BehaviorSubject<int?> _userGroupIDStreamController;
  late final BehaviorSubject<SavedSchedules> _savedSchedulesStreamController;
  late final BehaviorSubject<AppTheme> _appThemeStreamController;

  Stream<int?> get userGroupID =>
      _userGroupIDStreamController.asBroadcastStream();
  Stream<SavedSchedules> get savedSchedules =>
      _savedSchedulesStreamController.asBroadcastStream();
  Stream<AppTheme> get appTheme =>
      _appThemeStreamController.asBroadcastStream();

  @visibleForTesting
  static const kUserGroupID = 'user_group_id';
  @visibleForTesting
  static const kSavedSchedules = 'saved_schedules';
  @visibleForTesting
  static const kAppTheme = 'app_theme';

  Future<void> setUserGroupID(int groupID) {
    _userGroupIDStreamController.add(groupID);
    return _storage.setInt(kUserGroupID, groupID);
  }

  Future<void> setSavedSchedules(SavedSchedules savedSchedules) {
    _savedSchedulesStreamController.add(savedSchedules);
    return _storage.setString(
      kSavedSchedules,
      json.encode(savedSchedules.toJson()),
    );
  }

  Future<void> setTheme(AppTheme appTheme) {
    _appThemeStreamController.add(appTheme);
    return _storage.setString(kAppTheme, json.encode(appTheme.toJson()));
  }

  Future<void> close() => Future.wait([
    _userGroupIDStreamController.close(),
    _savedSchedulesStreamController.close(),
    _appThemeStreamController.close(),
  ]);

  void _init() {
    _userGroupIDStreamController = BehaviorSubject.seeded(
      _storage.getInt(kUserGroupID),
    );

    final savedSchedulesJson = _storage.getString(kSavedSchedules);
    if (savedSchedulesJson == null) {
      _savedSchedulesStreamController = BehaviorSubject<SavedSchedules>.seeded(
        SavedSchedules.empty(),
      );
      _storage.setString(
        kSavedSchedules,
        json.encode(_savedSchedulesStreamController.value.toJson()),
      );
    } else {
      _savedSchedulesStreamController = BehaviorSubject<SavedSchedules>.seeded(
        SavedSchedules.fromJson(json.decode(savedSchedulesJson)),
      );
    }

    final appThemeJson = _storage.getString(kAppTheme);
    if (appThemeJson == null) {
      _appThemeStreamController = BehaviorSubject<AppTheme>.seeded(
        const AppTheme.defaultValues(),
      );
      _storage.setString(
        kAppTheme,
        json.encode(const AppTheme.defaultValues().toJson()),
      );
    } else {
      _appThemeStreamController = BehaviorSubject<AppTheme>.seeded(
        AppTheme.fromJson(json.decode(appThemeJson)),
      );
    }
  }
}
