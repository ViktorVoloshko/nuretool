import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';

part 'more_view_state.dart';

class MoreViewCubit extends Cubit<MoreViewState> {
  MoreViewCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(MoreViewState(appTheme: AppTheme.defaultValues())) {
    init();
  }

  final SettingsRepository _settingsRepository;

  late final StreamSubscription<AppTheme> _subscription;

  void init() {
    _subscription = _settingsRepository.appTheme.listen(
      (appTheme) => emit(MoreViewState(appTheme: appTheme)),
    );
  }

  void setThemeMode(AppThemeMode themeMode) async => _settingsRepository
      .setTheme(state.appTheme.copyWith(appThemeMode: themeMode));

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
