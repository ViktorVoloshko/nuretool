import 'package:drift/drift.dart';

class Rooms extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get building => text()();
}
