import 'package:local_db_api/local_db_api.dart' show LocalDBApi;
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

class TasksRepository {
  TasksRepository({required LocalDBApi localDBApi}) : _localDBApi = localDBApi;

  final LocalDBApi _localDBApi;

  late final _tasksStreamController = BehaviorSubject<List<SuperTask>>.seeded(
    const [],
  );

  late final _tasksSubscription = _localDBApi.loadTasks().listen((tasks) {
    final result = <SuperTask>[];

    final supertasks = tasks.where((task) => task.supertaskID == null);
    final subtasks = tasks.where((task) => task.supertaskID != null);

    result.addAll(supertasks.map((e) => SuperTask.fromDBModel(e, subtasks)));

    _tasksStreamController.add(result);
  });

  Stream<List<SuperTask>> get tasks =>
      _tasksStreamController.asBroadcastStream();

  Future<dynamic> dispose() async {
    await _tasksSubscription.cancel();
    return _tasksStreamController.close();
  }
}
