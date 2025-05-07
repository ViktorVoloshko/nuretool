import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/utils.dart';

class SubtaskListItem extends StatelessWidget {
  const SubtaskListItem({
    super.key,
    required this.task,
    required this.onTap,
    required this.onCheckboxTapped,
    required this.onDeleteTapped,
  });

  final Task task;
  final GestureTapCallback onTap;
  final ValueChanged<bool?> onCheckboxTapped;
  final GestureTapCallback onDeleteTapped;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Checkbox(value: task.isDone, onChanged: onCheckboxTapped),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (task.type != null)
                      Text(
                        taskTypeToString(task.type!, context),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    Text(
                      task.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    if (!task.isDone && task.deadline != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Chip(
                          label: Text(task.deadline!.toLocalDateFormatString()),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(Icons.delete),
                onPressed: onDeleteTapped,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String taskTypeToString(TaskType type, BuildContext context) =>
      switch (type) {
        TaskType.practice => AppLocalizations.of(context)!.practice,
        TaskType.laboratory => AppLocalizations.of(context)!.laboratory,
        TaskType.test => AppLocalizations.of(context)!.test,
        TaskType.exam => AppLocalizations.of(context)!.exam,
        _ => throw Exception("task can't be of type $type"),
      };
}
