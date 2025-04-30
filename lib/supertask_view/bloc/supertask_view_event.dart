part of 'supertask_view_bloc.dart';

sealed class SupertaskViewEvent extends Equatable {
  const SupertaskViewEvent();

  @override
  List<Object?> get props => [];
}

final class SupertaskViewSubscriptionRequested extends SupertaskViewEvent {
  const SupertaskViewSubscriptionRequested({this.taskID});

  final int? taskID;

  @override
  List<Object?> get props => [taskID];
}

final class SupertaskViewDataChanged extends SupertaskViewEvent {
  const SupertaskViewDataChanged({
    required this.title,
    required this.type,
    required this.deadline,
  });

  final String title;
  final TaskType? type;
  final DateTime? deadline;

  @override
  List<Object?> get props => [title, type, deadline];
}

final class SupertaskViewSubtaskCheckboxToggled extends SupertaskViewEvent {
  const SupertaskViewSubtaskCheckboxToggled({
    required this.task,
    required this.isDone,
  });

  final Task task;
  final bool isDone;

  @override
  List<Object?> get props => [task, isDone];
}

final class SupertaskViewSubtaskCreationRequested extends SupertaskViewEvent {
  const SupertaskViewSubtaskCreationRequested();
}
