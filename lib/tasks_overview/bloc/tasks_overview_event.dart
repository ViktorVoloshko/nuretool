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

final class TasksOverviewSupertaskCompletionToggled extends TasksOverviewEvent {
  const TasksOverviewSupertaskCompletionToggled({
    required this.task,
    required this.isCompleted,
  });

  final Supertask task;
  final bool isCompleted;

  @override
  List<Object> get props => [task, isCompleted];
}

final class TasksOverviewSupertaskDeleted extends TasksOverviewEvent {
  const TasksOverviewSupertaskDeleted({required this.task});

  final Supertask task;

  @override
  List<Object> get props => [task];
}
