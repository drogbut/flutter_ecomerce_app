import 'package:intl/intl.dart';

class UtilityDateFormat {
  late int _dateFormat;
  late String _dateSeparator;
  late String _datePattern;

  static final UtilityDateFormat _instance = UtilityDateFormat._internal();

  factory UtilityDateFormat() => _instance;

  int get dateFormat => _dateFormat;

  String get dateSeparator => _dateSeparator;
  String get datePattern => _datePattern;
  String get datePatternWithWeekday => 'E, $datePattern';

  UtilityDateFormat._internal() {
    _initDateFormat();
  }

  void reInitDateFormat() {
    _initDateFormat();
  }

  void _initDateFormat() => _initDatumFormatFromExtern(
        DateFormat.yMd().format(DateTime.utc(2099, 11, 24, 3, 0, 0)),
      );

  void _initDatumFormatFromExtern(String localDateFrom24112099) {
    List<String> dateSeparator = ['.', '/', '-'];

    int separatorIndex = -1;
    List<String>? tempList;
    for (int i = 0; i < dateSeparator.length; i++) {
      if (localDateFrom24112099.contains(dateSeparator[i])) {
        separatorIndex = i;
        tempList = localDateFrom24112099.split(dateSeparator[i]);
        break;
      }
    }

    int typ = 1;
    if (separatorIndex < 0 || separatorIndex > dateSeparator.length - 1 || tempList == null || tempList.length < 3) {
      separatorIndex = 0;
    } else {
      int dayIndex = -1;
      int monthIndex = -1;
      List<int?> intList = List.filled(3, null);

      for (int i = 0; i < intList.length; i++) {
        intList[i] = int.tryParse(tempList[i]);
      }

      for (int i = 0; i < intList.length; i++) {
        if (intList[i] == 24 || containsDayPattern(tempList[i])) {
          dayIndex = i;
        }
        if (intList[i] == 11 || containsMonthPattern(tempList[i])) {
          monthIndex = i;
        }
      }

      if (dayIndex < 0 || monthIndex < 0 || dayIndex == monthIndex) {
        typ = 1;
      } else {
        if (dayIndex == monthIndex - 1) {
          if (dayIndex == 0) {
            typ = 1;
          } else {
            typ = 4;
          }
        } else if (monthIndex == dayIndex - 1) {
          if (monthIndex == 0) {
            typ = 2;
          } else {
            typ = 3;
          }
        } else {
          separatorIndex = 0;
        }
      }
    }

    _dateFormat = typ;
    _dateSeparator = dateSeparator[separatorIndex];
    _setDatePattern();
  }

  bool containsDayPattern(String tempList) => tempList.toLowerCase().contains('dd') ||
        tempList.contains('24') ||
        tempList.contains('25') ||
        tempList.contains('23');

  bool containsMonthPattern(String tempList) => tempList.toLowerCase().contains('mm') || tempList.contains('11');

  void _setDatePattern() {
    switch (_dateFormat) {
      case 2:
        _datePattern = 'MM&&dd&&yyyy'.replaceAll('&&', _dateSeparator); // Month(Separator)Day(Separator)Year
        break;
      case 3:
        _datePattern = 'yyyy&&MM&&dd'.replaceAll('&&', _dateSeparator); // Year(Separator)Month(Separator)Day
        break;
      case 4:
        _datePattern = 'yyyy&&dd&&MM'.replaceAll('&&', _dateSeparator); // Year(Separator)Day(Separator)Month
        // No country uses this pattern so it can't be tested // coverage:ignore-line
        break;
      default:
        _datePattern = 'dd&&MM&&yyyy'.replaceAll('&&', _dateSeparator); // Day(Separator)Month(Separator)Year
        break;
    }
  }
}
