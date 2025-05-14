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

  late final BehaviorSubject<Settings> _settingsStreamController;

  @visibleForTesting
  static const kSettings = '__settings__';

  Stream<Settings> get settings =>
      _settingsStreamController.asBroadcastStream();

  Future<void> updateSettings(Settings settings) {
    _settingsStreamController.add(settings);
    return _setValue(kSettings, json.encode(settings));
  }

  Future<void> close() => _settingsStreamController.close();

  void _init() {
    final settingsJson = _getValue(kSettings);

    if (settingsJson == null) {
      _settingsStreamController = BehaviorSubject.seeded(
        const Settings.defaultValues(),
      );
      _setValue(kSettings, json.encode(const Settings.defaultValues()));
    } else {
      final settings = Settings.fromJson(json.decode(settingsJson));
      _settingsStreamController = BehaviorSubject.seeded(settings);
    }
  }

  String? _getValue(String key) => _storage.getString(key);
  Future<void> _setValue(String key, String value) =>
      _storage.setString(key, value);
}
