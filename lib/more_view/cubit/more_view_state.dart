part of 'more_view_cubit.dart';

final class MoreViewState extends Equatable {
  const MoreViewState({required this.appTheme, this.userGroup});

  final AppTheme appTheme;
  final Group? userGroup;

  MoreViewState copyWith({AppTheme? appTheme, Group? userGroup}) =>
      MoreViewState(
        appTheme: appTheme ?? this.appTheme,
        userGroup: userGroup ?? this.userGroup,
      );

  @override
  List<Object?> get props => [appTheme, userGroup];
}
