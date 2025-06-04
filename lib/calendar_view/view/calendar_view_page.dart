import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:university_repository/university_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../bloc/calendar_view_bloc.dart';
import '../models/models.dart';
import '../../schedules_view/schedules_view.dart';
import '../../event_view/event_view.dart';
import '../../event_edit/event_edit.dart';
import '../../l10n/app_localizations.dart';

class CalendarViewPage extends StatelessWidget {
  const CalendarViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => CalendarViewBloc(
            universityRepository: context.read<UniversityRepository>(),
          )..add(const CalendarViewSubscriptionRequested()),
      child: const CalendarViewView(),
    );
  }
}

class CalendarViewView extends StatelessWidget {
  const CalendarViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalendarViewBloc, CalendarViewState>(
      builder: (context, state) {
        return switch (state) {
          CalendarViewInitial() => const Center(
            child: CircularProgressIndicator(),
          ),
          CalendarViewFailure() => const Center(
            child: CircularProgressIndicator(),
          ),
          CalendarViewSuccess() => Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(
                    title: Text(
                      state.scheduleName ??
                          AppLocalizations.of(context)!.calendar,
                    ),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed:
                            () => Navigator.push(
                              context,
                              SchedulesViewPage.route(),
                            ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SfCalendar(
                      dataSource: EventDataSource(state.events),
                      view: CalendarView.week,
                      allowViewNavigation: true,
                      showNavigationArrow: true,
                      allowedViews: [
                        CalendarView.schedule,
                        CalendarView.week,
                        CalendarView.month,
                      ],
                      firstDayOfWeek: 1,
                      showTodayButton: true,
                      monthViewSettings: MonthViewSettings(showAgenda: true),
                      timeSlotViewSettings: TimeSlotViewSettings(
                        timeInterval: const Duration(minutes: 60),
                        timeFormat: DateFormat.Hm().pattern!,
                        nonWorkingDays: const [DateTime.sunday],
                        // startHour:
                        //     state.start == null
                        //         ? 0
                        //         : state.start!.hour + state.start!.minute / 60,
                        // endHour:
                        //     state.end == null
                        //         ? 24
                        //         : state.end!.hour + state.end!.minute / 60,
                      ),
                      onTap: (calendarTapDetails) {
                        if (calendarTapDetails.targetElement ==
                            CalendarElement.appointment) {
                          showModalBottomSheet(
                            context: context,
                            enableDrag: true,
                            showDragHandle: true,
                            builder:
                                (context) => Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: EventViewPage(
                                    eventData:
                                        calendarTapDetails.appointments![0],
                                  ),
                                ),
                          );
                        }
                      },
                      onLongPress: (calendarLongPressDetails) {
                        if (calendarLongPressDetails.targetElement ==
                                CalendarElement.appointment &&
                            !calendarLongPressDetails
                                .appointments![0]
                                .event
                                .isFetched) {
                          EventEditPage.open(
                            context,
                            state.schedule!,
                            state.events.map((e) => e.subject).toSet().toList(),
                            calendarLongPressDetails.appointments![0].event,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              if (state.schedule != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: FloatingActionButton(
                      heroTag: UniqueKey(),
                      child: Icon(Icons.add),
                      onPressed:
                          () => EventEditPage.open(
                            context,
                            state.schedule!,
                            state.events.map((e) => e.subject).toSet().toList(),
                          ),
                    ),
                  ),
                ),
            ],
          ),
        };
      },
    );
  }
}
