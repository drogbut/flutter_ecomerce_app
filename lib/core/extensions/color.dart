import 'dart:math';

import 'package:flutter/material.dart';

/// Import the core Flutter material library for building UI components
///
/// '''
/// (1) // Creates a bright pink color
/// Color myColor = HexColor.fromHex('#FF00FF').withOpacity(0.9);
///
/// (2) // hexCode will be "#0000FF"
/// Color myColor = Colors.blue;
/// String hexCode = myColor.toHex();
///
/// (3) // complementaryColor will be "#FF0000" (red)
/// Color myColor = Colors.green;
/// Color complementaryColor = myColor.complementary;
extension ExtensionColor on Color {
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

  /// Method to convert a Color object back to a hex string representation
  String toHex({bool leadingHashSign = true}) {
    return '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
  }

  /// Method to get the complementary color of the current Color object
  Color get complementary {
    String newRed = (red - 255).abs().toRadixString(16).padRight(2, '0');
    String newGreen = (green - 255).abs().toRadixString(16).padRight(2, '0');
    String newBlue = (blue - 255).abs().toRadixString(16).padRight(2, '0');

    return Color(int.parse('0xFF$newRed$newGreen$newBlue'));
  }

  static Color randomColor(){
    final random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
  }
}
