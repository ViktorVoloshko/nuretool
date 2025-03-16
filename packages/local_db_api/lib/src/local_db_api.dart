import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'tables/tables.dart';

part 'local_db_api.g.dart';

@DriftDatabase(tables: [Subjects, Events, EventTypes, Tasks, Groups, Teachers])
class LocalDBApi extends _$LocalDBApi {
  LocalDBApi(String name) : super(_openConnection(name));

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection(String name) {
    return driftDatabase(
      name: name,
      native: const DriftNativeOptions(
        databaseDirectory: getApplicationSupportDirectory,
      ),
    );
  }
}
