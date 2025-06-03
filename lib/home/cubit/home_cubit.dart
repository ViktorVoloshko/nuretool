import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:university_repository/university_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required UniversityRepository universityRepository})
    : _universityRepository = universityRepository,
      super(HomeState());

  final UniversityRepository _universityRepository;

  late final StreamSubscription<String?> _errorMessageSubscription;

  void init() {
    _errorMessageSubscription = _universityRepository.errorMessage.listen(
      (errorMessage) => emit(state.copyWith(errorMessage: errorMessage)),
    );
  }

  void setTab(HomeTab tab) =>
      emit(state.copyWith(tab: tab, errorMessage: state.errorMessage));

  void clearErrorMessage() => emit(state.copyWith(errorMessage: null));

  @override
  Future<void> close() {
    _errorMessageSubscription.cancel();
    return super.close();
  }
}
