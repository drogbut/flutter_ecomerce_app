import 'package:intl/intl.dart';

extension DateUtilExtension on DateTime {
  DateTime getMonday({required int dayOfWeek}) {
    return subtract(Duration(days: weekday - dayOfWeek)).copyWith(
      hour: 0,
      minute: 0,
      second: 1,
    );
  }

  DateTime getFirstOfMonth() {
    return DateTime(year, month, 1);
  }

  String formatDateWithWeekday() => DateFormat.yMEd().format(this);
  String formatTime() => DateFormat('HH:mm').format(this);

  String formatForLogOutput({bool lineBreak = true}) =>
      '${DateFormat.yMMMd().format(this)}${lineBreak ? '\n' : ' - '}${DateFormat('HH:mm:ss').format(this)}';

  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  DateTime get startOfDay => copyWith(
        hour: 0,
        minute: 0,
        second: 0,
        millisecond: 0,
      );

  DateTime get endOfDay => copyWith(
        hour: 23,
        minute: 59,
        second: 59,
        millisecond: 999,
      );

  DateTime get nextDay => DateTime(year, month, day + 1);
  DateTime get nextMonth => DateTime(year, month + 1, day);

  DateTime get previousDay => DateTime(year, month, day - 1);
  DateTime get previousMonth => DateTime(year, month - 1, day);

  bool isSame(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isSameOrBefore(DateTime other) => isBefore(other) || isSame(other);
  bool isSameOrAfter(DateTime other) => isAfter(other) || isSame(other);

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

  int getMonthWeeks() {
    int firstWeekNo = getFirstOfMonth().weekNo;
    int lastWeekNo = getFirstOfMonth().nextMonth.subtract(const Duration(days: 1)).weekNo;

    if (lastWeekNo < firstWeekNo) {
      int yearWeeks = _numOfWeeks(year);

      return yearWeeks - firstWeekNo + lastWeekNo + 1;
    }

    return lastWeekNo - firstWeekNo + 1;
  }
}

int _numOfWeeks(int year) {
  DateTime dec28 = DateTime(year, 12, 28);
  int dayOfDec28 = int.parse(DateFormat('D').format(dec28));

  return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
}
