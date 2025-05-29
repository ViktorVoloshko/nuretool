import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'schedule_selection.g.dart';

@immutable
@JsonSerializable()
class ScheduleData extends Equatable {
  const ScheduleData({required this.id, required this.type});

  factory ScheduleData.fromJson(Map<String, dynamic> json) =>
      _$ScheduleDataFromJson(json);

  final int id;
  final ScheduleType type;

  @override
  List<Object?> get props => [id, type];

  Map<String, dynamic> toJson() => _$ScheduleDataToJson(this);
}

enum ScheduleType { group, teacher, room }
