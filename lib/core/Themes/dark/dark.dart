import 'package:flutter/material.dart';

class ThemesDark {
  ThemesDark._();

  /// DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: false,
    scaffoldBackgroundColor: TwConstants().colorDarkMain,
    primaryColor: TwConstants().colorDarkPrimary,
    indicatorColor: TwConstants().colorDarkPrimary,
    canvasColor: TwConstants().colorDarkMain,
    cardColor: TwConstants().colorDarkMutedMore,
    dialogBackgroundColor: TwConstants().colorDarkMain,
    disabledColor: TwConstants().colorDarkUntouchable,

    /// COLOR SCHEME
    colorScheme: ColorScheme(
      primary: TwConstants().colorDarkPrimary,
      inversePrimary: TwConstants().colorDarkInverted,
      secondary: TwConstants().colorDarkPrimary,
      secondaryContainer: TwConstants().colorDarkPrimary,
      surface: TwConstants().colorDarkMain,
      background: TwConstants().colorDarkMain,
      error: TwConstants().colorAlarmDark,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.black,
      brightness: Brightness.dark,
    ),

    
    /// ODERS
  );
}
