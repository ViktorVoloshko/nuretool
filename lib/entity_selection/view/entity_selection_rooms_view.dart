import 'package:flutter/material.dart';
import 'package:university_repository/university_repository.dart';

class EntitySelectionRoomsView extends StatelessWidget {
  const EntitySelectionRoomsView({
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
