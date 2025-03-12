import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'teacher.g.dart';

@immutable
@JsonSerializable()
class Teacher extends Equatable {
  const Teacher({
    required this.id,
    required this.fullName,
    required this.shortName,
  });

  final int id;
  final String fullName;
  final String shortName;

  factory Teacher.fromJson(Map<String, dynamic> json) =>
      _$TeacherFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName];
}
