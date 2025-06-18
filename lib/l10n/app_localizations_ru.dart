// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get none => 'Отсутствует';

  @override
  String get calendar => 'Календарь';

  @override
  String get tasks => 'Задачи';

  @override
  String get more => 'Больше';

  @override
  String get search => 'Поиск';

  @override
  String get type => 'Тип';

  @override
  String get time => 'Время';

  @override
  String get date => 'Дата';

  @override
  String get start => 'Начало';

  @override
  String get end => 'Конец';

  @override
  String get today => 'Сегодня';

  @override
  String get tomorrow => 'Завтра';

  @override
  String get yesterday => 'Вчера';

  @override
  String daysAgo(int days) {
    return '$days дней назад';
  }

  @override
  String daysFromNow(int days) {
    return 'Через $days дней';
  }

  @override
  String get confirm => 'Подтвердить';

  @override
  String get schedulesManage => 'Управление расписаниями';

  @override
  String get groups => 'Группы';

  @override
  String get teachers => 'Преподаватели';

  @override
  String get room => 'Комната';

  @override
  String get rooms => 'Комнаты';

  @override
  String get myGroup => 'Моя группа';

  @override
  String get supertasksEmpty => 'Нету задач';

  @override
  String get supertasksError => 'Ошибка получения задач';

  @override
  String get noSubjectError => 'Нет предмета';

  @override
  String get noTimeError => 'Нету времени';

  @override
  String get noTypeError => 'Нету типа';

  @override
  String get supertasksEdit => 'Редактировать задачу';

  @override
  String get subtasks => 'Подзадачи';

  @override
  String get subtasksEmpty => 'Нету подзадач';

  @override
  String get subtasksError => 'Ошибка получения подзадач';

  @override
  String get project => 'Проэкт';

  @override
  String get subject => 'Предмет';

  @override
  String get lecture => 'Лекция';

  @override
  String get practice => 'Практическая';

  @override
  String get laboratory => 'Лабораторная';

  @override
  String get consultation => 'Консультация';

  @override
  String get test => 'Тест';

  @override
  String get exam => 'Экзамен';

  @override
  String subtasksDoneTotal(int done, int total) {
    return '$done из $total';
  }

  @override
  String get title => 'Название';

  @override
  String get titleEmptyOrWhitespace => 'Название не должно быть пустым';

  @override
  String get addDeadline => 'Добавить дедлайн';

  @override
  String get addSubtasks => 'Добавить подзадачти';

  @override
  String get theme => 'Тема';

  @override
  String get defaultCalendarMode => 'Режим календаря по умолчанию';

  @override
  String get accentColor => 'Цвет акцента';

  @override
  String get system => 'Системная';

  @override
  String get light => 'Светлая';

  @override
  String get dark => 'Тёмная';

  @override
  String get schedule => 'Расписание';

  @override
  String get week => 'Неделя';

  @override
  String get month => 'Месяц';

  @override
  String get blue => 'Синий';

  @override
  String get red => 'Красный';

  @override
  String get green => 'Зелёный';

  @override
  String get yellow => 'Жёлтый';

  @override
  String get orange => 'Оранжевый';

  @override
  String get purple => 'Фиолетовый';

  @override
  String get updateError => 'Ошибка обновления';

  @override
  String get updateOngoing => 'Подождите пока закончится обновление';
}
