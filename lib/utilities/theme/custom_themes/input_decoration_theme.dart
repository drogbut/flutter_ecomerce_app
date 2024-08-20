import 'package:flutter/material.dart';

import '../../../core/constants/my_styles.dart';

class DInputDecorationTheme {
  DInputDecorationTheme._();

  /// LIGHT
  static InputDecorationTheme light = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(MyStyles.smallBorderRadius),
    ),
  );

  /// DARK
  static InputDecorationTheme dark = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(MyStyles.smallBorderRadius),
    ),
  );
}
