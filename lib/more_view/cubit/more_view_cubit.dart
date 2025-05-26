import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';
import 'package:university_repository/university_repository.dart';

part 'more_view_state.dart';

class MoreViewCubit extends Cubit<MoreViewState> {
  MoreViewCubit({
    required SettingsRepository settingsRepository,
    required UniversityRepository universityRepository,
  }) : _settingsRepository = settingsRepository,
       _universityRepository = universityRepository,
       super(MoreViewState(appTheme: AppTheme.defaultValues())) {
    init();
  }

  final SettingsRepository _settingsRepository;
  final UniversityRepository _universityRepository;

  late final StreamSubscription<AppTheme> _themeSubscription;
  late final StreamSubscription<int?> _userGroupSubscription;
  late final StreamSubscription<List<Group>> _groupsSubscription;

  void init() {
    _themeSubscription = _settingsRepository.appTheme.listen(
      (appTheme) => emit(state.copyWith(appTheme: appTheme)),
    );
    _userGroupSubscription = _universityRepository.userGroupID.listen(
      (groupID) async => emit(
        state.copyWith(
          userGroup: (await _universityRepository.groups.first)
              .firstWhereOrNull((group) => group.id == groupID),
        ),
      ),
    );
    _groupsSubscription = _universityRepository.groups.listen((groups) async {
      final userGroupID = await _universityRepository.userGroupID.first;
      emit(
        state.copyWith(
          userGroup: groups.firstWhereOrNull(
            (group) => group.id == userGroupID,
          ),
        ),
      );
    });
  }

  void setThemeMode(AppThemeMode themeMode) async => _settingsRepository
      .setTheme(state.appTheme.copyWith(appThemeMode: themeMode));

  @override
  Future<void> close() {
    Future.wait([
      _groupsSubscription.cancel(),
      _themeSubscription.cancel(),
      _userGroupSubscription.cancel(),
    ]);
    return super.close();
  }
}
