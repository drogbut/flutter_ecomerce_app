import 'package:flutter/material.dart';

class DNavigationBarTheme {
  DNavigationBarTheme._();

  /// LIGHT
  static NavigationBarThemeData light = NavigationBarThemeData(
    height: 80,
    elevation: 0,
    backgroundColor: Colors.white,
    indicatorColor: Colors.black.withOpacity(0.1),
    shadowColor: Colors.white,
    surfaceTintColor: Colors.white,
  );

  /// DARK
  static NavigationBarThemeData dark = NavigationBarThemeData(
    height: 80,
    elevation: 0,
    backgroundColor: Colors.black,
    indicatorColor: Colors.white.withOpacity(0.1),
  );
}
