import 'package:local_db_api/local_db_api.dart' show LocalDBApi;
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

class TasksRepository {
  TasksRepository({required LocalDBApi localDBApi}) : _localDBApi = localDBApi;

  final LocalDBApi _localDBApi;

  late final _tasksStreamController = BehaviorSubject<List<Task>>.seeded(
    const [],
  );

  Stream<List<Task>> get tasks => _tasksStreamController.asBroadcastStream();

  Future<dynamic> dispose() => _tasksStreamController.close();
}
