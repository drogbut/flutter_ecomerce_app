import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';

class DInputDecorationTheme {
  DInputDecorationTheme._();

  /// LIGHT
  static InputDecorationTheme light = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
    ),
  );

  /// DARK
  static InputDecorationTheme dark = InputDecorationTheme(
    filled: true,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
    ),
  );
}
