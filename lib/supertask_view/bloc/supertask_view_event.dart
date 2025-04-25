part of 'supertask_view_bloc.dart';

sealed class SupertaskViewEvent extends Equatable {
  const SupertaskViewEvent();

  @override
  List<Object?> get props => [];
}

final class SupertaskViewTitleChanged extends SupertaskViewEvent {
  const SupertaskViewTitleChanged({required this.title});

  final String title;

  @override
  List<Object> get props => [title];
}

final class SupertaskViewTypeChanged extends SupertaskViewEvent {
  const SupertaskViewTypeChanged({required this.type});

  final TaskType? type;

  @override
  List<Object?> get props => [type];
}

final class SupertaskViewDeadlineChanged extends SupertaskViewEvent {
  const SupertaskViewDeadlineChanged({required this.deadline});

  final DateTime? deadline;

  @override
  List<Object?> get props => [deadline];
}

final class SupertaskViewSubtasksChanged extends SupertaskViewEvent {
  const SupertaskViewSubtasksChanged({required this.subtasks});

  final List<Task> subtasks;

  @override
  List<Object?> get props => [subtasks];
}

final class SupertaskViewChangesSubmitted extends SupertaskViewEvent {
  const SupertaskViewChangesSubmitted();
}

final class SupertaskViewDeleteRequested extends SupertaskViewEvent {
  const SupertaskViewDeleteRequested();
}
