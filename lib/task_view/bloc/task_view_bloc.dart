import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';

part 'task_view_event.dart';
part 'task_view_state.dart';

class TaskViewBloc extends Bloc<TaskViewEvent, TaskViewState> {
  TaskViewBloc({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository,
      super(TaskViewInitial()) {
    on<TaskViewSubscriptionRequested>(_onSubscriptionRequested);
    on<TaskViewDataChanged>(_onDataChanged);
  }

  final TasksRepository _tasksRepository;
  late final int supertaskID;

  Future<void> _onSubscriptionRequested(
    TaskViewSubscriptionRequested event,
    Emitter<TaskViewState> emit,
  ) async {
    emit(const TaskViewLoading());

    supertaskID = event.supertaskID;
    int? taskID = event.taskID;

    taskID ??= await _tasksRepository.saveTask(
      Task(
        title: '',
        isDone: false,
        isCustom: true,
        type: null,
        deadline: null,
      ),
      supertaskID,
    );

    await emit.forEach(
      _tasksRepository.tasks,
      onData: (supertasks) {
        for (final supertask in supertasks) {
          return TaskViewSuccess(
            task: supertask.subtasks.firstWhere(
              (subtask) => subtask.id == taskID,
            ),
            titleError:
                _isTitleValid(
                      supertask.subtasks
                          .firstWhere((subtask) => subtask.id == taskID)
                          .title,
                    )
                    ? null
                    : TitleError.emptyOrWhitespace,
          );
        }
        return TaskViewFailure(message: 'Subtask not found');
      },
    );
  }

  void _onDataChanged(TaskViewDataChanged event, Emitter<TaskViewState> emit) {
    if (!_isTitleValid(event.title)) {
      emit(
        TaskViewSuccess(
          task: (state as TaskViewSuccess).task,
          titleError: TitleError.emptyOrWhitespace,
        ),
      );
    } else {
      _tasksRepository.saveTask(
        (state as TaskViewSuccess).task.rewriteWith(
          title: event.title,
          type: event.type,
          deadline: event.deadline,
        ),
        supertaskID,
      );
    }
  }

  bool _isTitleValid(String title) => title.trim().isEmpty ? false : true;
}
