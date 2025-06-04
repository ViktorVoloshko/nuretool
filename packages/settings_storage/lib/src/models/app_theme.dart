import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'app_theme.g.dart';

@immutable
@JsonSerializable()
class AppTheme extends Equatable {
  const AppTheme({required this.themeMode, required this.color});

  const AppTheme.defaultValues()
    : themeMode = AppThemeMode.system,
      color = AppThemeColor.blue;

  factory AppTheme.fromJson(Map<String, dynamic> json) =>
      _$AppThemeFromJson(json);

  final AppThemeMode themeMode;
  final AppThemeColor color;

  AppTheme copyWith({AppThemeMode? themeMode, AppThemeColor? color}) =>
      AppTheme(
        themeMode: themeMode ?? this.themeMode,
        color: color ?? this.color,
      );

  Map<String, dynamic> toJson() => _$AppThemeToJson(this);

  @override
  List<Object?> get props => [themeMode, color];
}

enum AppThemeMode { system, light, dark }

enum AppThemeColor { blue, red, green, yellow, orange, purple }
