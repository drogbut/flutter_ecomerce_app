import 'package:flutter/material.dart';

import '../../constants/my_styles.dart';

class ThemeLightHighContrast {
  ThemeLightHighContrast._();

  /// lIGH HIGH CONTRAST THEME
  static final lightHighContrastTheme = ThemeData(
    useMaterial3: false,

    /// INPUT DECORATION
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(MyStyles.smallBorderRadius),
      ),
    ),

    /// APP BAR
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
  );
}
