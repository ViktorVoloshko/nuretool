import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class TaskDeadlineField extends StatelessWidget {
  const TaskDeadlineField({
    super.key,
    required this.deadline,
    required this.onDeadlineChanged,
  });

  final DateTime? deadline;
  final ValueChanged<DateTime> onDeadlineChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: deadline?.toString()),
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: deadline,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (!context.mounted || date == null) return;
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(deadline ?? DateTime.now()),
        );
        if (time == null) return;

        onDeadlineChanged(
          DateTime(date.year, date.month, date.day, time.hour, time.minute),
        );
      },
      showCursor: false,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.addDeadline,
        prefixIcon: Icon(Icons.calendar_today),
        border: InputBorder.none,
      ),
    );
  }
}
