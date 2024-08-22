import 'package:flutter/material.dart';

class UtilityColor {
  static final UtilityColor _instance = UtilityColor._internal();
  factory UtilityColor() => _instance;

  UtilityColor._internal();

  int getHexFromStr(String fontCode) {
    int val = 0;
    int len = fontCode.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = fontCode.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException('An error occurred when converting');
      }
    }

    return val;
  }

  // Color getBlackOrWhiteColor(Color color, {Color? dark, Color? bright}) {
  //   var grayScale = (0.299 * color.red) + (0.587 * color.green) + (0.114 * color.blue);
  //
  //   if (grayScale > 128) {
  //     return dark ?? colorDarkMain;
  //   } else {
  //     return bright ?? colorLightMain;
  //   }
  // }

  Color darken(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten(Color color, [double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(color);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
