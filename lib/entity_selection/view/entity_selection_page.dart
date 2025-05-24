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
    bool groupsOnly = false,
  }) => MaterialPageRoute(
    builder:
        (context) => BlocProvider(
          create:
              (context) => EntitySelectionCubit(
                universityRepository: context.read<UniversityRepository>(),
                initialTab: tab,
                groupsOnly: groupsOnly,
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
        return DefaultTabController(
          initialIndex: state.initialTab.index,
          length: state.groupsOnly ? 1 : 3,
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
              bottom: TabBar(
                tabs: [
                  Tab(text: l10n.groups, icon: Icon(Icons.people)),
                  if (!state.groupsOnly) ...[
                    Tab(text: l10n.teachers, icon: Icon(Icons.person)),
                    Tab(text: l10n.rooms, icon: Icon(Icons.sensor_door)),
                  ],
                ],
              ),
            ),
            body: TabBarView(
              children: [
                EntitySelectionGroupsView(
                  groups: state.filteredGroups,
                  onTap: () => Navigator.pop(context),
                ),
                if (!state.groupsOnly) ...[
                  EntitySelectionTeachersView(
                    teachers: state.filteredTeachers,
                    onTap: () => Navigator.pop(context),
                  ),
                  EntitySelectionRoomsView(
                    rooms: state.filteredRooms,
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
