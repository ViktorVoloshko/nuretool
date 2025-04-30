import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class TaskTitleField extends StatelessWidget {
  const TaskTitleField({
    super.key,
    required this.initialValue,
    required this.errorText,
    required this.onChanged,
  });

  final String initialValue;
  final String? errorText;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: AppLocalizations.of(context)!.title,
        errorText: errorText,
        prefixIcon: Icon(Icons.title),
        border: InputBorder.none,
      ),
    );
  }
}
