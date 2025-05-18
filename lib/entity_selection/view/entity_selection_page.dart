import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/entity_selection_cubit.dart';

class EntitySelectionPage extends StatelessWidget {
  const EntitySelectionPage({super.key});

  static Route<int> route(List<Entity> entities) => MaterialPageRoute(
    builder:
        (context) => BlocProvider(
          create: (context) => EntitySelectionCubit(entities: entities),
          child: const EntitySelectionPage(),
        ),
  );

  @override
  Widget build(BuildContext context) {
    return const EntitySelectionView();
  }
}

class EntitySelectionView extends StatelessWidget {
  const EntitySelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EntitySelectionCubit, EntitySelectionState>(
      builder: (context, state) => const Placeholder(),
    );
  }
}
