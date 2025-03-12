import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'department.g.dart';

@immutable
@JsonSerializable()
class Department extends Equatable {
  const Department({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.departments,
    required this.teachers,
  });

  final int id;
  final String fullName;
  final String shortName;
  @JsonKey(defaultValue: [])
  final List<Department> departments;
  @JsonKey(defaultValue: [])
  final List<Teacher> teachers;

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName, teachers];
}
