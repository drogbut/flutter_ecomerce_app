import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';
import '../../constants/my_styles.dart';
import '../../extensions/widget.dart';

class ThemesDark {
  ThemesDark._();

  /// DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.darkBackground,
    primaryColor: MyColors.lightPrimary,

    /// COLOR SCHEME
    colorScheme: const ColorScheme.dark(
      brightness: Brightness.dark,
      primary: MyColors.lightPrimary,
      onPrimary: MyColors.darkOnPrimary,
      secondary: MyColors.darkSecondary,
      onSecondary: MyColors.darkOnSecondary,
      error: MyColors.darkError,
      onError: MyColors.darkOnError,
      surface: MyColors.darkSurface,
      onSurface: MyColors.darkOnSurface,
      outline: MyColors.darkOutline,
      primaryContainer: MyColors.darkPrimaryContainer,
    ),

    textTheme: const TextTheme(
      labelLarge: TextStyle(
        fontSize: MyStyles.labelLarge,
      ),
    ),

    /// PRIMARY BUTTON
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: MyStyles.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    )),

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
      elevation: MyStyles.zero,
    ),
  );
}
