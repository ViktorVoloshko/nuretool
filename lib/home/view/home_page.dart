import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/home_cubit.dart';
import '../../calendar_view/calendar_view.dart';
import '../../tasks_overview/tasks_overview.dart';
import '../../more_view/more_view.dart';
import '../../l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => HomeCubit(
            universityRepository: context.read<UniversityRepository>(),
          )..init(),
      child: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select<HomeCubit, HomeTab>(
      (cubit) => cubit.state.tab,
    );
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      body: SafeArea(
        child: BlocListener<HomeCubit, HomeState>(
          listenWhen:
              (previous, current) => current.universityRepositoryError != null,
          listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.universityRepositoryError!.toMessage(l10n)),
              ),
            );
            context.read<HomeCubit>().clearErrorMessage();
          },
          child: IndexedStack(
            index: selectedTab.index,
            children: const [
              CalendarViewPage(),
              TasksOverviewPage(),
              MoreViewPage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedTab.index,
        onDestinationSelected:
            (value) => context.read<HomeCubit>().setTab(HomeTab.values[value]),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.calendar_today_outlined),
            selectedIcon: Icon(Icons.calendar_today),
            label: l10n.calendar,
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box_outlined),
            selectedIcon: Icon(Icons.check_box),
            label: l10n.tasks,
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz_outlined),
            selectedIcon: Icon(Icons.more_horiz),
            label: l10n.more,
          ),
        ],
      ),
    );
  }
}

extension on UniversityRepositoryError {
  String toMessage(AppLocalizations l10n) => switch (this) {
    UniversityRepositoryError.updateError => l10n.updateError,
  };
}
