import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'saved_schedules.g.dart';

@immutable
@JsonSerializable()
class SavedSchedules extends Equatable {
  const SavedSchedules({required this.schedules});

  const SavedSchedules.empty() : schedules = const {};

  factory SavedSchedules.fromJson(Map<String, dynamic> json) =>
      _$SavedSchedulesFromJson(json);

  @JsonKey(defaultValue: <ScheduleData>{})
  final Set<ScheduleData> schedules;

  SavedSchedules copyWith({Set<ScheduleData>? schedules}) =>
      SavedSchedules(schedules: schedules ?? this.schedules);

  Map<String, dynamic> toJson() => _$SavedSchedulesToJson(this);

  @override
  List<Object?> get props => [schedules];
}
