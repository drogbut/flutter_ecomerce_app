import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'custom_themes/_custom_theme.dart';
import 'custom_themes/outline_button_theme.dart';

class DTheme {
  DTheme._();

  /// LIGHT THEME
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: DColorSchemeTheme.light,
    //scaffoldBackgroundColor: MyColors.darkBackground,
    //primaryColor: MyColors.lightPrimary,

    textTheme: DTextTheme.light,
    appBarTheme: DAppBarTheme.light,
    elevatedButtonTheme: DElevatedButtonTheme.light,
    textButtonTheme: DTextButtonTheme.light,
    inputDecorationTheme: DInputDecorationTheme.light,
    outlinedButtonTheme: DOutlinedButtonTheme.light,
  );

  /// DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: DColorSchemeTheme.dark,
    scaffoldBackgroundColor: DColors.dark,
    primaryColor: DColors.primary,
    textTheme: DTextTheme.dark,
    appBarTheme: DAppBarTheme.dark,
    elevatedButtonTheme: DElevatedButtonTheme.dark,
    textButtonTheme: DTextButtonTheme.dark,
    inputDecorationTheme: DInputDecorationTheme.dark,
    outlinedButtonTheme: DOutlinedButtonTheme.dark,
  );
}
