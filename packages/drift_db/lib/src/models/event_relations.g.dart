// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_relations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventRelations _$EventRelationsFromJson(Map<String, dynamic> json) =>
    EventRelations(
      groups:
          (json['groups'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      teachers:
          (json['teachers'] as List<dynamic>)
              .map((e) => (e as num).toInt())
              .toList(),
      room: (json['room'] as num?)?.toInt(),
    );

Map<String, dynamic> _$EventRelationsToJson(EventRelations instance) =>
    <String, dynamic>{
      'groups': instance.groups,
      'teachers': instance.teachers,
      'room': instance.room,
    };
