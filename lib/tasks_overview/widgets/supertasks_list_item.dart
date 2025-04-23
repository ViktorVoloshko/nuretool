import 'package:flutter/material.dart';

import '../models/models.dart';
import '../../l10n/app_localizations.dart';

class SupertasksListItem extends StatelessWidget {
  const SupertasksListItem({
    super.key,
    required this.supertask,
    required this.onClicked,
    required this.onCheckboxClicked,
  });

  final Supertask supertask;
  final GestureTapCallback onClicked;
  final ValueChanged<bool?> onCheckboxClicked;

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Checkbox(
              value: supertask.isDone,
              onChanged: onCheckboxClicked,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 8.0),
              child: Column(
                spacing: 2.0,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (supertask.type != null)
                    Text(
                      supertaskTypeToString(supertask.type!, context),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  Text(
                    supertask.title,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  if (supertask.subtasksTotal != 0 ||
                      supertask.deadline != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Row(
                        spacing: 4.0,
                        children: [
                          if (supertask.subtasksTotal != 0)
                            Chip(
                              label: Text(
                                AppLocalizations.of(context)!.subtasksDoneTotal(
                                  supertask.subtasksDone,
                                  supertask.subtasksTotal,
                                ),
                              ),
                            ),
                          if (supertask.deadline != null)
                            Chip(label: Text('${supertask.deadline!}')),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String supertaskTypeToString(SupertaskType type, BuildContext context) =>
      switch (type) {
        SupertaskType.subject => AppLocalizations.of(context)!.subject,
        SupertaskType.project => AppLocalizations.of(context)!.project,
      };
}
