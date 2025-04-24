part of 'tasks_overview_bloc.dart';

sealed class TasksOverviewEvent extends Equatable {
  const TasksOverviewEvent();

  @override
  List<Object> get props => [];
}

final class TasksOverviewSubscriptionRequested extends TasksOverviewEvent {
  const TasksOverviewSubscriptionRequested();
}

final class TasksOverviewGenerationRequested extends TasksOverviewEvent {
  const TasksOverviewGenerationRequested({required this.groupID});

  final int groupID;
}

final class TasksOverviewSupertaskCheckboxToggled extends TasksOverviewEvent {
  const TasksOverviewSupertaskCheckboxToggled({
    required this.task,
    required this.isDone,
  });

  final Supertask task;
  final bool isDone;

  @override
  List<Object> get props => [task, isDone];
}

final class TasksOverviewSupertaskDeleted extends TasksOverviewEvent {
  const TasksOverviewSupertaskDeleted({required this.task});

  final Supertask task;

  @override
  List<Object> get props => [task];
}
