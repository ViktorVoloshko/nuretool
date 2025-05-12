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

final class TasksOverviewSuccess extends TasksOverviewState {
  const TasksOverviewSuccess({required this.tasks});

  final List<Supertask> tasks;

  @override
  List<Object?> get props => [tasks];
}

final class TasksOverviewSupertaskCreated extends TasksOverviewSuccess {
  const TasksOverviewSupertaskCreated({
    required super.tasks,
    required this.supertaskID,
  });

  final int supertaskID;

  @override
  List<Object?> get props => [super.props, supertaskID];
}
