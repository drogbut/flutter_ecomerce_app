import 'package:flutter/material.dart';

import '../../../core/constants/my_styles.dart';
import '../../../core/extensions/widget.dart';

class DElevatedButtonTheme {
  DElevatedButtonTheme._();

  /// LIGHT
  static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: MyStyles.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );

  /// DARK
  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: MyStyles.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}