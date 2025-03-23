import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:groups_api/groups_api.dart' as groups_api;
import 'package:local_db_api/local_db_api.dart';
import 'package:drift/drift.dart';

@immutable
class Group extends Equatable {
  const Group({required this.id, required this.name});

  final int id;
  final String name;

  Group.fromApiModel(groups_api.Group group) : id = group.id, name = group.name;

  GroupsCompanion toDBModel() =>
      GroupsCompanion.insert(id: Value(id), name: name);

  @override
  List<Object?> get props => [id, name];
}
