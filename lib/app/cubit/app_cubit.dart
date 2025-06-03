import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(AppState(theme: AppTheme.defaultValues())) {
    init();
  }

  final SettingsRepository _settingsRepository;

  late final StreamSubscription<AppTheme> _subscription;

  void init() {
    _subscription = _settingsRepository.appTheme.listen(
      (appTheme) => emit(state.copyWith(theme: appTheme)),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
