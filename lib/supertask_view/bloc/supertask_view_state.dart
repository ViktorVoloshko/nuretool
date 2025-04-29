part of 'supertask_view_bloc.dart';

sealed class SupertaskViewState extends Equatable {
  const SupertaskViewState();

  @override
  List<Object?> get props => [];
}

final class SupertaskViewInitial extends SupertaskViewState {
  const SupertaskViewInitial();
}

final class SupertaskViewLoading extends SupertaskViewState {
  const SupertaskViewLoading();
}

final class SupertaskViewFailure extends SupertaskViewState {
  const SupertaskViewFailure();
}

final class SupertaskViewSuccess extends SupertaskViewState {
  const SupertaskViewSuccess({required this.task, this.titleError});

  final Supertask task;
  final TitleError? titleError;

  @override
  List<Object?> get props => [task, titleError];
}

final class SupertaskViewExited extends SupertaskViewState {
  const SupertaskViewExited();
}

enum TitleError { emptyOrWhitespace }
