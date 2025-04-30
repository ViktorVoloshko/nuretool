import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../../l10n/app_localizations.dart';

class TaskTypeSelectionWidget extends StatelessWidget {
  const TaskTypeSelectionWidget({
    super.key,
    required this.selected,
    required this.onSelectionChanged,
  });

  final TaskType? selected;
  final void Function(Set<TaskType?>) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<TaskType?>(
      selected: {selected},
      onSelectionChanged: onSelectionChanged,
      segments: [
        ButtonSegment<TaskType?>(
          value: null,
          label: Text(AppLocalizations.of(context)!.none),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.practice,
          label: Text(AppLocalizations.of(context)!.practice),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.laboratory,
          label: Text(AppLocalizations.of(context)!.laboratory),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.test,
          label: Text(AppLocalizations.of(context)!.test),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.exam,
          label: Text(AppLocalizations.of(context)!.exam),
        ),
      ],
    );
  }
}
