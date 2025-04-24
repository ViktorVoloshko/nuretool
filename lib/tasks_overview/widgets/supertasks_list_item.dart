import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../../l10n/app_localizations.dart';

class SupertasksListItem extends StatelessWidget {
  const SupertasksListItem({
    super.key,
    required this.supertask,
    required this.onClicked,
    required this.onCheckboxClicked,
  });

  final Supertask supertask;
  final GestureTapCallback onClicked;
  final ValueChanged<bool?> onCheckboxClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: Card.filled(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Checkbox(
                value: supertask.isDone,
                onChanged: onCheckboxClicked,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  right: 8.0,
                ),
                child: Column(
                  spacing: 2.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (supertask.type != null)
                      Text(
                        supertaskTypeToString(supertask.type!, context),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    Text(
                      supertask.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (!supertask.isDone &&
                        (supertask.subtasks.isNotEmpty ||
                            supertask.deadline != null))
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Row(
                          spacing: 4.0,
                          children: [
                            if (supertask.subtasks.isNotEmpty)
                              Chip(
                                label: Text(
                                  AppLocalizations.of(
                                    context,
                                  )!.subtasksDoneTotal(
                                    supertask.subtasks
                                        .where((subtask) => subtask.isDone)
                                        .length,
                                    supertask.subtasks.length,
                                  ),
                                ),
                              ),
                            if (supertask.deadline != null)
                              Chip(label: Text('${supertask.deadline!}')),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String supertaskTypeToString(TaskType type, BuildContext context) =>
      switch (type) {
        TaskType.subject => AppLocalizations.of(context)!.subject,
        TaskType.project => AppLocalizations.of(context)!.project,
        _ => throw Exception("supertask can't be of type $type"),
      };
}
