import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:university_repository/university_repository.dart';

import '../bloc/tasks_overview_bloc.dart';

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
              title: Text('Tasks'),
              actions: [
                IconButton(
                  onPressed: () async {
                    context.read<TasksOverviewBloc>().add(
                      TasksOverviewGenerationRequested(groupID: 9311133),
                    );
                  },
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
            switch (state) {
              TasksOverviewInitial() => SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              TasksOverviewLoading() => SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              TasksOverviewFailure() => throw UnimplementedError(),
              TasksOverviewNoSupertasksPresent() => SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.indeterminate_check_box,
                        color: Theme.of(context).disabledColor,
                        size: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'No tasks',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              TasksOverviewSupertasksPresent() => throw UnimplementedError(),
            },
          ],
        );
      },
    );
  }
}
