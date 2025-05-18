import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class Entity extends Equatable {
  const Entity({required this.id, required this.name});

  final int id;
  final String name;
}
