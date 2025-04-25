import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';

part 'supertask_view_event.dart';
part 'supertask_view_state.dart';

class SupertaskViewBloc extends Bloc<SupertaskViewEvent, SupertaskViewState> {
  SupertaskViewBloc({required tasksRepository, required Supertask? initialTask})
    : _tasksRepository = tasksRepository,
      super(
        initialTask == null
            ? SupertaskViewFailure(
              subtasks: [],
              error: SupertaskViewError.emptyTitle,
            )
            : SupertaskViewSuccess(
              initialTask: initialTask,
              title: initialTask.title,
              type: initialTask.type,
              deadline: initialTask.deadline,
              subtasks: initialTask.subtasks,
            ),
      ) {
    on<SupertaskViewTitleChanged>(_onTitleChanged);
    on<SupertaskViewTypeChanged>(_onTypeChanged);
    on<SupertaskViewDeadlineChanged>(_onDeadlineChanged);
    on<SupertaskViewSubtasksChanged>(_onSubtaskChanged);
    on<SupertaskViewChangesSubmitted>(_onChangesSubmitted);
    on<SupertaskViewDeleteRequested>(_onDeleteRequested);
  }

  final TasksRepository _tasksRepository;

  void _onTitleChanged(
    SupertaskViewTitleChanged event,
    Emitter<SupertaskViewState> emit,
  ) =>
      event.title.isEmpty
          ? emit(
            SupertaskViewFailure(
              initialTask: state.initialTask,
              title: event.title,
              type: state.type,
              deadline: state.deadline,
              subtasks: state.subtasks,
              error: SupertaskViewError.emptyTitle,
            ),
          )
          : emit(
            SupertaskViewSuccess(
              initialTask: state.initialTask,
              title: event.title,
              type: state.type,
              deadline: state.deadline,
              subtasks: state.subtasks,
            ),
          );

  void _onTypeChanged(
    SupertaskViewTypeChanged event,
    Emitter<SupertaskViewState> emit,
  ) =>
      event.type == null
          ? emit(state.copyWithoutType())
          : emit(state.copyWith(type: event.type));

  void _onDeadlineChanged(
    SupertaskViewDeadlineChanged event,
    Emitter<SupertaskViewState> emit,
  ) =>
      event.deadline == null
          ? emit(state.copyWithoutDeadline())
          : emit(state.copyWith(deadline: event.deadline));

  void _onSubtaskChanged(
    SupertaskViewSubtasksChanged event,
    Emitter<SupertaskViewState> emit,
  ) => emit(state.copyWith(subtasks: event.subtasks));

  void _onChangesSubmitted(
    SupertaskViewChangesSubmitted event,
    Emitter<SupertaskViewState> emit,
  ) {
    if (state is SupertaskViewSuccess) {
      _tasksRepository.saveSupertask(
        state.initialTask != null
            ? state.initialTask!.copyWith(
              title: state.title,
              type: state.type,
              deadline: state.deadline,
              subtasks: state.subtasks,
            )
            : Supertask(
              title: state.title,
              isDone: false,
              isCustom: true,
              type: state.type,
              deadline: state.deadline,
              subtasks: state.subtasks,
            ),
      );
      emit(
        SupertaskViewChangesSuccessful(
          initialTask: state.initialTask,
          title: state.title,
          type: state.type,
          deadline: state.deadline,
          subtasks: state.subtasks,
        ),
      );
    }
  }

  void _onDeleteRequested(
    SupertaskViewDeleteRequested event,
    Emitter<SupertaskViewState> emit,
  ) {
    // TODO: Implement task deletion
    throw UnimplementedError('delete not yet implemented');
  }
}
