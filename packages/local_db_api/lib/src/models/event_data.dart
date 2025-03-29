import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../local_db_api.dart';

@immutable
class EventData extends Equatable {
  const EventData({
    required this.event,
    this.type,
    this.groupID,
    this.teacherID,
  });

  final Event event;
  final EventType? type;
  final int? groupID;
  final int? teacherID;

  @override
  List<Object?> get props => [event, type, groupID, teacherID];
}
