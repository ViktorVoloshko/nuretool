import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

import '../../l10n/app_localizations.dart';

class SupertaskTypeSelectionWidget extends StatelessWidget {
  const SupertaskTypeSelectionWidget({
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
          value: TaskType.project,
          label: Text(AppLocalizations.of(context)!.project),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.subject,
          label: Text(AppLocalizations.of(context)!.subject),
        ),
      ],
    );
  }
}
