import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import 'models.dart';

part 'building.g.dart';

@immutable
@JsonSerializable()
class Building extends Equatable {
  const Building({
    required this.id,
    required this.shortName,
    required this.fullName,
    required this.auditories,
  });

  final String id;
  final String fullName;
  final String shortName;
  final List<Room> auditories;

  factory Building.fromJson(Map<String, dynamic> json) =>
      _$BuildingFromJson(json);

  Map<String, dynamic> toJson() => _$BuildingToJson(this);

  @override
  List<Object?> get props => [id, fullName, shortName, auditories];
}
