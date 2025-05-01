import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'event_relations.g.dart';

@immutable
@JsonSerializable()
class EventRelations {
  const EventRelations({
    required this.groups,
    required this.teachers,
    required this.room,
  });

  final List<int> groups;
  final List<int> teachers;
  final int? room;

  factory EventRelations.fromJson(Map<String, dynamic> json) =>
      _$EventRelationsFromJson(json);

  Map<String, dynamic> toJson() => _$EventRelationsToJson(this);

  static final converter = TypeConverter.json2(
    fromJson: (json) => EventRelations.fromJson(json as Map<String, dynamic>),
    toJson: (column) => column.toJson(),
  );
}
