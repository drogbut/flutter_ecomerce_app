import 'package:flutter/material.dart';

import '../../../../locator.dart';
import '../core/utilities/preferences.dart';

class ThemeProvider {
  final ValueNotifier<ThemeMode> _themeModeNotifier =
      ValueNotifier(ThemeMode.system);

  ValueNotifier<ThemeMode> get themeModeNotifier => _themeModeNotifier;

  ThemeMode get themeMode => _themeModeNotifier.value;

  setThemeMode(ThemeMode value) => _themeModeNotifier.value = value;

  ThemeProvider() {
    String theme = sl.get<UtilityPreferences>().getString('Theme');
    if (theme == 'Light') {
      setThemeMode(ThemeMode.light);
    } else if (theme == 'Dark') {
      setThemeMode(ThemeMode.dark);
    } else if (theme == 'System') {
      setThemeMode(ThemeMode.system);
    } else if (theme == '') {
      setThemeMode(ThemeMode.dark);
    }
  }

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness =
          WidgetsBinding.instance.platformDispatcher.platformBrightness;

      return brightness == Brightness.dark;
    }

    return themeMode == ThemeMode.dark;
  }

  void changeTheme(ThemeMode themeModeIn) {
    setThemeMode(themeModeIn);
    String themeModeString;
    switch (themeModeIn) {
      case ThemeMode.light:
        themeModeString = 'Light';
        break;
      case ThemeMode.dark:
        themeModeString = 'Dark';
        break;
      case ThemeMode.system:
        themeModeString = 'System';
        break;
    }
    sl.get<UtilityPreferences>().setString('Theme', themeModeString);
  }
}
