import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'faculty.g.dart';

/// Represents a faculty by their name, short name, associated groups and id.
@immutable
@JsonSerializable()
class Faculty extends Equatable {
  const Faculty({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.departments,
  });

  final int id;
  final String fullName;
  final String shortName;
  final List<Department> departments;

  factory Faculty.fromJson(Map<String, dynamic> json) =>
      _$FacultyFromJson(json);

  Map<String, dynamic> toJson() => _$FacultyToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName, departments];
}
