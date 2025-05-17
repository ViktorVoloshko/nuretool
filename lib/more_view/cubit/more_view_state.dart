part of 'more_view_cubit.dart';

final class MoreViewState extends Equatable {
  const MoreViewState({required this.appTheme});

  final AppTheme appTheme;

  @override
  List<Object> get props => [appTheme];
}
