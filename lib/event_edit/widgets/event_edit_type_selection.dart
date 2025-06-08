import 'package:flutter/material.dart';
import 'package:university_repository/university_repository.dart';

class EventEditTypeSelection extends StatelessWidget {
  const EventEditTypeSelection({
    super.key,
    required this.selected,
    required this.onSelectionChanged,
  });

  final EventBaseType? selected;
  final void Function(Set<EventBaseType?>) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<EventBaseType?>(
      selected: {selected},
      onSelectionChanged: onSelectionChanged,
      showSelectedIcon: false,
      segments: [
        ButtonSegment<EventBaseType>(
          value: EventBaseType.lecture,
          label: Icon(Icons.menu_book),
        ),
        ButtonSegment<EventBaseType>(
          value: EventBaseType.practice,
          label: Icon(Icons.drive_file_rename_outline),
        ),
        ButtonSegment<EventBaseType>(
          value: EventBaseType.laboratory,
          label: Icon(Icons.science),
        ),
        ButtonSegment<EventBaseType>(
          value: EventBaseType.consultation,
          label: Icon(Icons.class_),
        ),
        ButtonSegment<EventBaseType>(
          value: EventBaseType.test,
          label: Icon(Icons.task_alt),
        ),
        ButtonSegment<EventBaseType>(
          value: EventBaseType.exam,
          label: Icon(Icons.fact_check),
        ),
        ButtonSegment<EventBaseType>(
          value: EventBaseType.project,
          label: Icon(Icons.code),
        ),
      ],
    );
  }
}
