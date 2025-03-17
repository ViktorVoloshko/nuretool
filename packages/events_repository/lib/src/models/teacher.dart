import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class Teacher extends Equatable {
  const Teacher({
    required this.id,
    required this.name,
    required this.shortName,
  });

  final int id;
  final String name;
  final String shortName;

  @override
  List<Object?> get props => [id, name, shortName];
}
