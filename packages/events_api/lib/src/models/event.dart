import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'event.g.dart';

@immutable
@JsonSerializable()
class Event extends Equatable {
  const Event({
    required this.subjectID,
    required this.startTime,
    required this.endTime,
    required this.type,
    required this.numberPair,
    required this.auditory,
    required this.teachers,
    required this.groups,
  });

  @JsonKey(name: 'subject_id')
  final int subjectID;
  final int startTime;
  final int endTime;
  final int type;
  final int numberPair;
  final String auditory;
  final List<int> teachers;
  final List<int> groups;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

  @override
  List<Object?> get props => [
    subjectID,
    startTime,
    endTime,
    type,
    numberPair,
    auditory,
    teachers,
    groups,
  ];
}
