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
              id: e.id!,
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

    final groupEvents =
        (await _universityRepository.events.first)
            .where((e) => e.groups.contains(event.groupID))
            .toList();
    final subjectIDs = <int>{};
    subjectIDs.addAll(groupEvents.map((e) => e.subject));
    final subjects =
        (await _universityRepository.subjects.first)
            .where((subject) => subjectIDs.contains(subject.id))
            .toList();

    for (final subject in subjects) {
      final subjectEvents = groupEvents.where(
        (event) => event.subject == subject.id,
      );
      final subjectTasks = <repo.Task>[
        ..._createTasksForType(subjectEvents, EventBaseType.practice, 1),
        ..._createTasksForType(subjectEvents, EventBaseType.laboratory, 2),
        ..._createTasksForType(subjectEvents, EventBaseType.exam),
      ];
      result.add(
        repo.Supertask(
          title: subject.title,
          isDone: false,
          isCustom: false,
          type: repo.TaskType.subject,
          deadline: null,
          subtasks: subjectTasks,
        ),
      );
    }

    _tasksRepository.saveSupertasks(result);
  }

  List<repo.Task> _createTasksForType(
    Iterable<Event> subjectEvents,
    EventBaseType type, [
    int? eventsPerTask,
  ]) {
    if (subjectEvents.isEmpty) return const [];
    if (type == EventBaseType.exam) {
      final examEvents = subjectEvents.where(
        (event) => event.baseType == EventBaseType.exam,
      );

      if (examEvents.isEmpty) return const [];

      return [
        repo.Task(
          title: '#1',
          isDone: false,
          isCustom: false,
          type: type.toTaskType(),
          deadline: examEvents.last.endTime,
        ),
      ];
    }

    final result = <repo.Task>[];
    final eventsOfType =
        subjectEvents.where((event) => event.baseType == type).toList();
    if (eventsOfType.isEmpty) return const [];

    for (int index = 0; index < eventsOfType.length; index += eventsPerTask) {
      result.add(
        repo.Task(
          title: '#${(index + eventsPerTask!) ~/ eventsPerTask}',
          isDone: false,
          isCustom: false,
          type: type.toTaskType(),
          deadline:
              ((index + eventsPerTask) < eventsOfType.length)
                  ? eventsOfType[index + eventsPerTask].startTime
                  : eventsOfType[index + eventsPerTask - 1].endTime,
        ),
      );
    }

    return result;
  }
}

extension EventBaseTypeToTaskType on EventBaseType {
  repo.TaskType toTaskType() => switch (this) {
    EventBaseType.practice => repo.TaskType.practice,
    EventBaseType.laboratory => repo.TaskType.laboratory,
    EventBaseType.test => repo.TaskType.test,
    EventBaseType.exam => repo.TaskType.exam,
    _ => throw Exception("It shouldn't be possible to generate task for $this"),
  };
}
