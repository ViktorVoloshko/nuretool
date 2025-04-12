part of 'tasks_overview_bloc.dart';

sealed class TasksOverviewState extends Equatable {
  const TasksOverviewState();

  @override
  List<Object?> get props => [];
}

final class TasksOverviewInitial extends TasksOverviewState {
  const TasksOverviewInitial();
}

final class TasksOverviewLoading extends TasksOverviewState {
  const TasksOverviewLoading();
}

final class TasksOverviewFailure extends TasksOverviewState {
  const TasksOverviewFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class TasksOverviewNoSupertasksPresent extends TasksOverviewState {
  const TasksOverviewNoSupertasksPresent();
}

final class TasksOverviewSupertasksPresent extends TasksOverviewState {
  const TasksOverviewSupertasksPresent({required this.tasks});

  final List<Supertask> tasks;

  @override
  List<Object?> get props => [tasks];
}
