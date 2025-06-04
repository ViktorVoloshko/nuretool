import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_repository/university_repository.dart';

import 'view.dart';
import '../cubit/entity_selection_cubit.dart';
import '../../l10n/app_localizations.dart';

class EntitySelectionPage extends StatelessWidget {
  const EntitySelectionPage({super.key});

  static Route<void> route({
    EntitySelectionTab tab = EntitySelectionTab.groups,
    bool userGroupSelection = false,
  }) => MaterialPageRoute(
    builder:
        (context) => BlocProvider(
          create:
              (context) => EntitySelectionCubit(
                universityRepository: context.read<UniversityRepository>(),
                initialTab: tab,
                userGroupSelection: userGroupSelection,
              )..requestSubscription(),
          child: const EntitySelectionPage(),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return const EntitySelectionView();
  }
}

class EntitySelectionView extends StatelessWidget {
  const EntitySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<EntitySelectionCubit, EntitySelectionState>(
      builder: (context, state) {
        final tabs = [
          const EntitySelectionGroupsView(),
          if (!state.userGroupSelection) ...[
            const EntitySelectionTeachersView(),
            const EntitySelectionRoomsView(),
          ],
        ];

        final loadingTabs = [
          const Center(child: CircularProgressIndicator()),
          if (!state.userGroupSelection) ...[
            const Center(child: CircularProgressIndicator()),
            const Center(child: CircularProgressIndicator()),
          ],
        ];

        return DefaultTabController(
          initialIndex: state.initialTab.index,
          length: state.userGroupSelection ? 1 : 3,
          child: Scaffold(
            appBar: AppBar(
              title: TextField(
                onChanged:
                    (value) => context
                        .read<EntitySelectionCubit>()
                        .setSearchValue(value),
                decoration: InputDecoration(
                  hintText: l10n.search,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              actions: [
                if (!state.updating)
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed:
                        () =>
                            context
                                .read<EntitySelectionCubit>()
                                .updateEntities(),
                  ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(text: l10n.groups, icon: Icon(Icons.people)),
                  if (!state.userGroupSelection) ...[
                    Tab(text: l10n.teachers, icon: Icon(Icons.person)),
                    Tab(text: l10n.rooms, icon: Icon(Icons.sensor_door)),
                  ],
                ],
              ),
            ),
            body: TabBarView(children: state.updating ? loadingTabs : tabs),
          ),
        );
      },
    );
  }
}
