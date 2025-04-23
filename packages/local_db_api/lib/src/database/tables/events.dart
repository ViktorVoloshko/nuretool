import 'package:drift/drift.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'tables.dart';

part 'events.g.dart';

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get subjectID =>
      integer().named('subject_id').references(Subjects, #id)();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  BoolColumn get isCustom => boolean()();
  IntColumn get baseType => intEnum<EventBaseType>().nullable()();
  IntColumn get typeID =>
      integer().nullable().named('type_id').references(EventTypes, #id)();
  TextColumn get relations => text().map(EventRelations.converter)();
}

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
  final int room;

  factory EventRelations.fromJson(Map<String, dynamic> json) =>
      _$EventRelationsFromJson(json);

  Map<String, dynamic> toJson() => _$EventRelationsToJson(this);

  static final converter = TypeConverter.json2(
    fromJson: (json) => EventRelations.fromJson(json as Map<String, dynamic>),
    toJson: (column) => column.toJson(),
  );
}
