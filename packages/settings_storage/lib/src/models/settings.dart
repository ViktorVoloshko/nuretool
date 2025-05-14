import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'settings.g.dart';

@immutable
@JsonSerializable()
class Settings extends Equatable {
  const Settings({
    required this.theme,
    required this.userGroupID,
    required this.savedGroupsIDs,
    required this.savedTeachersIDs,
    required this.savedRoomsIDs,
  });

  const Settings.defaultValues()
    : theme = AppTheme.system,
      userGroupID = null,
      savedGroupsIDs = const [],
      savedTeachersIDs = const [],
      savedRoomsIDs = const [];

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  final AppTheme theme;
  @JsonKey(name: 'user_group_id')
  final int? userGroupID;
  @JsonKey(name: 'saved_groups_ids')
  final List<int> savedGroupsIDs;
  @JsonKey(name: 'saved_teachers_ids')
  final List<int> savedTeachersIDs;
  @JsonKey(name: 'saved_rooms_ids')
  final List<int> savedRoomsIDs;

  Settings copyWith({
    AppTheme? theme,
    int? userGroupID,
    List<int>? savedGroupsIDs,
    List<int>? savedTeachersIDs,
    List<int>? savedRoomsIDs,
  }) => Settings(
    theme: theme ?? this.theme,
    userGroupID: userGroupID ?? this.userGroupID,
    savedGroupsIDs: savedGroupsIDs ?? this.savedGroupsIDs,
    savedTeachersIDs: savedTeachersIDs ?? this.savedTeachersIDs,
    savedRoomsIDs: savedRoomsIDs ?? this.savedRoomsIDs,
  );

  Map<String, dynamic> toJson() => _$SettingsToJson(this);

  @override
  List<Object?> get props => [
    theme,
    userGroupID,
    savedGroupsIDs,
    savedTeachersIDs,
    savedRoomsIDs,
  ];
}

enum AppTheme { system, light, dark }
