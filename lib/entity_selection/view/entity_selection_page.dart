import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/entity_selection_cubit.dart';
import '../../l10n/app_localizations.dart';

class EntitySelectionPage extends StatelessWidget {
  const EntitySelectionPage({super.key});

  static Route<void> route([
    EntitySelectionTab tab = EntitySelectionTab.groups,
  ]) => MaterialPageRoute(
    builder:
        (context) => BlocProvider(
          create:
              (context) => EntitySelectionCubit(
                universityRepository: context.read<UniversityRepository>(),
                initialTab: tab,
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
          length: 3,
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
                  Tab(text: l10n.groups),
                  Tab(text: l10n.teachers),
                  Tab(text: l10n.rooms),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                EntitySelectionGroupList(
                  groups: state.filteredGroups,
                  onTap: () => Navigator.pop(context),
                ),
                EntitySelectionTeachersList(
                  teachers: state.filteredTeachers,
                  onTap: () => Navigator.pop(context),
                ),
                EntitySelectionRoomsList(
                  rooms: state.filteredRooms,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EntitySelectionGroupList extends StatelessWidget {
  const EntitySelectionGroupList({
    super.key,
    required this.groups,
    required this.onTap,
  });

  final List<Group> groups;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: groups.length,
          itemBuilder:
              (context, index) =>
                  ListTile(title: Text(groups[index].name), onTap: onTap),
        ),
      ],
    );
  }
}

class EntitySelectionTeachersList extends StatelessWidget {
  const EntitySelectionTeachersList({
    super.key,
    required this.teachers,
    required this.onTap,
  });

  final List<Teacher> teachers;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: teachers.length,
          itemBuilder:
              (context, index) =>
                  ListTile(title: Text(teachers[index].name), onTap: onTap),
        ),
      ],
    );
  }
}

class EntitySelectionRoomsList extends StatelessWidget {
  const EntitySelectionRoomsList({
    super.key,
    required this.rooms,
    required this.onTap,
  });

  final List<Room> rooms;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: rooms.length,
          itemBuilder:
              (context, index) =>
                  ListTile(title: Text(rooms[index].name), onTap: onTap),
        ),
      ],
    );
  }
}
