import '../../locator.dart';
import '../_enums.dart';
import '../_utilities.dart';

extension TextAlternativeExtension on String {
  String alternative({Module? module, bool plusAndSymbol = false}) {
    return sl.get<UtilityTextAlternative>().getAlternativeText(
          this,
          module: module,
          plusAndSymbol: plusAndSymbol,
        );
  }

  double parseToDoubleTime() {
    try {
      return double.parse(replaceAll(',', '.').replaceAll(':', '.'));
    } catch (e) {
      rethrow;
    }
  }

  double? tryParseToDoubleTime() {
    return double.tryParse(replaceAll(',', '.').replaceAll(':', '.'));
  }
}

extension ReportCodeString on String {
  int get intVal => int.parse(this);
}
