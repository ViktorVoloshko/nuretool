import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';

import '../widgets/widgets.dart';
import '../cubit/more_view_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../../schedules_view/schedules_view.dart';

class MoreViewPage extends StatelessWidget {
  const MoreViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => MoreViewCubit(
            settingsRepository: context.read<SettingsRepository>(),
          ),
      child: const MoreViewView(),
    );
  }
}

class MoreViewView extends StatelessWidget {
  const MoreViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoreViewCubit, MoreViewState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar.large(title: Text(AppLocalizations.of(context)!.more)),
            SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SegmentedButton(
                    selected: <AppThemeMode>{state.appTheme.appThemeMode},
                    onSelectionChanged:
                        (selected) => context
                            .read<MoreViewCubit>()
                            .setThemeMode(selected.first),
                    segments: <ButtonSegment<AppThemeMode>>[
                      ButtonSegment(
                        value: AppThemeMode.system,
                        label: Text(AppLocalizations.of(context)!.system),
                      ),
                      ButtonSegment(
                        value: AppThemeMode.light,
                        label: Text(AppLocalizations.of(context)!.light),
                      ),
                      ButtonSegment(
                        value: AppThemeMode.dark,
                        label: Text(AppLocalizations.of(context)!.dark),
                      ),
                    ],
                  ),
                ),
                MoreViewItem(
                  title: 'My group',
                  subtitle: 'КІУКІ-21-5',
                  onTap: () {},
                  icon: Icon(Icons.people),
                ),
                MoreViewItem(
                  title: AppLocalizations.of(context)!.schedulesManage,
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
