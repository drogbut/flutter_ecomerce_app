import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';

class DInputDecorationTheme {
  DInputDecorationTheme._();

  /// LIGHT
  static InputDecorationTheme light = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
    ),
  );

  /// DARK
  static InputDecorationTheme dark = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
    ),
  );
}
