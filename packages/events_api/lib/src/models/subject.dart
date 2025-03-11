import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'subject.g.dart';

@immutable
@JsonSerializable()
class Subject extends Equatable {
  const Subject({
    required this.id,
    required this.title,
    required this.brief,
    required this.hours,
  });

  final int id;
  final String title;
  final String brief;
  final List<Hours> hours;

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectToJson(this);

  @override
  List<Object?> get props => [id, title, brief, hours];
}

@immutable
@JsonSerializable()
class Hours extends Equatable {
  const Hours({required this.type, required this.val, required this.teachers});

  final int type;
  final int val;
  final List<int> teachers;

  factory Hours.fromJson(Map<String, dynamic> json) => _$HoursFromJson(json);

  Map<String, dynamic> toJson() => _$HoursToJson(this);

  @override
  List<Object?> get props => [type, val, teachers];
}
