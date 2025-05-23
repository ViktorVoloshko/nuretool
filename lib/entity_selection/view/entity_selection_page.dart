import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/entity_selection_cubit.dart';
import '../../l10n/app_localizations.dart';

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
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: TextFormField(
              // TODO: Implement search
              onChanged: (value) {},
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: state.entities.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(state.entities[index].name),
                      onTap:
                          () =>
                              Navigator.pop(context, state.entities[index].id),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
