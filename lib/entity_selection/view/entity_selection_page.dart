import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:university_repository/university_repository.dart';

import '../cubit/entity_selection_cubit.dart';
import '../../l10n/app_localizations.dart';

class EntitySelectionPage extends StatelessWidget {
  const EntitySelectionPage({super.key});

  static Route<void> route() => MaterialPageRoute(
    builder:
        (context) => BlocProvider(
          create:
              (context) => EntitySelectionCubit(
                universityRepository: context.read<UniversityRepository>(),
              )..requestSubscription(),
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
            title: TextField(
              onChanged:
                  (value) => context
                      .read<EntitySelectionCubit>()
                      .setSearchValue(value),
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.search,
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverList.builder(
                itemCount: state.filteredGroups.length,
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text(state.filteredGroups[index].name),
                      onTap: () => Navigator.pop(context),
                    ),
              ),
            ],
          ),
        );
      },
    );
  }
}
