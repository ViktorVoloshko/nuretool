import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuretool/task_view/bloc/task_view_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../task_view.dart';
import '../../l10n/app_localizations.dart';

class TaskViewPage extends StatelessWidget {
  const TaskViewPage({super.key, this.taskID, required this.supertaskID});

  final int? taskID;
  final int supertaskID;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              TaskViewBloc(tasksRepository: context.read<TasksRepository>())
                ..add(
                  TaskViewSubscriptionRequested(
                    taskID: taskID,
                    supertaskID: supertaskID,
                  ),
                ),
      child: const TaskViewView(),
    );
  }
}

class TaskViewView extends StatelessWidget {
  const TaskViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskViewBloc, TaskViewState>(
      builder:
          (context, state) => SizedBox(
            height: 180.0,
            child: switch (state) {
              TaskViewInitial() => const Center(
                child: CircularProgressIndicator(),
              ),
              TaskViewLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              TaskViewFailure() => throw UnimplementedError(),
              TaskViewSuccess() => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TaskTitleField(
                    initialValue: state.task.title,
                    errorText: switch (state.titleError) {
                      null => null,
                      TitleError.emptyOrWhitespace =>
                        AppLocalizations.of(context)!.titleEmptyOrWhitespace,
                    },
                    onChanged:
                        (value) => context.read<TaskViewBloc>().add(
                          TaskViewDataChanged(
                            title: value!,
                            type: state.task.type,
                            deadline: state.task.deadline,
                          ),
                        ),
                  ),
                  TaskDeadlineField(
                    deadline: state.task.deadline,
                    onDeadlineChanged:
                        (value) => context.read<TaskViewBloc>().add(
                          TaskViewDataChanged(
                            title: state.task.title,
                            type: state.task.type,
                            deadline: value,
                          ),
                        ),
                  ),
                  TaskTypeSelectionWidget(
                    selected: state.task.type,
                    onSelectionChanged:
                        (value) => context.read<TaskViewBloc>().add(
                          TaskViewDataChanged(
                            title: state.task.title,
                            type: value.first,
                            deadline: state.task.deadline,
                          ),
                        ),
                  ),
                ],
              ),
            },
          ),
    );
  }
}
