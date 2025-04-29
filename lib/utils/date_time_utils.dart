import 'package:intl/intl.dart';

extension LocalDateTime on DateTime {
  String toLocalDateFormatString() =>
      DateFormat.yMMMMEEEEd().add_jm().format(this);
}
