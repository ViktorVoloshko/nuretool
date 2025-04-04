import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:rooms_api/rooms_api.dart' as api;
import 'package:local_db_api/local_db_api.dart' as db;

class Room extends Equatable {
  const Room({required this.id, required this.name, required this.building});

  Room.fromDBModel(db.Room room)
    : id = room.id,
      name = room.name,
      building = room.building;

  final int id;
  final String name;
  final String building;

  db.RoomsCompanion toDBModel() =>
      db.RoomsCompanion.insert(id: Value(id), name: name, building: building);

  @override
  List<Object?> get props => [id, name, building];
}

extension ApiToDBRoom on api.Room {
  db.RoomsCompanion toDBModel(String building) =>
      db.RoomsCompanion.insert(name: shortName, building: building);
}
