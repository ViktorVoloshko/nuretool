part of 'home_cubit.dart';

enum HomeTab { calendar, tasks, more }

@immutable
final class HomeState extends Equatable {
  const HomeState({
    this.tab = HomeTab.calendar,
    this.universityRepositoryError,
  });

  final HomeTab tab;
  final UniversityRepositoryError? universityRepositoryError;

  HomeState copyWith({
    HomeTab? tab,
    required UniversityRepositoryError? universityRepositoryError,
  }) => HomeState(
    tab: tab ?? this.tab,
    universityRepositoryError: universityRepositoryError,
  );

  @override
  List<Object?> get props => [tab, universityRepositoryError];
}
