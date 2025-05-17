import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'schedule_selection.g.dart';

@immutable
@JsonSerializable()
class ScheduleSelection extends Equatable {
  const ScheduleSelection({required this.id, required this.type});

  factory ScheduleSelection.fromJson(Map<String, dynamic> json) =>
      _$ScheduleSelectionFromJson(json);

  final int id;
  final ScheduleSelectionType type;

  @override
  List<Object?> get props => [id, type];

  Map<String, dynamic> toJson() => _$ScheduleSelectionToJson(this);
}

enum ScheduleSelectionType { group, teacher, room }
