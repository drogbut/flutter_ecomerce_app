import 'package:flutter/material.dart';


class ThemesLight {
  ThemesLight._();

  /// LIGHT THEME
  static final lightTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: TwConstants().colorLightMain,
    primaryColor: TwConstants().colorLightPrimary,
    indicatorColor: TwConstants().colorLightPrimary,
    canvasColor: TwConstants().colorLightMain,
    cardColor: TwConstants().colorLightMain,
    dialogBackgroundColor: TwConstants().colorLightMain,
    disabledColor: TwConstants().colorLightUntouchable,

    /// COLOR SCHEME
    colorScheme: ColorScheme(
      primary: TwConstants().colorLightPrimary,
      secondary: TwConstants().colorMobilePrimary02,
      secondaryContainer: TwConstants().colorLightSecondaryContainer,
      surface: TwConstants().colorLightMain,
      background: TwConstants().colorLightMain,
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
