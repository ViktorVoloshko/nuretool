import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_repository/settings_repository.dart';

import '../cubit/more_view_cubit.dart';
import '../../l10n/app_localizations.dart';

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
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(title: Text(AppLocalizations.of(context)!.more)),
      ],
    );
  }
}
