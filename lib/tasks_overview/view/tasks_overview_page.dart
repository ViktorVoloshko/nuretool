import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuretool/l10n/app_localizations.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

import '../bloc/tasks_overview_bloc.dart';
import '../widgets/widgets.dart';

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
      child: const TasksOverviewView(),
    );
  }
}

class TasksOverviewView extends StatelessWidget {
  const TasksOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksOverviewBloc, TasksOverviewState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar.large(
              title: Text(AppLocalizations.of(context)!.tasks),
              actions: [
                IconButton(
                  onPressed:
                      () => context.read<TasksOverviewBloc>().add(
                        TasksOverviewGenerationRequested(groupID: 9311133),
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
              TasksOverviewFailure() => throw UnimplementedError(),
              TasksOverviewNoSupertasksPresent() => SliverFillRemaining(
                hasScrollBody: false,
                child: NoSupertasksWidget(),
              ),
              TasksOverviewSupertasksPresent() => SliverList.builder(
                itemCount: state.tasks.length,
                itemBuilder:
                    (_, index) => Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: SupertasksListItem(
                        supertask: state.tasks[index],
                        onClicked: () {},
                        onCheckboxClicked: (_) {},
                      ),
                    ),
              ),
            },
          ],
        );
      },
    );
  }
}
