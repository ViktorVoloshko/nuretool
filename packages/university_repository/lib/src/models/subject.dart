import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:events_api/events_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

@immutable
class Subject extends Equatable {
  const Subject({
    required this.id,
    required this.title,
    required this.shortTitle,
    required this.events,
  });

  Subject.fromDBModel(db.Subject subject)
    : id = subject.id,
      title = subject.title,
      shortTitle = subject.shortTitle,
      events = [];

  final int id;
  final String title;
  final String shortTitle;
  final List<int> events;

  db.SubjectsCompanion toDBModel() => db.SubjectsCompanion.insert(
    id: Value(id),
    title: title,
    shortTitle: shortTitle,
  );

  @override
  List<Object?> get props => [id, title, shortTitle, events];
}

extension ApiToDBSubject on api.Subject {
  db.SubjectsCompanion toDBModel() => db.SubjectsCompanion.insert(
    id: Value(id),
    title: title,
    shortTitle: brief,
  );
}
