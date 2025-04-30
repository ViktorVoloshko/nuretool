part of 'task_view_bloc.dart';

sealed class TaskViewEvent extends Equatable {
  const TaskViewEvent();

  @override
  List<Object?> get props => [];
}

final class TaskViewSubscriptionRequested extends TaskViewEvent {
  const TaskViewSubscriptionRequested({required this.supertaskID, this.taskID});

  final int supertaskID;
  final int? taskID;

  @override
  List<Object?> get props => [supertaskID, taskID];
}

final class TaskViewDataChanged extends TaskViewEvent {
  const TaskViewDataChanged({
    required this.title,
    required this.type,
    required this.deadline,
  });

  final String title;
  final TaskType? type;
  final DateTime? deadline;
}
