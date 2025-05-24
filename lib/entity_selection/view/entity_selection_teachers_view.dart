import 'package:flutter/material.dart';
import 'package:university_repository/university_repository.dart';

class EntitySelectionTeachersView extends StatelessWidget {
  const EntitySelectionTeachersView({
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
