import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(AppState(theme: AppTheme.system));

  final SettingsRepository _settingsRepository;

  late final StreamSubscription<Settings> _subscription;

  void init() {
    _subscription = _settingsRepository.settings.listen(
      (event) => emit(state.copyWith(event.theme)),
    );
  }

  void setTheme(AppTheme theme) async => _settingsRepository.saveSettings(
    (await _settingsRepository.settings.first).copyWith(theme: theme),
  );

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
