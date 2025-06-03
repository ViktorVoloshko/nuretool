import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../../calendar_view/calendar_view.dart';
import '../../tasks_overview/tasks_overview.dart';
import '../../more_view/more_view.dart';
import '../../l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTab = context.select<HomeCubit, HomeTab>(
      (cubit) => cubit.state.tab,
    );

    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedTab.index,
          children: const [
            CalendarViewPage(),
            TasksOverviewPage(),
            MoreViewPage(),
          ],
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
            label: AppLocalizations.of(context)!.calendar,
          ),
          NavigationDestination(
            icon: Icon(Icons.check_box_outlined),
            selectedIcon: Icon(Icons.check_box),
            label: AppLocalizations.of(context)!.tasks,
          ),
          NavigationDestination(
            icon: Icon(Icons.more_horiz_outlined),
            selectedIcon: Icon(Icons.more_horiz),
            label: AppLocalizations.of(context)!.more,
          ),
        ],
      ),
    );
  }
}
