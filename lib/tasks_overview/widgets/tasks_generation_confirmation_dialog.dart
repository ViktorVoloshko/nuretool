import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class TaskGenerationConfirmation extends StatelessWidget {
  final GestureTapCallback onYes;
  final GestureTapCallback onNo;

  const TaskGenerationConfirmation({
    super.key,
    required this.onYes,
    required this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(l10n.tasksGenerationTitle),
      content: Text(l10n.tasksGenerationContent),
      actions: [
        ElevatedButton(onPressed: onYes, child: Text(l10n.yes)),
        FilledButton(onPressed: onNo, child: Text(l10n.no)),
      ],
    );
  }
}
