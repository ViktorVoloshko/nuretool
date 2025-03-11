import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'speciality.g.dart';

@immutable
@JsonSerializable()
class Speciality extends Equatable {
  const Speciality({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.groups,
  });

  final int id;
  final String fullName;
  final String shortName;
  final List<Group> groups;

  factory Speciality.fromJson(Map<String, dynamic> json) =>
      _$SpecialityFromJson(json);

  Map<String, dynamic> toJson() => _$SpecialityToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName, groups];
}
