import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:groups_api/groups_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

@immutable
class Group extends Equatable {
  const Group({required this.id, required this.name, required this.events});

  Group.fromDBModel(db.Group group)
    : id = group.id,
      name = group.name,
      events = [];

  final int id;
  final String name;
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
