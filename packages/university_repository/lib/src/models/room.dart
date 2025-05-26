import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:rooms_api/rooms_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

class Room extends Equatable {
  const Room({required this.id, required this.name});

  Room.fromDBModel(db.Room room) : this(id: room.id, name: room.name);

  final int id;
  final String name;

  db.RoomsCompanion toDBModel() =>
      db.RoomsCompanion.insert(id: Value(id), name: name);

  @override
  List<Object?> get props => [id, name];
}

extension ApiToDBRoom on api.Room {
  db.RoomsCompanion toDBModel() => db.RoomsCompanion.insert(name: shortName);
}
