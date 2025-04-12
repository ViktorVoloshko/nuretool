import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tasks_repository/tasks_repository.dart';

enum SupertaskType { subject, project }

@immutable
class Supertask extends Equatable {
  const Supertask({
    required this.id,
    required this.title,
    required this.isDone,
    required this.subtasksTotal,
    required this.subtasksDone,
    required this.deadline,
    required this.type,
  });

  final int id;
  final String title;
  final bool isDone;
  final int subtasksTotal;
  final int subtasksDone;
  final DateTime? deadline;
  final SupertaskType? type;

  @override
  List<Object?> get props => [
    id,
    title,
    isDone,
    subtasksTotal,
    subtasksDone,
    deadline,
    type,
  ];
}

extension DomainToViewModelTaskType on TaskType {
  SupertaskType toVMModel() => switch (this) {
    TaskType.subject => SupertaskType.subject,
    TaskType.project => SupertaskType.project,
    _ => throw StateError('supertask cannot have $this type'),
  };
}
