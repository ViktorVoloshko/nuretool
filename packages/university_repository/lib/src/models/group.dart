import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:groups_api/groups_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

import 'models.dart';

@immutable
class Group extends Entity {
  const Group({required super.id, required super.name, required this.events});

  Group.fromDBModel(db.Group group)
    : this(id: group.id, name: group.name, events: const []);

  final List<int> events;

  db.GroupsCompanion toDBModel() =>
      db.GroupsCompanion.insert(id: Value(id), name: name);

  @override
  List<Object?> get props => [id, name, events];
}

extension ApiToDBGroup on api.Group {
  db.GroupsCompanion toDBModel() =>
      db.GroupsCompanion.insert(id: Value(id), name: name);
}
