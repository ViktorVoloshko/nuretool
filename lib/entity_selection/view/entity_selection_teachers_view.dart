import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/entity_selection_cubit.dart';

class EntitySelectionTeachersView extends StatelessWidget {
  const EntitySelectionTeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntitySelectionCubit, EntitySelectionState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: state.filteredTeachers.length,
              itemBuilder:
                  (context, index) => ListTile(
                    title: Text(state.filteredTeachers[index].name),
                    onTap: () {
                      // context.read<EntitySelectionCubit>().addGroupSchedule(
                      //   state.filteredGroups[index].id,
                      // );
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
