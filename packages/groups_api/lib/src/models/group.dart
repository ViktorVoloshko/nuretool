import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'group.g.dart';

/// Represents a group by their name and id.
@immutable
@JsonSerializable()
class Group extends Equatable {
  const Group({required this.id, required this.name});

  final int id;
  final String name;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);

  @override
  List<Object?> get props => [id, name];
}
