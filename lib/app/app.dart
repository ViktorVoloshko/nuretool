import 'package:events_api/events_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groups_api/groups_api.dart';
import 'package:local_db_api/local_db_api.dart';
import 'package:nuretool/home/view/view.dart';
import 'package:rooms_api/rooms_api.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:teachers_api/teachers_api.dart';
import 'package:university_repository/university_repository.dart';

import '../l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.createUniversityRepository,
    required this.createTasksRepository,
    required this.localDBApi,
    required this.eventsApi,
    required this.groupsApi,
    required this.teachersApi,
    required this.roomsApi,
  });

  final UniversityRepository Function({
    required EventsApi eventsApi,
    required GroupsApi groupsApi,
    required TeachersApi teachersApi,
    required RoomsApi roomsApi,
    required LocalDBApi localDBApi,
  })
  createUniversityRepository;
  final TasksRepository Function({required LocalDBApi localDBApi})
  createTasksRepository;

  final LocalDBApi localDBApi;
  final EventsApi eventsApi;
  final GroupsApi groupsApi;
  final TeachersApi teachersApi;
  final RoomsApi roomsApi;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UniversityRepository>(
          create:
              (_) => createUniversityRepository(
                localDBApi: localDBApi,
                eventsApi: eventsApi,
                groupsApi: groupsApi,
                teachersApi: teachersApi,
                roomsApi: roomsApi,
              ),
          dispose: (repository) => repository.dispose(),
        ),
        RepositoryProvider<TasksRepository>(
          create: (_) => createTasksRepository(localDBApi: localDBApi),
          dispose: (repository) => repository.dispose(),
        ),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Themes
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      home: const HomePage(),
    );
  }
}
