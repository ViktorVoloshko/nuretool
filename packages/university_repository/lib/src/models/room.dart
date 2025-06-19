import 'package:drift/drift.dart';
import 'package:rooms_api/rooms_api.dart' as api;
import 'package:drift_db/drift_db.dart' as db;

import 'models.dart';

class Room extends Entity {
  const Room({required super.id, required super.name});

  Room.fromDBModel(db.Room room) : this(id: room.id, name: room.name);

  db.RoomsCompanion toDBModel() =>
      db.RoomsCompanion.insert(id: Value(id), name: name);

  @override
  List<Object?> get props => [id, name];
}

extension ApiToDBRoom on api.Room {
  db.RoomsCompanion toDBModel() =>
      db.RoomsCompanion.insert(id: Value(id), name: shortName);
}
