import 'dart:async';

import 'package:drift_db/drift_db.dart' as db;
import 'package:rxdart/rxdart.dart';

import 'models/models.dart';

class TasksRepository {
  TasksRepository({required db.DriftDB driftDB}) : _driftDB = driftDB {
    _init();
  }

  final db.DriftDB _driftDB;

  final _tasksStreamController = BehaviorSubject<List<Supertask>>.seeded(
    const [],
  );

  late final StreamSubscription<List<db.Task>> _tasksSubscription;

  Stream<List<Supertask>> get tasks =>
      _tasksStreamController.asBroadcastStream();

  Future<int> saveTask(Task task, int supertaskID) =>
      _driftDB.saveTask(task.toDBModel(supertaskID));

  Future<int> saveSupertask(Supertask task) =>
      _driftDB.saveTask(task.toDBModel());

  Future<int> saveSupertaskWithSubtasks(Supertask task) async {
    _driftDB.saveTasks(task.subtasksToDBModels(task.id));
    return _driftDB.saveTask(task.toDBModel());
  }

  Future<void> saveSupertasks(Iterable<Supertask> tasks) async {
    final subtasks = <db.TasksCompanion>[];

    for (final supertask in tasks) {
      final id = await _driftDB.saveTask(supertask.toDBModel());
      subtasks.addAll(supertask.subtasksToDBModels(id));
    }

    return _driftDB.saveTasks(subtasks);
  }

  Future<dynamic> dispose() async {
    await _tasksSubscription.cancel();
    return _tasksStreamController.close();
  }

  void _init() {
    _tasksSubscription = _driftDB.loadTasks().listen((tasks) {
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
