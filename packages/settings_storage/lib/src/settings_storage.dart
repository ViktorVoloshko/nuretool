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
  late final BehaviorSubject<ScheduleData?> _selectedScheduleStreamController;
  late final BehaviorSubject<AppTheme> _appThemeStreamController;
  late final BehaviorSubject<CalendarMode> _defaultCalendarModeStreamController;

  Stream<int?> get userGroupID =>
      _userGroupIDStreamController.asBroadcastStream();
  Stream<SavedSchedules> get savedSchedules =>
      _savedSchedulesStreamController.asBroadcastStream();
  Stream<ScheduleData?> get selectedSchedule =>
      _selectedScheduleStreamController.asBroadcastStream();
  Stream<AppTheme> get appTheme =>
      _appThemeStreamController.asBroadcastStream();
  Stream<CalendarMode> get defaultCalendarMode =>
      _defaultCalendarModeStreamController.asBroadcastStream();

  @visibleForTesting
  static const kUserGroupID = 'user_group_id';
  @visibleForTesting
  static const kSavedSchedules = 'saved_schedules';
  @visibleForTesting
  static const kSelectedSchedule = 'selected_schedule';
  @visibleForTesting
  static const kAppTheme = 'app_theme';
  @visibleForTesting
  static const kDefaultCalendarMode = 'default_calendar_mode';

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

  Future<void> setSelectedSchedule(ScheduleData? schedule) {
    _selectedScheduleStreamController.add(schedule);
    return schedule == null
        ? _storage.remove(kSelectedSchedule)
        : _storage.setString(kSelectedSchedule, json.encode(schedule.toJson()));
  }

  Future<void> setTheme(AppTheme appTheme) {
    _appThemeStreamController.add(appTheme);
    return _storage.setString(kAppTheme, json.encode(appTheme.toJson()));
  }

  Future<void> setDefaultCalendarMode(CalendarMode mode) {
    _defaultCalendarModeStreamController.add(mode);
    return _storage.setInt(kDefaultCalendarMode, mode.index);
  }

  Future<void> close() => Future.wait([
    _userGroupIDStreamController.close(),
    _savedSchedulesStreamController.close(),
    _selectedScheduleStreamController.close(),
    _appThemeStreamController.close(),
    _defaultCalendarModeStreamController.close(),
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

    final selectedScheduleJson = _storage.getString(kSelectedSchedule);
    if (selectedScheduleJson == null) {
      _selectedScheduleStreamController = BehaviorSubject<ScheduleData?>.seeded(
        null,
      );
    } else {
      _selectedScheduleStreamController = BehaviorSubject<ScheduleData?>.seeded(
        ScheduleData.fromJson(json.decode(selectedScheduleJson)),
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

    final calendarModeInt = _storage.getInt(kDefaultCalendarMode);
    if (calendarModeInt == null) {
      _defaultCalendarModeStreamController =
          BehaviorSubject<CalendarMode>.seeded(CalendarMode.week);
      _storage.setInt(kDefaultCalendarMode, CalendarMode.week.index);
    } else {
      _defaultCalendarModeStreamController =
          BehaviorSubject<CalendarMode>.seeded(
            CalendarMode.values[calendarModeInt],
          );
    }
  }
}
