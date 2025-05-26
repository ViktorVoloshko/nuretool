import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/entity_selection_cubit.dart';

class EntitySelectionGroupsView extends StatelessWidget {
  const EntitySelectionGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntitySelectionCubit, EntitySelectionState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: state.filteredGroups.length,
              itemBuilder:
                  (context, index) => ListTile(
                    title: Text(state.filteredGroups[index].name),
                    onTap: () {
                      context.read<EntitySelectionCubit>().addGroupSchedule(
                        state.filteredGroups[index].id,
                      );
                      if (state.userGroupSelection) {
                        context.read<EntitySelectionCubit>().setUserGroup(
                          state.filteredGroups[index].id,
                        );
                      }
                      Navigator.pop(context);
                    },
                  ),
            ),
          ],
        );
      },
    );
  }
}
