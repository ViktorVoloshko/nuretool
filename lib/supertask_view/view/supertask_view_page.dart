import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../supertask_view.dart';
import '../../l10n/app_localizations.dart';
import '../../task_view/task_view.dart' hide TitleError;

class SupertaskViewPage extends StatelessWidget {
  const SupertaskViewPage({super.key});

  static Route<void> route({int? initialTaskID}) => MaterialPageRoute(
    builder:
        (context) => BlocProvider<SupertaskViewBloc>(
          create:
              (context) => SupertaskViewBloc(
                tasksRepository: context.read<TasksRepository>(),
              )..add(SupertaskViewSubscriptionRequested(taskID: initialTaskID)),
          child: const SupertaskViewPage(),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupertaskViewBloc, SupertaskViewState>(
      listener: (context, state) async {
        if (state is SupertaskViewSupertaskDeleted) {
          Navigator.of(context).pop();
        } else if (state is SupertaskViewSubtaskCreated) {
          await Future.delayed(Durations.short1);
          if (!context.mounted) return;
          showModalBottomSheet(
            context: context,
            enableDrag: true,
            showDragHandle: true,
            builder:
                (context) => Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TaskViewPage(
                    supertaskID: state.task.id!,
                    taskID: state.subtaskID,
                  ),
                ),
          );
        }
      },
      child: const SupertaskViewView(),
    );
  }
}

class SupertaskViewView extends StatelessWidget {
  const SupertaskViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupertaskViewBloc, SupertaskViewState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButton:
              (state is! SupertaskViewSuccess)
                  ? null
                  : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed:
                        () => context.read<SupertaskViewBloc>().add(
                          const SupertaskViewSubtaskCreationRequested(),
                        ),
                  ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: Text(AppLocalizations.of(context)!.supertasksEdit),
                actions: [
                  if (state is SupertaskViewSuccess)
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed:
                          () => context.read<SupertaskViewBloc>().add(
                            SupertaskViewSupertaskDeletionRequested(
                              id: state.task.id!,
                            ),
                          ),
                    ),
                ],
              ),
              if (state is SupertaskViewSuccess)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SupertaskTitleField(
                          initialValue: state.task.title,
                          errorText: switch (state.titleError) {
                            null => null,
                            TitleError.emptyOrWhitespace =>
                              AppLocalizations.of(
                                context,
                              )!.titleEmptyOrWhitespace,
                          },
                          onChanged:
                              (value) => context.read<SupertaskViewBloc>().add(
                                SupertaskViewDataChanged(
                                  title: value!,
                                  type: state.task.type,
                                  deadline: state.task.deadline,
                                ),
                              ),
                        ),
                        SupertaskDeadlineField(
                          deadline: state.task.deadline,
                          onDeadlineChanged:
                              (value) => context.read<SupertaskViewBloc>().add(
                                SupertaskViewDataChanged(
                                  title: state.task.title,
                                  type: state.task.type,
                                  deadline: value,
                                ),
                              ),
                        ),
                        SupertaskTypeSelectionWidget(
                          selected: state.task.type,
                          onSelectionChanged:
                              (selection) =>
                                  context.read<SupertaskViewBloc>().add(
                                    SupertaskViewDataChanged(
                                      title: state.task.title,
                                      type: selection.first,
                                      deadline: state.task.deadline,
                                    ),
                                  ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0, left: 8.0),
                          child: Text(
                            AppLocalizations.of(context)!.subtasks,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              switch (state) {
                SupertaskViewInitial() => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: CircularProgressIndicator(),
                ),
                SupertaskViewLoading() => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: CircularProgressIndicator(),
                ),
                SupertaskViewFailure() => SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorSubtasksWidget(),
                ),
                SupertaskViewSupertaskDeleted() => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: CircularProgressIndicator(),
                ),
                SupertaskViewSuccess() =>
                  state.task.subtasks.isEmpty
                      ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: NoSubtasksWidget(),
                      )
                      : SliverList.builder(
                        itemCount: state.task.subtasks.length,
                        itemBuilder:
                            (context, index) => SubtaskListItem(
                              task: state.task.subtasks[index],
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  enableDrag: true,
                                  showDragHandle: true,
                                  builder:
                                      (context) => Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: TaskViewPage(
                                          taskID: state.task.subtasks[index].id,
                                          supertaskID: state.task.id!,
                                        ),
                                      ),
                                );
                              },
                              onCheckboxTapped:
                                  (value) =>
                                      context.read<SupertaskViewBloc>().add(
                                        SupertaskViewSubtaskCheckboxToggled(
                                          task: state.task.subtasks[index],
                                          isDone: value!,
                                        ),
                                      ),
                              onDeleteTapped:
                                  () => context.read<SupertaskViewBloc>().add(
                                    SupertaskViewSubtaskDeletionRequested(
                                      id: state.task.subtasks[index].id!,
                                    ),
                                  ),
                            ),
                      ),
              },
            ],
          ),
        );
      },
    );
  }
}
