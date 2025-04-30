import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/utils.dart';

class TaskDeadlineField extends StatefulWidget {
  const TaskDeadlineField({
    super.key,
    required this.deadline,
    required this.onDeadlineChanged,
  });

  final DateTime? deadline;
  final ValueChanged<DateTime?> onDeadlineChanged;

  @override
  State<TaskDeadlineField> createState() => _TaskDeadlineFieldState();
}

class _TaskDeadlineFieldState extends State<TaskDeadlineField> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text =
        widget.deadline == null
            ? ''
            : widget.deadline!.toLocalDateFormatString();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _textController,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: widget.deadline,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (!context.mounted || date == null) return;
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
            widget.deadline ?? DateTime.now(),
          ),
        );
        if (time == null) return;

        final newDeadline = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        setState(
          () => _textController.text = newDeadline.toLocalDateFormatString(),
        );

        widget.onDeadlineChanged(newDeadline);
      },
      showCursor: false,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.addDeadline,
        prefixIcon: Icon(Icons.calendar_today),
        border: InputBorder.none,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => _textController.clear());
            widget.onDeadlineChanged(null);
          },
          icon: Icon(Icons.clear),
        ),
      ),
    );
  }
}
