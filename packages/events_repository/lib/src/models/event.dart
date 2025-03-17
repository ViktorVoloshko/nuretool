import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'models.dart';

@immutable
class Event extends Equatable {
  const Event({
    required this.id,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.isCustom,
    required this.baseType,
    required this.type,
    required this.groups,
    required this.teachers,
    required this.room,
  });

  final int id;
  final Subject subject;
  final DateTime startTime;
  final DateTime endTime;
  final bool isCustom;
  final BaseEventType? baseType;
  final EventType? type;
  final List<Group> groups;
  final List<Teacher> teachers;
  final String? room;

  Event copyWith({
    int? id,
    Subject? subject,
    DateTime? startTime,
    DateTime? endTime,
    bool? isCustom,
    BaseEventType? baseType,
    EventType? type,
    List<Group>? groups,
    List<Teacher>? teachers,
    String? room,
  }) => Event(
    id: id ?? this.id,
    subject: subject ?? this.subject,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isCustom: isCustom ?? this.isCustom,
    baseType: baseType ?? this.baseType,
    type: type ?? this.type,
    groups: groups ?? this.groups,
    teachers: teachers ?? this.teachers,
    room: room ?? this.room,
  );

  @override
  List<Object?> get props => [
    id,
    subject,
    startTime,
    endTime,
    isCustom,
    baseType,
    type,
    groups,
    teachers,
    room,
  ];
}

enum BaseEventType {
  lecture,
  practice,
  laboratory,
  consultation,
  test,
  exam,
  project,
}

extension IDBaseToBaseType on BaseEventType {
  static BaseEventType fromIDBase(int id) => switch (id) {
    0 => BaseEventType.lecture,
    10 => BaseEventType.practice,
    20 => BaseEventType.laboratory,
    30 => BaseEventType.consultation,
    40 || 50 => BaseEventType.exam,
    60 => BaseEventType.project,
    _ => throw UnimplementedError('id_base $id is not inplemented'),
  };
}
