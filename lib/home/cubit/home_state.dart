part of 'home_cubit.dart';

enum HomeTab { calendar, tasks, more }

@immutable
final class HomeState extends Equatable {
  const HomeState({this.tab = HomeTab.calendar});

  final HomeTab tab;

  @override
  List<Object?> get props => [tab];
}
