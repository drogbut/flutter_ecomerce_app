import 'enums.dart';

class MyDateTime {
  MyDateTime._();

  /// Standard cases
  static const int dayPerJanuary = 31;
  static const int dayPerFebruary = 28;
  static const int dayPerMarch = 31;
  static const int dayPerApril = 30;
  static const int dayPerMay = 31;
  static const int dayPerJun = 30;
  static const int dayPerJuly = 31;
  static const int dayPerAugust = 31;
  static const int dayPerSeptember = 30;
  static const int dayPerOctober = 31;
  static const int dayPerNovember = 30;
  static const int dayPerDecember = 31;

  /// Special cases
  static int dayPerLeapFebruary() => dayPerFebruary + 1;
  static int dayPerLeapYear() => dayPerYear + 1;
  static int dayPerLeap4Year() => (3 * dayPerYear) + dayPerYear;

  /// Resumes
  static const int dayPerWeek = 7;
  static const int dayShortMonth = 30;
  static const int dayLongMonth = 31;
  static const int dayPerYear = 365;

  /// References
  static const int referenceYear = 1904;
  static const int referenceDayInMonth = 1;
  static const MyMonth referenceMonth = MyMonth.january;
  static const MyWeekday referenceWeek = MyWeekday.friday;

  /// Start and End
  static DateTime myFirstDate = DateTime(1900, 1, 1);
  static DateTime myLastDate = DateTime(2099, 12, 31);

  /// Null time, zero time and placeholder
  static const String nullTime = '--:--';
  static const String zeroTime = '0:00';
  static const String dateTimePlaceholder = '--:--';
}
