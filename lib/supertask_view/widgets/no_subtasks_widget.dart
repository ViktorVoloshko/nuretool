import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class NoSubtasksWidget extends StatelessWidget {
  const NoSubtasksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.indeterminate_check_box,
          color: Theme.of(context).disabledColor,
          size: 100,
        ),
        SizedBox(height: 10),
        Text(
          AppLocalizations.of(context)!.no_subtasks,
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
      ],
    );
  }
}
