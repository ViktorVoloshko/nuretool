part of 'home_cubit.dart';

enum HomeTab { calendar, tasks, more }

@immutable
final class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.calendar, this.errorMessage});

  final HomeTab tab;
  final String? errorMessage;

  HomeState copyWith({HomeTab? tab, required String? errorMessage}) =>
      HomeState(tab: tab ?? this.tab, errorMessage: errorMessage);

  @override
  List<Object?> get props => [tab, errorMessage];
}
