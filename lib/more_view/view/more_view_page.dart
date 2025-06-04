import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

import '../widgets/widgets.dart';
import '../cubit/more_view_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../../schedules_view/schedules_view.dart';
import '../../entity_selection/entity_selection.dart';

class MoreViewPage extends StatelessWidget {
  const MoreViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MoreViewCubit(
            settingsRepository: context.read<SettingsRepository>(),
            universityRepository: context.read<UniversityRepository>(),
          ),
      child: const MoreViewView(),
    );
  }
}

class MoreViewView extends StatelessWidget {
  const MoreViewView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<MoreViewCubit, MoreViewState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar.large(title: Text(l10n.more)),
            SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    l10n.theme,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SegmentedButton(
                    selected: <AppThemeMode>{state.appTheme.themeMode},
                    onSelectionChanged:
                        (selected) => context
                            .read<MoreViewCubit>()
                            .setThemeMode(selected.first),
                    segments: <ButtonSegment<AppThemeMode>>[
                      ButtonSegment(
                        value: AppThemeMode.system,
                        label: Text(l10n.system),
                      ),
                      ButtonSegment(
                        value: AppThemeMode.light,
                        label: Text(l10n.light),
                      ),
                      ButtonSegment(
                        value: AppThemeMode.dark,
                        label: Text(l10n.dark),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    l10n.defaultCalendarMode,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SegmentedButton(
                    selected: <CalendarMode>{state.calendarMode},
                    onSelectionChanged:
                        (selected) => context
                            .read<MoreViewCubit>()
                            .setCalendarMode(selected.first),
                    segments: <ButtonSegment<CalendarMode>>[
                      ButtonSegment(
                        value: CalendarMode.schedule,
                        label: Text(l10n.schedule),
                      ),
                      ButtonSegment(
                        value: CalendarMode.week,
                        label: Text(l10n.week),
                      ),
                      ButtonSegment(
                        value: CalendarMode.month,
                        label: Text(l10n.month),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    l10n.accentColor,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownMenu(
                    expandedInsets: EdgeInsets.zero,
                    requestFocusOnTap: false,
                    leadingIcon: Icon(Icons.color_lens),
                    inputDecorationTheme: InputDecorationTheme(
                      border: InputBorder.none,
                    ),
                    initialSelection: state.appTheme.color,
                    onSelected:
                        (value) =>
                            context.read<MoreViewCubit>().setAppColor(value!),
                    dropdownMenuEntries: [
                      DropdownMenuEntry(
                        value: AppThemeColor.blue,
                        label: l10n.blue,
                      ),
                      DropdownMenuEntry(
                        value: AppThemeColor.red,
                        label: l10n.red,
                      ),
                      DropdownMenuEntry(
                        value: AppThemeColor.green,
                        label: l10n.green,
                      ),
                      DropdownMenuEntry(
                        value: AppThemeColor.yellow,
                        label: l10n.yellow,
                      ),
                      DropdownMenuEntry(
                        value: AppThemeColor.orange,
                        label: l10n.orange,
                      ),
                      DropdownMenuEntry(
                        value: AppThemeColor.purple,
                        label: l10n.purple,
                      ),
                    ],
                  ),
                ),
                const Divider(),
                MoreViewItem(
                  title: l10n.myGroup,
                  subtitle: state.userGroup?.name,
                  onTap:
                      () => Navigator.push(
                        context,
                        EntitySelectionPage.route(
                          tab: EntitySelectionTab.groups,
                          userGroupSelection: true,
                        ),
                      ),
                  icon: Icon(Icons.people),
                ),
                MoreViewItem(
                  title: l10n.schedulesManage,
                  onTap:
                      () => Navigator.push(context, SchedulesViewPage.route()),
                  icon: Icon(Icons.calendar_today),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
