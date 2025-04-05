import 'package:drift/drift.dart';
import 'package:local_db_api/local_db_api.dart' as db;
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum TaskType { subject, project, practice, laboratory, test, exam }

@immutable
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    required this.isDone,
    required this.isCustom,
    required this.type,
    required this.deadline,
  });

  factory Task.fromDBModel(db.Task task) => Task(
    id: task.id,
    title: task.title,
    isDone: task.isDone,
    isCustom: task.isCustom,
    type: task.type?.fromDBModel(),
    deadline: task.deadline,
  );

  final int id;
  final String title;
  final bool isDone;
  final bool isCustom;
  final TaskType? type;
  final DateTime? deadline;

  Task copyWith({
    int? id,
    String? title,
    bool? isDone,
    bool? isCustom,
    TaskType? type,
    DateTime? deadline,
  }) => Task(
    id: id ?? this.id,
    title: title ?? this.title,
    isDone: isDone ?? this.isDone,
    isCustom: isCustom ?? this.isCustom,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
  );

  db.TasksCompanion _toDBModel([int? supertaskID]) => db.TasksCompanion.insert(
    id: Value(id),
    title: title,
    supertaskID: Value(supertaskID),
    isDone: Value(isDone),
    isCustom: isCustom,
    deadline: Value(deadline),
    type: Value(type?.toDBModel()),
  );

  @override
  List<Object?> get props => [id, title, isDone, isCustom, type, deadline];
}

@immutable
class SuperTask extends Task {
  const SuperTask({
    required super.id,
    required super.title,
    required super.isDone,
    required super.isCustom,
    required super.type,
    required super.deadline,
    required this.subtasks,
  });

  factory SuperTask.fromDBModel(db.Task task, Iterable<db.Task> subtasks) =>
      SuperTask(
        id: task.id,
        title: task.title,
        isDone: task.isDone,
        isCustom: task.isCustom,
        type: task.type?.fromDBModel(),
        deadline: task.deadline,
        subtasks: subtasks.map((e) => Task.fromDBModel(e)).toList(),
      );

  final List<Task> subtasks;

  List<db.TasksCompanion> toDBModel() {
    final result = <db.TasksCompanion>[];

    result.add(super._toDBModel());
    result.addAll(subtasks.map((e) => e._toDBModel(id)));

    return result;
  }

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
