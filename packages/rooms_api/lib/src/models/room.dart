import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'room.g.dart';

@immutable
@JsonSerializable()
class Room extends Equatable {
  const Room({
    required this.id,
    required this.shortName,
    required this.floor,
    required this.isHavePower,
  });

  @JsonKey(fromJson: _stringToInt)
  final int id;
  final String shortName;
  final String floor;
  @JsonKey(fromJson: _stringToInt)
  final int isHavePower;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);

  Map<String, dynamic> toJson() => _$RoomToJson(this);

  static int _stringToInt(String str) => int.parse(str);

  @override
  List<Object?> get props => [id, shortName, floor, isHavePower];
}
