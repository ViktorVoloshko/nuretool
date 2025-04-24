import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

part 'tasks_overview_event.dart';
part 'tasks_overview_state.dart';

class TasksOverviewBloc extends Bloc<TasksOverviewEvent, TasksOverviewState> {
  TasksOverviewBloc({
    required TasksRepository tasksRepository,
    required UniversityRepository universityRepository,
  }) : _tasksRepository = tasksRepository,
       _universityRepository = universityRepository,
       super(TasksOverviewInitial()) {
    on<TasksOverviewSubscriptionRequested>(_onSubscriptionRequested);
    on<TasksOverviewGenerationRequested>(_onGenerationRequested);
    on<TasksOverviewSupertaskCheckboxToggled>(_onCheckboxToggled);
  }

  final TasksRepository _tasksRepository;
  final UniversityRepository _universityRepository;

  Future<void> _onSubscriptionRequested(
    TasksOverviewSubscriptionRequested event,
    Emitter<TasksOverviewState> emit,
  ) async {
    emit(const TasksOverviewLoading());

    await emit.forEach(
      _tasksRepository.tasks,
      onData:
          (supertasks) =>
              supertasks.isEmpty
                  ? const TasksOverviewNoSupertasksPresent()
                  : TasksOverviewSupertasksPresent(tasks: supertasks),
      onError: (error, _) => TasksOverviewFailure(message: error.toString()),
    );
  }

  Future<void> _onGenerationRequested(
    TasksOverviewGenerationRequested event,
    Emitter<TasksOverviewState> emit,
  ) async {
    final result = <Supertask>[];

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
      final subjectTasks = <Task>[
        ..._createTasksForType(subjectEvents, EventBaseType.practice, 1),
        ..._createTasksForType(subjectEvents, EventBaseType.laboratory, 2),
        ..._createTasksForType(subjectEvents, EventBaseType.exam),
      ];
      result.add(
        Supertask(
          title: subject.title,
          isDone: false,
          isCustom: false,
          type: TaskType.subject,
          deadline: null,
          subtasks: subjectTasks,
        ),
      );
    }

    _tasksRepository.saveSupertasks(result);
  }

  Future<void> _onCheckboxToggled(
    TasksOverviewSupertaskCheckboxToggled event,
    Emitter<TasksOverviewState> emit,
  ) =>
      _tasksRepository.saveSupertask(event.task.copyWith(isDone: event.isDone));

  List<Task> _createTasksForType(
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
        Task(
          title: '#1',
          isDone: false,
          isCustom: false,
          type: type.toTaskType(),
          deadline: examEvents.last.endTime,
        ),
      ];
    }

    final result = <Task>[];
    final eventsOfType =
        subjectEvents.where((event) => event.baseType == type).toList();
    if (eventsOfType.isEmpty) return const [];

    for (int index = 0; index < eventsOfType.length; index += eventsPerTask) {
      result.add(
        Task(
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
  TaskType toTaskType() => switch (this) {
    EventBaseType.practice => TaskType.practice,
    EventBaseType.laboratory => TaskType.laboratory,
    EventBaseType.test => TaskType.test,
    EventBaseType.exam => TaskType.exam,
    _ => throw Exception("It shouldn't be possible to generate task for $this"),
  };
}
