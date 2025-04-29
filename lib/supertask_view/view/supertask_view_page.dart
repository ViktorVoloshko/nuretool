import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuretool/l10n/app_localizations.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../supertask_view.dart';

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
      listener: (context, state) {
        if (state is SupertaskViewExited) {
          Navigator.of(context).pop();
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
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: Text(AppLocalizations.of(context)!.supertasksEdit),
              ),
              if (state is SupertaskViewSuccess)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TaskTitleField(
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
                        TaskDeadlineField(
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
                SupertaskViewSuccess() =>
                  state.task.subtasks.isEmpty
                      ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: NoSubtasksWidget(),
                      )
                      : SliverList.builder(
                        itemCount: state.task.subtasks.length,
                        itemBuilder:
                            (context, index) => Padding(
                              padding: const EdgeInsets.only(
                                left: 4.0,
                                right: 4.0,
                              ),
                              child: SubtaskListItem(
                                task: state.task.subtasks[index],
                                onTap: () {},
                                onCheckboxTapped:
                                    (value) =>
                                        context.read<SupertaskViewBloc>().add(
                                          SupertaskViewSubtaskCheckboxToggled(
                                            task: state.task.subtasks[index],
                                            isDone: value!,
                                          ),
                                        ),
                              ),
                            ),
                      ),
                SupertaskViewExited() => const SliverFillRemaining(
                  hasScrollBody: false,
                  child: CircularProgressIndicator(),
                ),
              },
            ],
          ),
        );
      },
    );
  }
}
