import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

import '../bloc/event_edit_bloc.dart';
import '../widgets/widgets.dart';
import '../../l10n/app_localizations.dart';

class EventEditPage extends StatelessWidget {
  const EventEditPage({super.key});

  static void open(
    BuildContext context,
    ScheduleData schedule,
    List<Subject> availableSubjects, [
    Event? initialEvent,
  ]) => showModalBottomSheet(
    context: context,
    enableDrag: true,
    showDragHandle: true,
    builder:
        (context) => BlocProvider(
          create:
              (context) => EventEditBloc(
                universityRepository: context.read<UniversityRepository>(),
              )..add(
                EventEditOpened(
                  initialEvent: initialEvent,
                  schedule: schedule,
                  availableSubjects: availableSubjects,
                ),
              ),
          child: const EventEditPage(),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<EventEditBloc, EventEditState>(
      listener: (context, state) => Navigator.pop(context),
      listenWhen:
          (previous, current) => current.status == EventEditStatus.saved,
      child: const EventEditView(),
    );
  }
}

class EventEditView extends StatelessWidget {
  const EventEditView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocBuilder<EventEditBloc, EventEditState>(
      builder: (context, state) {
        return switch (state.status) {
          EventEditStatus.initial || EventEditStatus.saved => const Center(
            child: CircularProgressIndicator(),
          ),
          EventEditStatus.ready => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 8.0,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 8.0,
                  children: [
                    if (state.eventID != null)
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed:
                            () => context.read<EventEditBloc>().add(
                              const EventEditDeleted(),
                            ),
                      ),
                    FilledButton.icon(
                      label: Text(l10n.confirm),
                      icon: Icon(Icons.check),
                      onPressed:
                          () => context.read<EventEditBloc>().add(
                            const EventEditConfirmed(),
                          ),
                    ),
                  ],
                ),
                DropdownMenu(
                  initialSelection: state.subjectID,
                  expandedInsets: EdgeInsets.zero,
                  requestFocusOnTap: false,
                  errorText:
                      state.error == EventEditError.noSubject
                          ? l10n.noSubjectError
                          : null,
                  onSelected:
                      (value) => context.read<EventEditBloc>().add(
                        EventEditDataChanged(subjectID: value),
                      ),
                  dropdownMenuEntries: [
                    for (final subject in state.availableSubjects)
                      DropdownMenuEntry(
                        value: subject.id,
                        label: subject.title,
                      ),
                  ],
                ),
                EventEditDateTimeSelector(
                  dateTime: state.startTime,
                  onDateTimeChanged:
                      (value) => context.read<EventEditBloc>().add(
                        EventEditDataChanged(startTime: value),
                      ),
                  hintText: l10n.start,
                  showIcon: true,
                ),
                EventEditDateTimeSelector(
                  dateTime: state.endTime,
                  onDateTimeChanged:
                      (value) => context.read<EventEditBloc>().add(
                        EventEditDataChanged(endTime: value),
                      ),
                  hintText: l10n.end,
                  errorText: switch (state.error) {
                    EventEditError.noDateTime => l10n.noTimeError,
                    EventEditError.dateTimeStartAfterEnd =>
                      l10n.startAfterEndError,
                    _ => null,
                  },
                  showIcon: false,
                ),
                EventEditTypeSelection(
                  selected: state.type,
                  onSelectionChanged:
                      (value) => context.read<EventEditBloc>().add(
                        EventEditDataChanged(type: value.first),
                      ),
                ),
                if (state.error == EventEditError.noType)
                  Text(
                    l10n.noTypeError,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall!.copyWith(color: Colors.red.shade100),
                  ),
              ],
            ),
          ),
        };
      },
    );
  }
}
