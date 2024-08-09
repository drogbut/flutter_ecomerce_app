extension TextAlternativeExtension on String {
  double parseToDoubleTime() {
    try {
      return double.parse(replaceAll(',', '.').replaceAll(':', '.'));
    } catch (e) {
      rethrow;
    }
  }

  double? tryParseToDoubleTime() => double.tryParse(replaceAll(',', '.').replaceAll(':', '.'));
}

extension ReportCodeString on String {
  int get intVal => int.parse(this);
}

extension TwBool on String {
  bool toBool({bool defaultBool = false}) {
    switch (toLowerCase()) {
      case 'true':
        return true;

      case 'false':
        return false;

      default:
        return defaultBool;
    }
  }
}
