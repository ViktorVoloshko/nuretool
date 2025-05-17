import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settings_repository/settings_repository.dart';
import 'package:settings_storage/settings_storage.dart';

part 'more_view_state.dart';

class MoreViewCubit extends Cubit<MoreViewState> {
  MoreViewCubit({required SettingsRepository settingsRepository})
    : _settingsRepository = settingsRepository,
      super(MoreViewState(settings: Settings.defaultValues())) {
    init();
  }

  final SettingsRepository _settingsRepository;

  late final StreamSubscription<Settings> _subscription;

  void init() {
    _subscription = _settingsRepository.settings.listen(
      (settings) => emit(MoreViewState(settings: settings)),
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
