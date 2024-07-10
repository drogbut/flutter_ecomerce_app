extension TisowareBool on bool {
  String get toTwStringBool => this ? '1' : '0';
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
