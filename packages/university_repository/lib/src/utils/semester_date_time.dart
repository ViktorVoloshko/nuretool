extension SemesterDateTime on DateTime {
  DateTime get startOfSemester => switch (month) {
    DateTime.january => DateTime(year - 1, 9, 1),
    >= DateTime.september => DateTime(year, 9, 1),
    >= DateTime.january => DateTime(year, 2, 1),
    _ => throw StateError('not sure how you can you even get here'),
  };

  DateTime get endOfSemester => switch (month) {
    DateTime.january => DateTime(year, 1, 31),
    >= DateTime.september => DateTime(year + 1, 1, 31),
    >= DateTime.january => DateTime(year, 8, 31),
    _ => throw StateError('not sure how you can you even get here'),
  };
}
