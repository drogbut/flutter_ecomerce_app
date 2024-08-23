import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class DColorSchemeTheme {
  DColorSchemeTheme._();

  /// LIGHT
  static ColorScheme light = const ColorScheme.light(
    brightness: Brightness.light,
    primary: DColors.secondary,
    //onPrimary: DColors.secondary,
    // secondary: DColors.darkSecondary,
    // onSecondary: DColors.darkOnSecondary,
    // error: DColors.darkError,
    // onError: DColors.darkOnError,
    // surface: DColors.darkSurface,
    // onSurface: DColors.darkOnSurface,
    // outline: DColors.darkOutline,
    // primaryContainer: DColors.darkPrimaryContainer,
  );

  /// DARK
  static ColorScheme dark = const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: DColors.primary,
    // onPrimary: DColors.darkOnPrimary,
    secondary: DColors.secondary,
    // onSecondary: DColors.darkOnSecondary,
    error: DColors.error,
    // onError: DColors.darkOnError,
    // surface: DColors.darkSurface,
    // onSurface: DColors.darkOnSurface,
    // outline: DColors.darkOutline,
    primaryContainer: DColors.darkContainer,
  );
}
