import 'package:intl/intl.dart';

/// An extension on the DateTime class providing various date manipulation
/// and formatting utilities.
/// Example 1: [getMonday]
/// ```dart
/// DateTime now = DateTime.now();
/// DateTime monday = now.getMonday(dayOfWeek: 1);
/// ```
///
/// Example 2: [getFirstOfMonth]
/// ```dart
/// DateTime now = DateTime.now();
/// DateTime firstOfMonth = now.getFirstOfMonth();
/// ```
///
/// Example 3: [formatDateWithWeekday]
/// ```dart
/// DateTime now = DateTime.now();
/// String formattedDate = now.formatDateWithWeekday();
/// ```
extension DateUtilExtension on DateTime {
  /// Returns the Monday of the current week based on the specified `dayOfWeek`.
  DateTime getMonday({required int dayOfWeek}) => subtract(Duration(days: weekday - dayOfWeek)).copyWith(
      hour: 0,
      minute: 0,
      second: 1,
    );

  /// Returns the first day of the current month.
  DateTime getFirstOfMonth() => DateTime(year, month, 1);

  /// Formats the current date including the weekday.
  String formatDateWithWeekday() => DateFormat.yMEd().format(this);

  /// Formats the current time in 24-hour format (HH:mm).
  String formatTime() => DateFormat('HH:mm').format(this);

  /// Formats the date and time for log output, with an option for a line break.
  String formatForLogOutput({bool lineBreak = true}) =>
      '${DateFormat.yMMMd().format(this)}${lineBreak ? '\n' : ' - '}${DateFormat('HH:mm:ss').format(this)}';

  /// Creates a copy of the current date with modified components.
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) => DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );

  /// Returns the start of the day (00:00:00.000).
  DateTime get startOfDay => copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
      );

  /// Returns the end of the day (23:59:59.999).
  DateTime get endOfDay => copyWith(
        hour: 23,
        minute: 59,
        second: 59,
        millisecond: 999,
      );

  /// Returns the next day.
  DateTime get nextDay => DateTime(year, month, day + 1);

  /// Returns the next month.
  DateTime get nextMonth => DateTime(year, month + 1, day);

  /// Returns the previous day.
  DateTime get previousDay => DateTime(year, month, day - 1);

  /// Returns the previous month.
  DateTime get previousMonth => DateTime(year, month - 1, day);

  /// Checks if two dates are the same (year, month, day).
  bool isSame(DateTime other) => year == other.year && month == other.month && day == other.day;

  /// Checks if the current date is the same as or before another date.
  bool isSameOrBefore(DateTime other) => isBefore(other) || isSame(other);

  /// Checks if the current date is the same as or after another date.
  bool isSameOrAfter(DateTime other) => isAfter(other) || isSame(other);

  /// Returns the week number of the year for the current date.
  int get weekNo {
    int dayOfYear = int.parse(DateFormat('D').format(this));
    int weekOfYear = ((dayOfYear - weekday + 10) / 7).floor();

    if (weekOfYear < 1) {
      weekOfYear = _numOfWeeks(year - 1);
    } else if (weekOfYear > _numOfWeeks(year)) {
      weekOfYear = 1;
    }

    return weekOfYear;
  }

  /// Returns the number of weeks in the month of the current date.
  int getMonthWeeks() {
    int firstWeekNo = getFirstOfMonth().weekNo;
    int lastWeekNo =
        getFirstOfMonth().nextMonth.subtract(const Duration(days: 1)).weekNo;

    if (lastWeekNo < firstWeekNo) {
      int yearWeeks = _numOfWeeks(year);

      return yearWeeks - firstWeekNo + lastWeekNo + 1;
    }

    return lastWeekNo - firstWeekNo + 1;
  }
}

/// Returns the number of weeks in a given year.
int _numOfWeeks(int year) {
  DateTime dec28 = DateTime(year, 12, 28);
  int dayOfDec28 = int.parse(DateFormat('D').format(dec28));

  return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
}
