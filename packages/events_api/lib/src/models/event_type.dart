import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'event_type.g.dart';

@immutable
@JsonSerializable()
class EventType extends Equatable {
  const EventType({
    required this.id,
    required this.fullName,
    required this.shortName,
    required this.idBase,
    required this.type,
  });

  final int id;
  final String fullName;
  final String shortName;
  final int idBase;
  final String type;

  factory EventType.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName, idBase, type];
}
