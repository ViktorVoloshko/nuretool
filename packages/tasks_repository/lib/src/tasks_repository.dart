import 'dart:async';

import 'package:local_db_api/local_db_api.dart' as db;
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

class TasksRepository {
  TasksRepository({required db.LocalDBApi localDBApi})
    : _localDBApi = localDBApi {
    _init();
  }

  final db.LocalDBApi _localDBApi;

  final _tasksStreamController = BehaviorSubject<List<Supertask>>.seeded(
    const [],
  );

  late final StreamSubscription<List<db.Task>> _tasksSubscription;

  Stream<List<Supertask>> get tasks =>
      _tasksStreamController.asBroadcastStream();

  Future<int> saveTask(Task task, int supertaskID) =>
      _localDBApi.saveTask(task.toDBModel(supertaskID));

  Future<int> saveSupertask(Supertask task) =>
      _localDBApi.saveTask(task.toDBModel());

  Future<int> saveSupertaskWithSubtasks(Supertask task) async {
    _localDBApi.saveTasks(task.subtasksToDBModels(task.id));
    return _localDBApi.saveTask(task.toDBModel());
  }

  Future<void> saveSupertasks(Iterable<Supertask> tasks) async {
    final subtasks = <db.TasksCompanion>[];

    for (final supertask in tasks) {
      final id = await _localDBApi.saveTask(supertask.toDBModel());
      subtasks.addAll(supertask.subtasksToDBModels(id));
    }

    return _localDBApi.saveTasks(subtasks);
  }

  Future<dynamic> dispose() async {
    await _tasksSubscription.cancel();
    return _tasksStreamController.close();
  }

  void _init() {
    _tasksSubscription = _localDBApi.loadTasks().listen((tasks) {
      final result = <Supertask>[];

      final supertasks = tasks.where((task) => task.supertask == null);
      final subtasks = tasks.where((task) => task.supertask != null);

      result.addAll(
        supertasks.map(
          (e) => Supertask.fromDBModel(
            e,
            subtasks.where((task) => task.supertask == e.id),
          ),
        ),
      );

      _tasksStreamController.add(result);
    });
  }
}
