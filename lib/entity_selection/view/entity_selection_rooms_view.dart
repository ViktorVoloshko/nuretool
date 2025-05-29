import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_storage/settings_storage.dart';

import '../cubit/entity_selection_cubit.dart';

class EntitySelectionRoomsView extends StatelessWidget {
  const EntitySelectionRoomsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntitySelectionCubit, EntitySelectionState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverList.builder(
              itemCount: state.filteredRooms.length,
              itemBuilder:
                  (context, index) => ListTile(
                    title: Text(state.filteredRooms[index].name),
                    onTap: () {
                      context.read<EntitySelectionCubit>().addSchedule(
                        ScheduleData(
                          id: state.filteredRooms[index].id,
                          type: ScheduleType.room,
                        ),
                      );
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
