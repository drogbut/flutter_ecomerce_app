import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';

class DOutlinedButtonTheme {
  DOutlinedButtonTheme._();

  /// LIGHT
  static OutlinedButtonThemeData light = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black,
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: DSizes.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSizes.buttonRadius),
      ),
    ),
  );

  /// DARK
  static OutlinedButtonThemeData dark = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.white,
      padding: (h: 50, v: 16).symmetricPadding,
      elevation: DSizes.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DSizes.buttonRadius),
      ),
    ),
  );
}
