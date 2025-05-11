import 'dart:math';

import 'package:flutter/material.dart';

/// Import the core Flutter material library for building UI components
extension ExtensionColor on Color {
  /// Converts the red channel (r) from 0.0–1.0 to an integer (0–255)
  int redInt() => (r * 255).round();

  /// Converts the green channel (g) from 0.0–1.0 to an integer (0–255)
  int greenInt() => (g * 255).round();

  /// Converts the blue channel (b) from 0.0–1.0 to an integer (0–255)
  int blueInt() => (b * 255).round();

  /// Converts the alpha channel (a) from 0.0–1.0 to an integer (0–255)
  int alphaInt() => (a * 255).round();

  /// Static method to convert a hex string to a Color object
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();

    if (hexString.length == 6 || hexString.length == 7) {
      buffer.write('ff');
    } else if (hexString == '0x00000000') {
      return Colors.transparent;
    }
    buffer.write(hexString.replaceAll('#', ''));

    return Color(int.parse(buffer.toString(), radix: 16));
  }
 Color withOpacityPercent(double value){
  assert(value >= 0.0 && value <= 1.0);
  return withAlpha((255.0 *value).round());
}
  /// Method to convert a Color object back to a hex string representation
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alphaInt().toRadixString(16).padLeft(2, '0')}'
      '${redInt().toRadixString(16).padLeft(2, '0')}'
      '${greenInt().toRadixString(16).padLeft(2, '0')}'
      '${blueInt().toRadixString(16).padLeft(2, '0')}';

  /// Method to get the complementary color of the current Color object
  Color get complementary {
    String newRed = (redInt() - 255).abs().toRadixString(16).padRight(2, '0');
    String newGreen = (greenInt() - 255).abs().toRadixString(16).padRight(2, '0');
    String newBlue = (blueInt() - 255).abs().toRadixString(16).padRight(2, '0');

    return Color(int.parse('0xFF$newRed$newGreen$newBlue'));
  }

  static Color randomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
