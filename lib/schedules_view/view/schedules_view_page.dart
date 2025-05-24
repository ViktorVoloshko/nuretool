import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/schedules_view_cubit.dart';
import '../widgets/widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../entity_selection/entity_selection.dart';

class SchedulesViewPage extends StatelessWidget {
  const SchedulesViewPage({super.key});

  static Route<ScheduleSelection?> route() => MaterialPageRoute(
    builder: (context) {
      return BlocProvider(
        create:
            (context) => SchedulesViewCubit(
              universityRepository: context.read<UniversityRepository>(),
              settingsRepository: context.read<SettingsRepository>(),
            ),
        child: const SchedulesViewPage(),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return const SchedulesViewView();
  }
}

class SchedulesViewView extends StatelessWidget {
  const SchedulesViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchedulesViewCubit, SchedulesViewState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.large(
                title: Text(AppLocalizations.of(context)!.schedulesManage),
              ),
              SliverToBoxAdapter(
                child: SchedulesTypesDivider(
                  typeName: AppLocalizations.of(context)!.groups,
                  onAdd:
                      () =>
                          Navigator.push(context, EntitySelectionPage.route()),
                ),
              ),
              SliverList.builder(
                itemCount: state.groupSchedules.length,
                itemBuilder:
                    (context, index) => SchedulesListItem(
                      title: state.groupSchedules[index].name,
                      // lastUpdated: state.groupSchedules[index].lastUpdated,
                      onRefresh: () {},
                      onDelete:
                          () => context
                              .read<SchedulesViewCubit>()
                              .deleteGroupSchedule(
                                state.groupSchedules[index].id,
                              ),
                    ),
              ),
              SliverToBoxAdapter(
                child: SchedulesTypesDivider(
                  typeName: AppLocalizations.of(context)!.teachers,
                  onAdd: () {},
                ),
              ),
              SliverList.builder(
                itemCount: state.teacherSchedules.length,
                itemBuilder:
                    (context, index) => SchedulesListItem(
                      title: state.teacherSchedules[index].name,
                      // lastUpdated: state.teacherSchedules[index].lastUpdated,
                      onTap: () {},
                      onRefresh: () {},
                      onDelete: () {},
                    ),
              ),
              SliverToBoxAdapter(
                child: SchedulesTypesDivider(
                  typeName: AppLocalizations.of(context)!.rooms,
                  onAdd: () {},
                ),
              ),
              SliverList.builder(
                itemCount: state.roomSchedules.length,
                itemBuilder:
                    (context, index) => SchedulesListItem(
                      title: state.roomSchedules[index].name,
                      // lastUpdated: state.roomSchedules[index].lastUpdated,
                      onTap: () {},
                      onRefresh: () {},
                      onDelete: () {},
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
