import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/event_view_bloc.dart';
import '../widgets/widgets.dart';
import '../../calendar_view/calendar_view.dart';
import '../../l10n/app_localizations.dart';
import '../../utils/utils.dart';

class EventViewPage extends StatelessWidget {
  const EventViewPage({super.key, required this.eventData});

  final EventData eventData;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              EventViewBloc()..add(EventViewOpened(eventData: eventData)),
      child: EventViewView(),
    );
  }
}

class EventViewView extends StatelessWidget {
  const EventViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventViewBloc, EventViewState>(
      builder: (context, state) {
        final l10n = AppLocalizations.of(context)!;
        late final eventData = state.eventData!;

        return state.eventData == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  state.eventData!.subject.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 8.0),
                if (eventData.event.type != null)
                  EventViewEntry(
                    title: l10n.type,
                    value: eventData.event.type!.name,
                    icon: Icons.type_specimen,
                  ),
                if (eventData.groups.isNotEmpty)
                  EventViewEntry(
                    title: l10n.groups,
                    value: eventData.groups.map((e) => e.name).join(', '),
                    icon: Icons.group,
                  ),
                if (eventData.teachers.isNotEmpty)
                  EventViewEntry(
                    title: l10n.teachers,
                    value: eventData.teachers.map((e) => e.name).join(', '),
                    icon: Icons.person,
                  ),
                if (eventData.room != null)
                  EventViewEntry(
                    title: l10n.room,
                    value: eventData.room!.name,
                    icon: Icons.sensor_door,
                  ),
                EventViewEntry(
                  title: l10n.time,
                  value:
                      '${state.eventData!.event.startTime.toLocalTimeFormatSring()}- ${state.eventData!.event.endTime.toLocalTimeFormatSring()}',
                  icon: Icons.timelapse,
                ),
                EventViewEntry(
                  title: l10n.date,
                  value:
                      eventData.event.startTime
                                  .differenceInDays(eventData.event.endTime)
                                  .inDays ==
                              0
                          ? eventData.event.startTime.toLocalDateFormatString()
                          : '${eventData.event.startTime.toLocalDateFormatString()} - ${eventData.event.endTime.toLocalDateFormatString()}',
                  icon: Icons.calendar_today,
                ),
              ],
            );
      },
    );
  }
}
