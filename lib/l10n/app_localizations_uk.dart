// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get none => 'Ніякий';

  @override
  String get calendar => 'Календар';

  @override
  String get tasks => 'Задачі';

  @override
  String get more => 'Більше';

  @override
  String get search => 'Пошук';

  @override
  String get type => 'Тип';

  @override
  String get time => 'Час';

  @override
  String get date => 'Дата';

  @override
  String get start => 'Початой';

  @override
  String get end => 'Кінець';

  @override
  String get today => 'Сьогодні';

  @override
  String get tomorrow => 'Завтра';

  @override
  String get yesterday => 'Учора';

  @override
  String daysAgo(int days) {
    return '$days днів тому';
  }

  @override
  String daysFromNow(int days) {
    return 'через $days днів';
  }

  @override
  String get confirm => 'Підтвердити';

  @override
  String get schedulesManage => 'Керування розкладами';

  @override
  String get groups => 'Групи';

  @override
  String get teachers => 'Викладачі';

  @override
  String get room => 'Кімната';

  @override
  String get rooms => 'Кімнати';

  @override
  String get myGroup => 'Моя група';

  @override
  String get supertasksEmpty => 'Немає задач';

  @override
  String get supertasksError => 'Помилка отримання задач';

  @override
  String get noSubjectError => 'Немає предмету';

  @override
  String get noTimeError => 'Немає часу';

  @override
  String get noTypeError => 'Немає типу';

  @override
  String get supertasksEdit => 'Редаугвати задачу';

  @override
  String get subtasks => 'Підзадачі';

  @override
  String get subtasksEmpty => 'Немає підзадач';

  @override
  String get subtasksError => 'Помилка отримання підзадач';

  @override
  String get project => 'Проєкт';

  @override
  String get subject => 'Предмет';

  @override
  String get lecture => 'Лекція';

  @override
  String get practice => 'Практична';

  @override
  String get laboratory => 'Лабораторна';

  @override
  String get consultation => 'Консультація';

  @override
  String get test => 'Тест';

  @override
  String get exam => 'Екзамен';

  @override
  String subtasksDoneTotal(int done, int total) {
    return '$done з $total';
  }

  @override
  String get title => 'Назва';

  @override
  String get titleEmptyOrWhitespace => 'Назва не має бути пустою';

  @override
  String get addDeadline => 'Додати дедлайн';

  @override
  String get addSubtasks => 'Додати підзадачі';

  @override
  String get theme => 'Тема';

  @override
  String get defaultCalendarMode => 'Режим календаря за замовчуванням';

  @override
  String get accentColor => 'Колір акценту';

  @override
  String get system => 'Системна';

  @override
  String get light => 'Світла';

  @override
  String get dark => 'Темна';

  @override
  String get schedule => 'Розклад';

  @override
  String get week => 'Тиждень';

  @override
  String get month => 'Місяць';

  @override
  String get blue => 'Синій';

  @override
  String get red => 'Червоний';

  @override
  String get green => 'Зелений';

  @override
  String get yellow => 'Жовтий';

  @override
  String get orange => 'Оранжевий';

  @override
  String get purple => 'Фіолетовий';

  @override
  String get updateError => 'Помилка оновлення';
}
