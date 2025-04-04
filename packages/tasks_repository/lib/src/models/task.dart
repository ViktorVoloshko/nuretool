import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

enum TaskType { subject, project, practice, laboratory, test, exam }

@immutable
class Task extends Equatable {
  const Task({
    required this.id,
    required this.title,
    required this.isDone,
    required this.isCustom,
    required this.supertaskID,
    required this.type,
    required this.deadline,
  });

  final int id;
  final String title;
  final bool isDone;
  final bool isCustom;
  final int supertaskID;
  final TaskType? type;
  final DateTime? deadline;

  @override
  List<Object?> get props => [
    id,
    title,
    isDone,
    isCustom,
    supertaskID,
    type,
    deadline,
  ];
}
