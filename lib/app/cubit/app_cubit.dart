import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(AppState(theme: AppTheme.system));

  final SettingsRepository _settingsRepository;

  late final StreamSubscription<Settings> _subscription;

  void init() async {
    _subscription = _settingsRepository.settings.listen(
      (event) => state.copyWith(event.theme),
    );
  }

  void dispose() => _subscription.cancel();
}
