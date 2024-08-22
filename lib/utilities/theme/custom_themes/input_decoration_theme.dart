import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';

class DInputDecorationTheme {
  DInputDecorationTheme._();

  /// LIGHT
  static InputDecorationTheme light = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(DSizes.smallBorderRadius),
    ),
  );

  /// DARK
  static InputDecorationTheme dark = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(DSizes.smallBorderRadius),
    ),
  );
}
