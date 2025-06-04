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

  late final StreamSubscription<UniversityRepositoryError?>
  _errorMessageSubscription;

  void init() {
    _errorMessageSubscription = _universityRepository.error.listen(
      (universityRepositoryError) => emit(
        state.copyWith(universityRepositoryError: universityRepositoryError),
      ),
    );
  }

  void setTab(HomeTab tab) => emit(
    state.copyWith(
      tab: tab,
      universityRepositoryError: state.universityRepositoryError,
    ),
  );

  void clearErrorMessage() =>
      emit(state.copyWith(universityRepositoryError: null));

  @override
  Future<void> close() {
    _errorMessageSubscription.cancel();
    return super.close();
  }
}
