import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'saved_schedules.g.dart';

@immutable
@JsonSerializable()
class SavedSchedules extends Equatable {
  const SavedSchedules({
    required this.groupIDs,
    required this.teacherIDs,
    required this.roomIDs,
  });

  const SavedSchedules.empty()
    : groupIDs = const [],
      teacherIDs = const [],
      roomIDs = const [];

  factory SavedSchedules.fromJson(Map<String, dynamic> json) =>
      _$SavedSchedulesFromJson(json);

  @JsonKey(name: 'saved_groups_ids', defaultValue: [])
  final List<int> groupIDs;
  @JsonKey(name: 'saved_teachers_ids', defaultValue: [])
  final List<int> teacherIDs;
  @JsonKey(name: 'saved_rooms_ids', defaultValue: [])
  final List<int> roomIDs;

  SavedSchedules copyWith({
    List<int>? groupIDs,
    List<int>? teacherIDs,
    List<int>? roomIDs,
  }) => SavedSchedules(
    groupIDs: groupIDs ?? this.groupIDs,
    teacherIDs: teacherIDs ?? this.teacherIDs,
    roomIDs: roomIDs ?? this.roomIDs,
  );

  Map<String, dynamic> toJson() => _$SavedSchedulesToJson(this);

  @override
  List<Object?> get props => [groupIDs, teacherIDs, roomIDs];
}
