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
  String get error_supertasks => 'Error retrieving tasks';

  @override
  String get no_subtasks => 'No subtasks';

  @override
  String get error_subtasks => 'Error retrieving subtasks';

  @override
  String get project => 'Project';

  @override
  String get subject => 'Subject';

  @override
  String get lecture => 'Lecture';

  @override
  String get practice => 'Practice';

  @override
  String get laboratory => 'Laboratory';

  @override
  String get test => 'Test';

  @override
  String get exam => 'Exam';

  @override
  String subtasksDoneTotal(Object done, Object total) {
    return '$done out of $total';
  }

  @override
  String get title => 'Title';

  @override
  String get title_error => 'Title shouldn\'t be empty or contain only whitespace';

  @override
  String get addDeadline => 'Add deadline';

  @override
  String get addSubtasks => 'Add subtasks';
}
