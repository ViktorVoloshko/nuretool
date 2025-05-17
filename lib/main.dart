import 'package:cist_api/cist_api.dart';
import 'package:drift_db/drift_db.dart';
import 'package:flutter/widgets.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final driftDB = DriftDB();
  final cistApi = CistApi();
  final settingsStorage = SettingsStorage(
    storage: await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(),
    ),
  );

  runApp(
    AppPage(
      createUniversityRepository: UniversityRepository.new,
      createTasksRepository: TasksRepository.new,
      createSettingsRepository: SettingsRepository.new,
      driftDB: driftDB,
      settingsStorage: settingsStorage,
      eventsApi: cistApi,
      groupsApi: cistApi,
      teachersApi: cistApi,
      roomsApi: cistApi,
    ),
  );
}
