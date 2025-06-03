// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get none => 'None';

  @override
  String get calendar => 'Calendar';

  @override
  String get tasks => 'Tasks';

  @override
  String get more => 'More';

  @override
  String get search => 'Search';

  @override
  String get type => 'Type';

  @override
  String get time => 'Time';

  @override
  String get today => 'Today';

  @override
  String get tomorrow => 'Tomorrow';

  @override
  String get yesterday => 'Yesterday';

  @override
  String daysAgo(int days) {
    return '$days days ago';
  }

  @override
  String daysFromNow(int days) {
    return '$days days from now';
  }

  @override
  String get schedulesManage => 'Manage schedules';

  @override
  String get groups => 'Groups';

  @override
  String get teachers => 'Teachers';

  @override
  String get room => 'Room';

  @override
  String get rooms => 'Rooms';

  @override
  String get myGroup => 'My group';

  @override
  String get supertasksEmpty => 'No tasks';

  @override
  String get supertasksError => 'Error retrieving tasks';

  @override
  String get supertasksEdit => 'Edit task';

  @override
  String get subtasks => 'Subtasks';

  @override
  String get subtasksEmpty => 'No subtasks';

  @override
  String get subtasksError => 'Error retrieving subtasks';

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
  String subtasksDoneTotal(int done, int total) {
    return '$done out of $total';
  }

  @override
  String get title => 'Title';

  @override
  String get titleEmptyOrWhitespace =>
      'Title shouldn\'t be empty or contain only whitespace';

  @override
  String get addDeadline => 'Add deadline';

  @override
  String get addSubtasks => 'Add subtasks';

  @override
  String get system => 'System';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';
}
