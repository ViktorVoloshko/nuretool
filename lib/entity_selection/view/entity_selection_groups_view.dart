import 'package:flutter/material.dart';
import 'package:university_repository/university_repository.dart';

class EntitySelectionGroupsView extends StatelessWidget {
  const EntitySelectionGroupsView({
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
