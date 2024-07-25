import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../locator.dart';
import '../core/utilities/preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _initializeTheme();
  }

  void _initializeTheme() {
    String theme = sl.get<UtilityPreferences>().getString('Theme');
    if (theme == 'Light') {
      emit(ThemeMode.light);
    } else if (theme == 'Dark') {
      emit(ThemeMode.dark);
    } else if (theme == 'System') {
      emit(ThemeMode.system);
    } else if (theme == '') {
      emit(ThemeMode.dark);
    }
  }

  bool get isDarkMode {
    if (state == ThemeMode.system) {
      final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
      return brightness == Brightness.dark;
    }
    return state == ThemeMode.dark;
  }

  void changeTheme(ThemeMode themeModeIn) {
    emit(themeModeIn);
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
