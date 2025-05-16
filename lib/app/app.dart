import 'package:drift_db/drift_db.dart';
import 'package:events_api/events_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groups_api/groups_api.dart';
import 'package:nuretool/home/view/view.dart';
import 'package:rooms_api/rooms_api.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:tasks_repository/tasks_repository.dart';
import 'package:teachers_api/teachers_api.dart';
import 'package:university_repository/university_repository.dart';
import 'package:settings_storage/settings_storage.dart';

import '../l10n/app_localizations.dart';
import 'cubit/app_cubit.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.createUniversityRepository,
    required this.createTasksRepository,
    required this.createSettingsRepository,
    required this.driftDB,
    required this.settingsStorage,
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
    required DriftDB driftDB,
  })
  createUniversityRepository;
  final TasksRepository Function({required DriftDB driftDB})
  createTasksRepository;
  final SettingsRepository Function({required SettingsStorage settingsStorage})
  createSettingsRepository;

  final DriftDB driftDB;
  final SettingsStorage settingsStorage;
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
                driftDB: driftDB,
                eventsApi: eventsApi,
                groupsApi: groupsApi,
                teachersApi: teachersApi,
                roomsApi: roomsApi,
              ),
          dispose: (repository) => repository.dispose(),
        ),
        RepositoryProvider<TasksRepository>(
          create: (_) => createTasksRepository(driftDB: driftDB),
          dispose: (repository) => repository.dispose(),
        ),
        RepositoryProvider<SettingsRepository>(
          create:
              (_) => createSettingsRepository(settingsStorage: settingsStorage),
          dispose: (repository) => repository.dispose(),
          lazy: false,
        ),
      ],
      child: BlocProvider(
        create:
            (context) => AppCubit(
              settingsRepository: context.read<SettingsRepository>(),
            ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      themeMode: fromSettings(context.watch<AppCubit>().state.theme),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

ThemeMode fromSettings(AppTheme theme) => switch (theme) {
  AppTheme.system => ThemeMode.system,
  AppTheme.light => ThemeMode.light,
  AppTheme.dark => ThemeMode.dark,
};
