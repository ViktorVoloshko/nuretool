part of 'more_view_cubit.dart';

final class MoreViewState extends Equatable {
  const MoreViewState({required this.settings});

  final Settings settings;

  @override
  List<Object> get props => [settings];
}
