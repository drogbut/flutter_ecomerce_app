import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class DColorSchemeTheme {
  DColorSchemeTheme._();

  /// LIGHT
  static ColorScheme light = const ColorScheme.light(
    brightness: Brightness.light,
    primary: TColors.primary,
    //onPrimary: DColors.secondary,
    secondary: TColors.accent,
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
    primary: TColors.primary,
    //onPrimary: DColors.primary,
    secondary: TColors.accent,
    // onSecondary: DColors.darkOnSecondary,
    error: TColors.error,
    // onError: DColors.darkOnError,
    // surface: DColors.darkSurface,
    // onSurface: DColors.darkOnSurface,
    // outline: DColors.darkOutline,
    //primaryContainer: TColors.darkContainer,
  );
}
