import 'package:flutter/material.dart';

import '../../core/constants/my_colors.dart';
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/colorscheme_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/input_decoration_theme.dart';
import 'custom_themes/text_theme.dart';

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
    inputDecorationTheme: DInputDecorationTheme.light,
  );

  /// DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: DColorSchemeTheme.dark,
    scaffoldBackgroundColor: MyColors.darkBackground,
    primaryColor: MyColors.lightPrimary,
    textTheme: DTextTheme.dark,
    appBarTheme: DAppBarTheme.dark,
    elevatedButtonTheme: DElevatedButtonTheme.dark,
    inputDecorationTheme: DInputDecorationTheme.dark,
  );
}
