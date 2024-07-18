import 'package:flutter/material.dart';

import '../../constants/my_styles.dart';

class ThemesLight {
  ThemesLight._();

  /// LIGHT THEME
  static final lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Poppins',
    brightness: Brightness.light,

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
