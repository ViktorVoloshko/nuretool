import 'package:intl/intl.dart';

extension DateTimeUtils on DateTime {
  String toLocalDateFormatString() =>
      DateFormat.yMMMMEEEEd().add_jm().format(this);

  Duration differenceInDays(DateTime from) {
    final thisWithoutTime = DateTime(year, month, day);
    final fromWithoutTime = DateTime(from.year, from.month, from.day);

    return thisWithoutTime.difference(fromWithoutTime);
  }
}
