import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Group extends Equatable {
  const Group({required this.id, required this.name});

  final int id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}
