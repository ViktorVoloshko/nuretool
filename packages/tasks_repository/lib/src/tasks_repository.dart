import 'package:local_db_api/local_db_api.dart';
import 'package:rxdart/rxdart.dart';

class TasksRepository {
  TasksRepository({required LocalDBApi localDBApi}) : _localDBApi = localDBApi;

  final LocalDBApi _localDBApi;

  late final _tasksStreamController = BehaviorSubject<List>.seeded(const []);

  Stream<List> get tasks => _tasksStreamController.asBroadcastStream();

  Future<dynamic> dispose() => _tasksStreamController.close();
}
