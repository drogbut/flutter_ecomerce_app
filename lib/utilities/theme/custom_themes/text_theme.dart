import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';

class DTextTheme {
  DTextTheme._();

  /// LIGHT
  static TextTheme light = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    labelLarge: const TextStyle().copyWith(fontSize: TSizes.labelLarge),
  );

  /// DARK
  static TextTheme dark = TextTheme(
    headlineLarge: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    headlineSmall: const TextStyle().copyWith(fontWeight: FontWeight.bold),
    labelLarge: const TextStyle().copyWith(fontSize: TSizes.labelLarge),
  );
}
