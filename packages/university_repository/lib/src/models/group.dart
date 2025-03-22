import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:groups_api/groups_api.dart' as groups_api;

@immutable
class Group extends Equatable {
  const Group({required this.id, required this.name});

  final int id;
  final String name;

  factory Group.fromApiModel(groups_api.Group group) =>
      Group(id: group.id, name: group.name);

  @override
  List<Object?> get props => [id, name];
}
