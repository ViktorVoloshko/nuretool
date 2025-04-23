// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get calendar => 'Calendar';

  @override
  String get tasks => 'Tasks';

  @override
  String get more => 'More';

  @override
  String get no_supertasks => 'No tasks';

  @override
  String get project => 'Project';

  @override
  String get subject => 'Subject';

  @override
  String subtasksDoneTotal(Object done, Object total) {
    return '$done out of $total';
  }
}
