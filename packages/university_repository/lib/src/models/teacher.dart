import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:drift/drift.dart';
import 'package:teachers_api/teachers_api.dart' as api;
import 'package:local_db_api/local_db_api.dart' as db;

@immutable
class Teacher extends Equatable {
  const Teacher({
    required this.id,
    required this.name,
    required this.shortName,
  });

  Teacher.fromDBModel(db.Teacher teacher)
    : id = teacher.id,
      name = teacher.name,
      shortName = teacher.shortName;

  final int id;
  final String name;
  final String shortName;

  db.TeachersCompanion toDBModel() => db.TeachersCompanion.insert(
    id: Value(id),
    name: name,
    shortName: shortName,
  );

  @override
  List<Object?> get props => [id, name, shortName];
}

extension ApiToDBTeacher on api.Teacher {
  db.TeachersCompanion toDBModel() => db.TeachersCompanion.insert(
    id: Value(id),
    name: fullName,
    shortName: shortName,
  );
}
