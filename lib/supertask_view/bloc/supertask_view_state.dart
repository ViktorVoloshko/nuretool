part of 'supertask_view_bloc.dart';

sealed class SupertaskViewState extends Equatable {
  /// As Dart prohibits non-const default fields, [subtasks] has to be set
  /// manually to empty [List] when creating new [Supertask].
  const SupertaskViewState({
    this.initialTask,
    this.title = '',
    this.type,
    this.deadline,
    required this.subtasks,
  });

  final Supertask? initialTask;
  final String title;
  final TaskType? type;
  final DateTime? deadline;
  final List<Task> subtasks;

  SupertaskViewState copyWith({
    String? title,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
  });

  SupertaskViewState copyWithoutType();
  SupertaskViewState copyWithoutDeadline();

  @override
  List<Object?> get props => [initialTask, title, type, deadline, subtasks];
}

final class SupertaskViewSuccess extends SupertaskViewState {
  const SupertaskViewSuccess({
    super.initialTask,
    super.title,
    super.type,
    super.deadline,
    required super.subtasks,
  });

  SupertaskViewFailure copyAsFailure({
    String? title,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
    required SupertaskViewError error,
  }) => SupertaskViewFailure(
    initialTask: initialTask,
    title: title ?? this.title,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
    subtasks: subtasks ?? this.subtasks,
    error: error,
  );

  @override
  SupertaskViewSuccess copyWith({
    String? title,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
  }) => SupertaskViewSuccess(
    initialTask: initialTask,
    title: title ?? this.title,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
    subtasks: subtasks ?? this.subtasks,
  );

  @override
  SupertaskViewSuccess copyWithoutType() => SupertaskViewSuccess(
    initialTask: initialTask,
    title: title,
    type: null,
    deadline: deadline,
    subtasks: subtasks,
  );

  @override
  SupertaskViewSuccess copyWithoutDeadline() => SupertaskViewSuccess(
    initialTask: initialTask,
    title: title,
    type: type,
    deadline: null,
    subtasks: subtasks,
  );
}

final class SupertaskViewFailure extends SupertaskViewState {
  const SupertaskViewFailure({
    super.initialTask,
    super.title,
    super.type,
    super.deadline,
    required super.subtasks,
    required this.error,
  });

  final SupertaskViewError error;

  SupertaskViewSuccess copyAsSuccess({
    String? title,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
  }) => SupertaskViewSuccess(
    initialTask: initialTask,
    title: title ?? this.title,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
    subtasks: subtasks ?? this.subtasks,
  );

  @override
  SupertaskViewFailure copyWith({
    String? title,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
    SupertaskViewError? error,
  }) => SupertaskViewFailure(
    initialTask: initialTask,
    title: title ?? this.title,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
    subtasks: subtasks ?? this.subtasks,
    error: error ?? this.error,
  );

  @override
  SupertaskViewFailure copyWithoutType() => SupertaskViewFailure(
    initialTask: initialTask,
    title: title,
    type: null,
    deadline: deadline,
    subtasks: subtasks,
    error: error,
  );

  @override
  SupertaskViewFailure copyWithoutDeadline() => SupertaskViewFailure(
    initialTask: initialTask,
    title: title,
    type: type,
    deadline: null,
    subtasks: subtasks,
    error: error,
  );

  @override
  List<Object?> get props => [super.props, error];
}

final class SupertaskViewChangesSuccessful extends SupertaskViewState {
  const SupertaskViewChangesSuccessful({
    super.initialTask,
    required super.title,
    required super.type,
    required super.deadline,
    required super.subtasks,
  });

  @override
  SupertaskViewChangesSuccessful copyWith({
    String? title,
    TaskType? type,
    DateTime? deadline,
    List<Task>? subtasks,
    SupertaskViewError? error,
  }) => SupertaskViewChangesSuccessful(
    initialTask: initialTask,
    title: title ?? this.title,
    type: type ?? this.type,
    deadline: deadline ?? this.deadline,
    subtasks: subtasks ?? this.subtasks,
  );

  @override
  SupertaskViewChangesSuccessful copyWithoutType() =>
      SupertaskViewChangesSuccessful(
        initialTask: initialTask,
        title: title,
        type: null,
        deadline: deadline,
        subtasks: subtasks,
      );

  @override
  SupertaskViewChangesSuccessful copyWithoutDeadline() =>
      SupertaskViewChangesSuccessful(
        initialTask: initialTask,
        title: title,
        type: type,
        deadline: null,
        subtasks: subtasks,
      );
}

enum SupertaskViewError { emptyTitle }
