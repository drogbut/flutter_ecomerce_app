import 'package:flutter/material.dart';


class ThemesDarkHighContrast {
  ThemesDarkHighContrast._();

  /// DARK HIGH CONTRAST THEME
  static final darkHighContrastTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: TwConstants().colorDarkHighContrastMain,
    primaryColor: TwConstants().colorDarkHighContrastPrimary,
    indicatorColor: TwConstants().colorDarkHighContrastPrimary,
    canvasColor: TwConstants().colorDarkHighContrastMutedMore,
    cardColor: TwConstants().colorDarkHighContrastMutedMore,
    dialogBackgroundColor: TwConstants().colorDarkHighContrastMutedMore,
    disabledColor: TwConstants().colorDarkHighContrastUntouchable,

    /// COLOR SCHEME
    colorScheme: ColorScheme(
      primary: TwConstants().colorDarkHighContrastPrimary,
      inversePrimary: TwConstants().colorDarkHighContrastInverted,
      secondary: TwConstants().colorDarkHighContrastPrimary,
      secondaryContainer: TwConstants().colorDarkHighContrastPrimary,
      surface: TwConstants().colorDarkHighContrastMain,
      background: TwConstants().colorDarkHighContrastMain,
      error: TwConstants().colorAlarmDark,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
      brightness: Brightness.dark,
    ),

   
    /// ODERS
  );
}
