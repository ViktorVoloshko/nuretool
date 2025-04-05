import 'package:cist_api/cist_api.dart';
import 'package:flutter/widgets.dart';
import 'package:local_db_api/local_db_api.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final localDBApi = LocalDBApi(database: AppDatabase());
  final cistApi = CistApi();

  runApp(
    App(
      createUniversityRepository: UniversityRepository.new,
      createTasksRepository: TasksRepository.new,
      localDBApi: localDBApi,
      eventsApi: cistApi,
      groupsApi: cistApi,
      teachersApi: cistApi,
      roomsApi: cistApi,
    ),
  );

  await localDBApi.dispose();
}
