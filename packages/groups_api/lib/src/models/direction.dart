import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'direction.g.dart';

@immutable
@JsonSerializable()
class Direction extends Equatable {
  const Direction({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.specialities,
    required this.groups,
  });

  final int id;
  final String fullName;
  final String shortName;
  final List<Speciality> specialities;
  final List<Group> groups;

  factory Direction.fromJson(Map<String, dynamic> json) =>
      _$DirectionFromJson(json);

  Map<String, dynamic> toJson() => _$DirectionToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName, specialities, groups];
}
