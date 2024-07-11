import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/utilities/preferences.dart';

import '../locator.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeProvider() {
    String theme = sl.get<UtilityPreferences>().getString('Theme');
  }
}
