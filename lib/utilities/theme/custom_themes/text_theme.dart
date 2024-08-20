import 'package:flutter/material.dart';

import '../../../core/constants/my_styles.dart';

class DTextTheme {
  DTextTheme._();

  /// LIGHT
  static TextTheme light = TextTheme(
    labelLarge: const TextStyle().copyWith(fontSize: MyStyles.labelLarge),
  );

  /// DARK
  static TextTheme dark = TextTheme(
    labelLarge: const TextStyle().copyWith(fontSize: MyStyles.labelLarge),
  );
}
