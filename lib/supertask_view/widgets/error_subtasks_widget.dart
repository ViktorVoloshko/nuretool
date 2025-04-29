import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

class ErrorSubtasksWidget extends StatelessWidget {
  const ErrorSubtasksWidget({super.key, this.message});

  final String? message;

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
        SizedBox(height: 10.0),
        Text(
          AppLocalizations.of(context)!.subtasksError,
          style: TextStyle(color: Theme.of(context).disabledColor),
        ),
        if (message != null) SizedBox(height: 4.0),
        if (message != null)
          Text(
            message!,
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
      ],
    );
  }
}
