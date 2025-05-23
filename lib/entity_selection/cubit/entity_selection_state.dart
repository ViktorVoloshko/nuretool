part of 'entity_selection_cubit.dart';

final class EntitySelectionState extends Equatable {
  const EntitySelectionState({required this.entities});

  final List<Entity> entities;

  @override
  List<Object> get props => [entities];
}
