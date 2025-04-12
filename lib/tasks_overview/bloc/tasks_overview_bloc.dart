import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart' as repo;
import 'package:university_repository/university_repository.dart';

import '../models/models.dart';

part 'tasks_overview_event.dart';
part 'tasks_overview_state.dart';

class TasksOverviewBloc extends Bloc<TasksOverviewEvent, TasksOverviewState> {
  TasksOverviewBloc({
    required repo.TasksRepository tasksRepository,
    required UniversityRepository universityRepository,
  }) : _tasksRepository = tasksRepository,
       _universityRepository = universityRepository,
       super(TasksOverviewInitial()) {
    on<TasksOverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<TasksOverviewGenerationRequested>(_onGenerationRequested);
  }

  final repo.TasksRepository _tasksRepository;
  final UniversityRepository _universityRepository;

  Future<void> _onSubscriptionRequested(
    TasksOverviewSubscriptionRequested event,
    Emitter<TasksOverviewState> emit,
  ) async {
    emit(const TasksOverviewLoading());

    await emit.forEach(
      _tasksRepository.tasks,
      onData: (supertasks) {
        final result = <Supertask>[];
        result.addAll(
          supertasks.map(
            (e) => Supertask(
              id: e.id,
              title: e.title,
              isDone: e.isDone,
              subtasksTotal: e.subtasks.length,
              subtasksDone:
                  e.subtasks.where((subtask) => subtask.isDone).length,
              deadline: e.deadline,
              type: e.type?.toVMModel(),
            ),
          ),
        );

        return result.isEmpty
            ? const TasksOverviewNoSupertasksPresent()
            : TasksOverviewSupertasksPresent(tasks: result);
      },
      onError: (error, _) => TasksOverviewFailure(message: error.toString()),
    );
  }

  Future<void> _onGenerationRequested(
    TasksOverviewGenerationRequested event,
    Emitter<TasksOverviewState> emit,
  ) async {
    final result = <repo.Supertask>[];

    // TODO: Group from settings
    final events =
        (await _universityRepository.events.last)
            .where((event) => event.groups.contains(9311133))
            .toList();
    final subjectIDs = <int>{};
    subjectIDs.addAll(events.map((e) => e.subject));
    final subjects =
        (await _universityRepository.subjects.last)
            .where((subject) => subjectIDs.contains(subject.id))
            .toList();

    for (final subject in subjects) {}
  }
}
