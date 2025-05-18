import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:university_repository/university_repository.dart';

part 'entity_selection_state.dart';

class EntitySelectionCubit extends Cubit<EntitySelectionState> {
  EntitySelectionCubit({required this.entities})
    : super(EntitySelectionState(entities: entities));

  final List<Entity> entities;
}
