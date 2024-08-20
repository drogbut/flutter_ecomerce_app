import 'package:flutter/material.dart';

import '../../../core/constants/my_colors.dart';

class DColorSchemeTheme {
  DColorSchemeTheme._();

  /// LIGHT
  static ColorScheme light = const ColorScheme.light(
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
  );

  /// DARK
  static ColorScheme dark = const ColorScheme.dark(
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
  );
}
