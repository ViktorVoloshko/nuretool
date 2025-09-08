extension SemesterDateTime on DateTime {
  DateTime get startOfSemester => switch (month) {
    DateTime.january => DateTime(year - 1, DateTime.august, 1),
    >= DateTime.august => DateTime(year, DateTime.august, 1),
    > DateTime.january => DateTime(year, DateTime.february, 1),
    _ => throw StateError('not sure how you can even get here'),
  };

  DateTime get endOfSemester => switch (month) {
    DateTime.january => DateTime(year, DateTime.january, 31),
    >= DateTime.august => DateTime(year + 1, DateTime.january, 31),
    > DateTime.january => DateTime(year, DateTime.july, 31),
    _ => throw StateError('not sure how you can even get here'),
  };
}
