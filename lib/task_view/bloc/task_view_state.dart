part of 'task_view_bloc.dart';

sealed class TaskViewState extends Equatable {
  const TaskViewState();

  @override
  List<Object?> get props => [];
}

final class TaskViewInitial extends TaskViewState {
  const TaskViewInitial();
}

final class TaskViewLoading extends TaskViewState {
  const TaskViewLoading();
}

final class TaskViewFailure extends TaskViewState {
  const TaskViewFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class TaskViewSuccess extends TaskViewState {
  const TaskViewSuccess({required this.task, this.titleError});

  final Task task;
  final TitleError? titleError;

  @override
  List<Object?> get props => [task, titleError];
}

enum TitleError { emptyOrWhitespace }
