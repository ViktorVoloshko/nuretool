import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:events_api/events_api.dart' as api;
import 'package:local_db_api/local_db_api.dart' as db;

@immutable
class EventType extends Equatable {
  const EventType({
    required this.id,
    required this.name,
    required this.shortName,
  });

  EventType.fromDBModel(db.EventType type)
    : id = type.id,
      name = type.name,
      shortName = type.shortName;

  final int id;
  final String name;
  final String shortName;

  db.EventTypesCompanion toDBModel() => db.EventTypesCompanion.insert(
    id: Value(id),
    name: name,
    shortName: shortName,
  );

  @override
  List<Object?> get props => [id, name, shortName];
}

extension ApiToDBEventType on api.EventType {
  db.EventTypesCompanion toDBModel() => db.EventTypesCompanion.insert(
    id: Value(id),
    name: fullName,
    shortName: shortName,
  );
}
