import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/schedules_view_cubit.dart';
import '../widgets/widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../entity_selection/entity_selection.dart';

class SchedulesViewPage extends StatelessWidget {
  const SchedulesViewPage({super.key});

  static Route<void> route() => MaterialPageRoute(
    builder: (context) {
      return BlocProvider(
        create:
            (context) => SchedulesViewCubit(
              universityRepository: context.read<UniversityRepository>(),
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
        final groups =
            state.schedules
                .where((e) => e.schedule.type == ScheduleType.group)
                .toList();
        final teachers =
            state.schedules
                .where((e) => e.schedule.type == ScheduleType.teacher)
                .toList();
        final rooms =
            state.schedules
                .where((e) => e.schedule.type == ScheduleType.room)
                .toList();

        // FIXME: Selected schedule is not shown when opening view
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
                      () => Navigator.push(
                        context,
                        EntitySelectionPage.route(
                          tab: EntitySelectionTab.groups,
                        ),
                      ),
                ),
              ),
              SliverList.builder(
                itemCount: groups.length,
                itemBuilder:
                    (context, index) => SchedulesListItem(
                      title: groups[index].name,
                      // lastUpdated: state.groupSchedules[index].lastUpdated,
                      isSelected:
                          state.selectedSchedule == groups[index].schedule,
                      deleteProhibited:
                          state.updateStatus.$1 ||
                          state.userGroupID == groups[index].schedule.id,
                      updateProhibited: state.updateStatus.$1,
                      isUpdating:
                          state.updateStatus.$2 == groups[index].schedule,
                      onTap:
                          () => context
                              .read<SchedulesViewCubit>()
                              .selectSchedule(groups[index].schedule),
                      onRefresh:
                          () => context
                              .read<SchedulesViewCubit>()
                              .updateSchedule(groups[index].schedule),
                      onDelete:
                          () => context
                              .read<SchedulesViewCubit>()
                              .removeSchedule(groups[index].schedule),
                    ),
              ),
              SliverToBoxAdapter(
                child: SchedulesTypesDivider(
                  typeName: AppLocalizations.of(context)!.teachers,
                  onAdd:
                      () => Navigator.push(
                        context,
                        EntitySelectionPage.route(
                          tab: EntitySelectionTab.teachers,
                        ),
                      ),
                ),
              ),
              SliverList.builder(
                itemCount: teachers.length,
                itemBuilder:
                    (context, index) => SchedulesListItem(
                      title: teachers[index].name,
                      // lastUpdated: state.groupSchedules[index].lastUpdated,
                      isSelected:
                          state.selectedSchedule == teachers[index].schedule,
                      updateProhibited: state.updateStatus.$1,
                      deleteProhibited: state.updateStatus.$1,
                      isUpdating:
                          state.updateStatus.$2 == teachers[index].schedule,
                      onTap:
                          () => context
                              .read<SchedulesViewCubit>()
                              .selectSchedule(teachers[index].schedule),
                      onRefresh:
                          () => context
                              .read<SchedulesViewCubit>()
                              .updateSchedule(teachers[index].schedule),
                      onDelete:
                          () => context
                              .read<SchedulesViewCubit>()
                              .removeSchedule(teachers[index].schedule),
                    ),
              ),
              SliverToBoxAdapter(
                child: SchedulesTypesDivider(
                  typeName: AppLocalizations.of(context)!.rooms,
                  onAdd:
                      () => Navigator.push(
                        context,
                        EntitySelectionPage.route(
                          tab: EntitySelectionTab.rooms,
                        ),
                      ),
                ),
              ),
              SliverList.builder(
                itemCount: rooms.length,
                itemBuilder:
                    (context, index) => SchedulesListItem(
                      title: rooms[index].name,
                      // lastUpdated: state.groupSchedules[index].lastUpdated,
                      isSelected:
                          state.selectedSchedule == rooms[index].schedule,
                      updateProhibited: state.updateStatus.$1,
                      deleteProhibited: state.updateStatus.$1,
                      isUpdating:
                          state.updateStatus.$2 == rooms[index].schedule,
                      onTap:
                          () => context
                              .read<SchedulesViewCubit>()
                              .selectSchedule(rooms[index].schedule),
                      onRefresh:
                          () => context
                              .read<SchedulesViewCubit>()
                              .updateSchedule(rooms[index].schedule),
                      onDelete:
                          () => context
                              .read<SchedulesViewCubit>()
                              .removeSchedule(rooms[index].schedule),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
