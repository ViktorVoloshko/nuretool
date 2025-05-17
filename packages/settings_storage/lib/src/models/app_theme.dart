import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_theme.g.dart';

@immutable
@JsonSerializable()
class AppTheme extends Equatable {
  const AppTheme({required this.appThemeMode});

  const AppTheme.defaultValues() : appThemeMode = AppThemeMode.system;

  factory AppTheme.fromJson(Map<String, dynamic> json) =>
      _$AppThemeFromJson(json);

  final AppThemeMode appThemeMode;

  AppTheme copyWith({AppThemeMode? appThemeMode}) =>
      AppTheme(appThemeMode: appThemeMode ?? this.appThemeMode);

  Map<String, dynamic> toJson() => _$AppThemeToJson(this);

  @override
  List<Object?> get props => [appThemeMode];
}

enum AppThemeMode { system, light, dark }
