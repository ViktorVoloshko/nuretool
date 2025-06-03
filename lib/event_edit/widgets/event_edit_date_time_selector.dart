import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class EventEditDateTimeSelector extends StatefulWidget {
  const EventEditDateTimeSelector({
    super.key,
    required this.dateTime,
    required this.onDateTimeChanged,
    this.showIcon = true,
    required this.hintText,
    this.errorText,
  });

  final DateTime? dateTime;
  final ValueChanged<DateTime?> onDateTimeChanged;
  final bool showIcon;
  final String hintText;
  final String? errorText;

  @override
  State<EventEditDateTimeSelector> createState() =>
      _EventEditDateTimeSelectorState();
}

class _EventEditDateTimeSelectorState extends State<EventEditDateTimeSelector> {
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.text =
        widget.dateTime == null
            ? ''
            : widget.dateTime!.toLocalDateFormatString();
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
          initialDate: widget.dateTime,
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );
        if (!context.mounted || date == null) return;
        final time = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(
            widget.dateTime ?? DateTime.now(),
          ),
        );
        if (time == null) return;

        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        setState(
          () => _textController.text = newDateTime.toLocalDateFormatString(),
        );

        widget.onDateTimeChanged(newDateTime);
      },
      showCursor: false,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.errorText,
        prefixIcon:
            !widget.showIcon
                ? SizedBox.square(dimension: 8.0)
                : Icon(Icons.calendar_today),
        border: InputBorder.none,
      ),
    );
  }
}
