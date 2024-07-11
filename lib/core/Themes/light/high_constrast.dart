import 'package:flutter/material.dart';


class ThemeLightHighContrast {
  ThemeLightHighContrast._();

  /// lIGHT HIGH CONTRAST THEME
  static final lightHighContrastTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: TwConstants().colorLightHighContrastMain,
    primaryColor: TwConstants().colorLightHighContrastPrimary,
    indicatorColor: TwConstants().colorLightHighContrastPrimary,
    canvasColor: TwConstants().colorLightHighContrastMain,
    cardColor: TwConstants().colorLightHighContrastMain,
    dialogBackgroundColor: TwConstants().colorLightHighContrastMain,
    disabledColor: TwConstants().colorLightHighContrastUntouchable,

    /// COLOR SCHEME
    colorScheme: ColorScheme(
      primary: TwConstants().colorLightHighContrastPrimary,
      secondary: TwConstants().colorLightHighContrastPrimary,
      surface: TwConstants().colorLightHighContrastMain,
      background: TwConstants().colorLightHighContrastMain,
      error: TwConstants().colorAlarmDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
      brightness: Brightness.light,
    ),

   

    /// ODERS
  );
}
