import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../drift_db.dart';

@immutable
class EventData extends Equatable {
  const EventData({required this.event, this.type});

  final Event event;
  final EventType? type;

  @override
  List<Object?> get props => [event, type];
}
