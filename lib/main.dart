import 'package:cist_api/cist_api.dart';
import 'package:drift_db/drift_db.dart';
import 'package:flutter/widgets.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final driftDB = DriftDB();
  final cistApi = CistApi();

  runApp(
    App(
      createUniversityRepository: UniversityRepository.new,
      createTasksRepository: TasksRepository.new,
      driftDB: driftDB,
      eventsApi: cistApi,
      groupsApi: cistApi,
      teachersApi: cistApi,
      roomsApi: cistApi,
    ),
  );
}
