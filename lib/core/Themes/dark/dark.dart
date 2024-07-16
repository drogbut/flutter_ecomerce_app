import 'package:flutter/material.dart';

import '../../constants/my_colors.dart';

class ThemesDark {
  ThemesDark._();

  /// DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: MyColors.background,
    primaryColor: MyColors.primary,

    /// ODERS
  );
}
