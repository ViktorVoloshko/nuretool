import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_repository/settings_repository.dart';
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
          body: ControlledRefreshIndicator(
            child: CustomScrollView(
              slivers: [
                SliverAppBar.large(
                  title: Text(AppLocalizations.of(context)!.schedulesManage),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () async {
                        // FIXME: Add autoupdate and remove this MMM
                        final repo = context.read<UniversityRepository>();
                        await Future.wait([
                          repo.fetchGroups(),
                          repo.fetchTeachers(),
                          repo.fetchRooms(),
                        ]);
                      },
                    ),
                  ],
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
                  itemCount: state.groupSchedules.length,
                  itemBuilder:
                      (context, index) => SchedulesListItem(
                        title: state.groupSchedules[index].name,
                        // lastUpdated: state.groupSchedules[index].lastUpdated,
                        deleteProhibited:
                            state.userGroupID == state.groupSchedules[index].id,
                        updateProhibited: state.updating,
                        onRefresh:
                            () => context
                                .read<SchedulesViewCubit>()
                                .updateGroupSchedule(
                                  state.groupSchedules[index].id,
                                ),
                        onDelete:
                            () => context
                                .read<SchedulesViewCubit>()
                                .removeGroupSchedule(
                                  state.groupSchedules[index].id,
                                ),
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
                  itemCount: state.teacherSchedules.length,
                  itemBuilder:
                      (context, index) => SchedulesListItem(
                        title: state.teacherSchedules[index].name,
                        // lastUpdated: state.teacherSchedules[index].lastUpdated,
                        onRefresh:
                            () => context
                                .read<SchedulesViewCubit>()
                                .updateTeacherSchedule(
                                  state.teacherSchedules[index].id,
                                ),
                        onDelete:
                            () => context
                                .read<SchedulesViewCubit>()
                                .removeTeacherSchedule(
                                  state.teacherSchedules[index].id,
                                ),
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
                  itemCount: state.roomSchedules.length,
                  itemBuilder:
                      (context, index) => SchedulesListItem(
                        title: state.roomSchedules[index].name,
                        // lastUpdated: state.roomSchedules[index].lastUpdated,
                        onRefresh:
                            () => context
                                .read<SchedulesViewCubit>()
                                .updateRoomSchedule(
                                  state.roomSchedules[index].id,
                                ),
                        onDelete:
                            () => context
                                .read<SchedulesViewCubit>()
                                .removeRoomSchedule(
                                  state.roomSchedules[index].id,
                                ),
                      ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
