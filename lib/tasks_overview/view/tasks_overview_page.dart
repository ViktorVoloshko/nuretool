import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuretool/l10n/app_localizations.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

import '../tasks_overview.dart';
import '../../supertask_view/supertask_view.dart';

class TasksOverviewPage extends StatelessWidget {
  const TasksOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => TasksOverviewBloc(
            tasksRepository: context.read<TasksRepository>(),
            universityRepository: context.read<UniversityRepository>(),
          )..add(const TasksOverviewSubscriptionRequested()),
      child: BlocListener<TasksOverviewBloc, TasksOverviewState>(
        listener: (context, state) async {
          if (state is TasksOverviewSupertaskCreated) {
            await Future.delayed(Durations.short1);
            if (!context.mounted) return;
            Navigator.push(
              context,
              SupertaskViewPage.route(initialTaskID: state.supertaskID),
            );
          }
        },
        child: const TasksOverviewView(),
      ),
    );
  }
}

class TasksOverviewView extends StatelessWidget {
  const TasksOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksOverviewBloc, TasksOverviewState>(
      builder: (context, state) {
        return Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: Text(AppLocalizations.of(context)!.tasks),
                  actions: [
                    IconButton(
                      onPressed:
                          () => context.read<TasksOverviewBloc>().add(
                            TasksOverviewGenerationRequested(),
                          ),
                      icon: Icon(Icons.refresh),
                    ),
                  ],
                ),
                switch (state) {
                  TasksOverviewInitial() => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  TasksOverviewLoading() => const SliverFillRemaining(
                    hasScrollBody: false,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  TasksOverviewFailure() => SliverFillRemaining(
                    hasScrollBody: false,
                    child: ErrorSupertasksWidget(message: state.message),
                  ),
                  TasksOverviewSuccess() =>
                    state.tasks.isEmpty
                        ? SliverFillRemaining(
                          hasScrollBody: false,
                          child: NoSupertasksWidget(),
                        )
                        : SliverList.builder(
                          itemCount: state.tasks.length,
                          itemBuilder:
                              (_, index) => SupertasksListItem(
                                supertask: state.tasks[index],
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      SupertaskViewPage.route(
                                        initialTaskID: state.tasks[index].id,
                                      ),
                                    ),
                                onCheckboxTapped:
                                    (value) =>
                                        context.read<TasksOverviewBloc>().add(
                                          TasksOverviewSupertaskCheckboxToggled(
                                            task: state.tasks[index],
                                            isDone: value!,
                                          ),
                                        ),
                              ),
                        ),
                },
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed:
                      () => context.read<TasksOverviewBloc>().add(
                        const TasksOverviewCreationRequested(),
                      ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
