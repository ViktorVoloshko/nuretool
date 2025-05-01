import 'package:drift/drift.dart';
import 'package:drift_db/drift_db.dart' as db;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum TaskType { subject, project, practice, laboratory, test, exam }

@immutable
class Task extends Equatable {
  const Task({
    this.id,
    required this.title,
    required this.isDone,
    required this.isGenerated,
    required this.type,
    required this.deadline,
  });

  factory Task.fromDBModel(db.Task task) => Task(
    id: task.id,
    title: task.title,
    isDone: task.isDone,
    isGenerated: task.isGenerated,
    type: task.type?.fromDBModel(),
    deadline: task.deadline,
  );

  final int? id;
  final String title;
  final bool isDone;
  final bool isGenerated;
  final TaskType? type;
  final DateTime? deadline;

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isGenerated,
    TaskType? type,
    DateTime? deadline,
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    isGenerated: isGenerated ?? this.isGenerated,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
  );

  Task rewriteWith({
    required String title,
    required TaskType? type,
    required DateTime? deadline,
  }) => Task(
    id: id,
    title: title,
    isDone: isDone,
    isGenerated: isGenerated,
    type: type,
    deadline: deadline,
  );

  db.TasksCompanion toDBModel([int? supertaskID]) => db.TasksCompanion.insert(
    id: Value.absentIfNull(id),
    title: title,
    supertaskID: Value(supertaskID),
    isDone: Value(isDone),
    isGenerated: isGenerated,
    deadline: Value(deadline),
    type: Value(type?.toDBModel()),
  );

  @override
  List<Object?> get props => [id, title, isDone, isGenerated, type, deadline];
}

@immutable
class Supertask extends Task {
  const Supertask({
    super.id,
    required super.title,
    required super.isDone,
    required super.isGenerated,
    required super.type,
    required super.deadline,
    required this.subtasks,
  });

  factory Supertask.fromDBModel(db.Task task, Iterable<db.Task> subtasks) =>
      Supertask(
        id: task.id,
        title: task.title,
        isDone: task.isDone,
        isGenerated: task.isGenerated,
        type: task.type?.fromDBModel(),
        deadline: task.deadline,
        subtasks: subtasks.map((e) => Task.fromDBModel(e)).toList(),
      );

  final List<Task> subtasks;

  List<db.TasksCompanion> subtasksToDBModels([int? supertaskID]) {
    assert(supertaskID != null || id != null);

    final result = <db.TasksCompanion>[];
    result.addAll(subtasks.map((e) => e.toDBModel(supertaskID ?? id)));
    return result;
  }

  @override
  Supertask copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isGenerated,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
  }) => Supertask(
    id: id ?? this.id,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    isGenerated: isGenerated ?? this.isGenerated,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
    subtasks: subtasks ?? this.subtasks,
  );

  @override
  Supertask rewriteWith({
    required String title,
    required TaskType? type,
    required DateTime? deadline,
  }) => Supertask(
    id: id,
    title: title,
    isDone: isDone,
    isGenerated: isGenerated,
    type: type,
    deadline: deadline,
    subtasks: subtasks,
  );

  @override
  List<Object?> get props => [...super.props, subtasks];
}

extension DBToDomainTaskType on db.TaskType {
  TaskType fromDBModel() => switch (this) {
    db.TaskType.subject => TaskType.subject,
    db.TaskType.project => TaskType.project,
    db.TaskType.practice => TaskType.practice,
    db.TaskType.laboratory => TaskType.laboratory,
    db.TaskType.test => TaskType.test,
    db.TaskType.exam => TaskType.exam,
  };
}

extension DomainToDBTaskType on TaskType {
  db.TaskType toDBModel() => switch (this) {
    TaskType.subject => db.TaskType.subject,
    TaskType.project => db.TaskType.project,
    TaskType.practice => db.TaskType.practice,
    TaskType.laboratory => db.TaskType.laboratory,
    TaskType.test => db.TaskType.test,
    TaskType.exam => db.TaskType.exam,
  };
}
