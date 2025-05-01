import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:rooms_api/rooms_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

class Room extends Equatable {
  const Room({required this.id, required this.name, required this.events});

  Room.fromDBModel(db.Room room) : id = room.id, name = room.name, events = [];

  final int id;
  final String name;
  final List<int> events;

  db.RoomsCompanion toDBModel() =>
      db.RoomsCompanion.insert(id: Value(id), name: name);

  @override
  List<Object?> get props => [id, name];
}

extension ApiToDBRoom on api.Room {
  db.RoomsCompanion toDBModel() => db.RoomsCompanion.insert(name: shortName);
}
