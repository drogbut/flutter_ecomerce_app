import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';

class DElevatedButtonTheme {
  DElevatedButtonTheme._();

  /// LIGHT
  static ElevatedButtonThemeData light = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: DSizes.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );

  /// DARK
  static ElevatedButtonThemeData dark = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.black,
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: DSizes.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );
}
