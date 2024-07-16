import 'package:flutter/material.dart';

import '../../../../locator.dart';
import '../core/utilities/preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeProvider() {
    String theme = sl.get<UtilityPreferences>().getString('Theme');
    if (theme == 'Light') {
      themeMode = ThemeMode.light;
    } else if (theme == 'Dark') {
      themeMode = ThemeMode.dark;
    } else if (theme == 'System') {
      themeMode = ThemeMode.system;
    } else if (theme == '') {
      themeMode = ThemeMode.dark;
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
    String themeModeString = '';
    switch (themeModeIn) {
      case ThemeMode.light:
        {
          themeModeString = 'Light';
          themeMode = ThemeMode.light;
        }
        break;
      case ThemeMode.dark:
        {
          themeModeString = 'Dark';
          themeMode = ThemeMode.dark;
        }
        break;
      case ThemeMode.system:
        {
          themeModeString = 'System';
          themeMode = ThemeMode.system;
        }
        break;
    }
    sl.get<UtilityPreferences>().setString('Theme', themeModeString);
    notifyListeners();
  }
}
