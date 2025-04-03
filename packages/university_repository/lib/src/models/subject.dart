import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:events_api/events_api.dart' as api;
import 'package:local_db_api/local_db_api.dart' as db;

@immutable
class Subject extends Equatable {
  const Subject({
    required this.id,
    required this.name,
    required this.shortName,
    required this.events,
  });

  Subject.fromDBModel(db.Subject subject)
    : id = subject.id,
      name = subject.name,
      shortName = subject.shortName,
      events = [];

  final int id;
  final String name;
  final String shortName;
  final List<int> events;

  db.SubjectsCompanion toDBModel() => db.SubjectsCompanion.insert(
    id: Value(id),
    name: name,
    shortName: shortName,
  );

  @override
  List<Object?> get props => [id, name, shortName];
}

extension ApiToDBSubject on api.Subject {
  db.SubjectsCompanion toDBModel() =>
      db.SubjectsCompanion.insert(id: Value(id), name: title, shortName: brief);
}
