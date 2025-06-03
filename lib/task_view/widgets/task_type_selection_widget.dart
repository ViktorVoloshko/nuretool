import 'package:flutter/material.dart';
import 'package:tasks_repository/tasks_repository.dart';

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
          label: Icon(Icons.not_interested),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.practice,
          label: Icon(Icons.drive_file_rename_outline),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.laboratory,
          label: Icon(Icons.science),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.test,
          label: Icon(Icons.task_alt),
        ),
        ButtonSegment<TaskType?>(
          value: TaskType.exam,
          label: Icon(Icons.fact_check),
        ),
      ],
    );
  }
}
