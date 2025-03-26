import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../local_db_api.dart';

@immutable
class EventData extends Equatable {
  const EventData({
    required this.event,
    required this.type,
    required this.group,
    required this.teacher,
  });

  final Event event;
  final EventType type;
  final Group group;
  final Teacher teacher;

  @override
  List<Object?> get props => [event, type, group, teacher];
}
