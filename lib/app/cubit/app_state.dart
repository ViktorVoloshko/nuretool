part of 'app_cubit.dart';

final class AppState extends Equatable {
  const AppState({required this.theme});

  final AppTheme theme;

  AppState copyWith(AppTheme? theme) => AppState(theme: theme ?? this.theme);

  @override
  List<Object> get props => [theme];
}
