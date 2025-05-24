import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:teachers_api/teachers_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

@immutable
class Teacher extends Equatable {
  const Teacher({
    required this.id,
    required this.name,
    required this.shortName,
    required this.events,
  });

  Teacher.fromDBModel(db.Teacher teacher)
    : this(
        id: teacher.id,
        name: teacher.name,
        shortName: teacher.shortName,
        events: [],
      );

  final int id;
  final String name;
  final String shortName;
  final List<int> events;

  db.TeachersCompanion toDBModel() => db.TeachersCompanion.insert(
    id: Value(id),
    name: name,
    shortName: shortName,
  );

  @override
  List<Object?> get props => [id, name, shortName, events];
}

extension ApiToDBTeacher on api.Teacher {
  db.TeachersCompanion toDBModel() => db.TeachersCompanion.insert(
    id: Value(id),
    name: fullName,
    shortName: shortName,
  );
}
