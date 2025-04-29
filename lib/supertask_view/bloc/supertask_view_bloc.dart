import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';

part 'supertask_view_event.dart';
part 'supertask_view_state.dart';

class SupertaskViewBloc extends Bloc<SupertaskViewEvent, SupertaskViewState> {
  SupertaskViewBloc({required TasksRepository tasksRepository})
    : _tasksRepository = tasksRepository,
      super(const SupertaskViewInitial()) {
    on<SupertaskViewSubscriptionRequested>(_onSubscriptionRequested);
    on<SupertaskViewDataChanged>(_onDataChanged);
    on<SupertaskViewSubtaskCheckboxToggled>(_onSubtaskCheckboxToggled);
  }

  final TasksRepository _tasksRepository;

  Future<void> _onSubscriptionRequested(
    SupertaskViewSubscriptionRequested event,
    Emitter<SupertaskViewState> emit,
  ) async {
    emit(const SupertaskViewLoading());

    int? taskID = event.taskID;

    taskID ??= await _tasksRepository.saveSupertask(
      Supertask(
        title: '',
        isDone: false,
        isCustom: true,
        type: null,
        deadline: null,
        subtasks: [],
      ),
    );

    await emit.forEach(
      _tasksRepository.tasks,
      onData:
          (supertasks) => SupertaskViewSuccess(
            task: supertasks.firstWhere((task) => task.id == taskID),
            titleError:
                _isTitleValid(
                      supertasks.firstWhere((task) => task.id == taskID).title,
                    )
                    ? null
                    : TitleError.emptyOrWhitespace,
          ),
    );
  }

  void _onDataChanged(
    SupertaskViewDataChanged event,
    Emitter<SupertaskViewState> emit,
  ) {
    if (!_isTitleValid(event.title)) {
      emit(
        SupertaskViewSuccess(
          task: (state as SupertaskViewSuccess).task,
          titleError: TitleError.emptyOrWhitespace,
        ),
      );
    } else {
      _tasksRepository.saveSupertask(
        (state as SupertaskViewSuccess).task.rewriteWith(
          title: event.title,
          type: event.type,
          deadline: event.deadline,
        ),
      );
    }
  }

  void _onSubtaskCheckboxToggled(
    SupertaskViewSubtaskCheckboxToggled event,
    Emitter<SupertaskViewState> emit,
  ) => _tasksRepository.saveTask(
    event.task.copyWith(isDone: event.isDone),
    (state as SupertaskViewSuccess).task.id!,
  );

  bool _isTitleValid(String title) => title.trim().isEmpty ? false : true;
}
