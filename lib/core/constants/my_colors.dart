import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  /// Light
  static const Color lightPrimary = Color(0xff8E6CEF);
  static const Color lightOnPrimary = Color(0xFFFFFFFF);
  static const Color lightPrimaryContainer = Color(0xFFE8DDFF);
  static const Color lightOnPrimaryContainer = Color(0xFFFFFFFF);
  static const Color lightSecondary = Color(0xFF006A60);
  static const Color lightOnSecondary = Color(0xFFFFFFFF);
  static const Color lightSecondaryContainer = Color(0xFF4FFBE6);
  static const Color lightOnSecondaryContainer = Color(0xFF05203c);
  static const Color lightTertiary = Color(0xFF006874);
  static const Color lightOnTertiary = Color(0xFFFFFFFF);
  static const Color lightTertiaryContainer = Color(0xFF97F0FF);
  static const Color lightOnTertiaryContainer = Color(0xFF001F24);
  static const Color lightError = Color(0xFFBA1A1A);
  static const Color lightErrorContainer = Color(0xFFFFDAD6);
  static const Color lightOnError = Color(0xFFFFFFFF);
  static const Color lightOnErrorContainer = Color(0xFF410002);
  static const Color lightBackground = Color(0xff1D182A);
  static const Color lightOnBackground = Color(0xFF05203c);
  static const Color lightOutline = Color(0xFF7A757F);
  static const Color lightOnInverseSurface = Color(0xFFEFF1F1);
  static const Color lightInverseSurface = Color(0xFF2E3132);
  static const Color lightInversePrimary = Color(0xFFCFBDFF);
  static const Color lightShadow = Color(0xFF05203c);
  static const Color lightSurfaceTint = Color(0xFF6D23F9);
  static const Color lightOutlineVariant = Color(0xFFCAC4CF);
  static const Color lightScrim = Color(0xFF05203c);
  static const Color lightSurface = Color(0xFFF8FAFA);
  static const Color lightOnSurface = Color(0xFF05203c);
  static const Color lightSurfaceVariant = Color(0xFFE7E0EC);
  static const Color lightOnSurfaceVariant = Color(0xFF49454E);

  /// Dark
  static const Color darkPrimary = Color(0xff8E6CEF);
  static const Color darkOnPrimary = Color(0xFFFFFFFF);
  static const Color darkPrimaryContainer = Color(0xFFE8DDFF);
  static const Color darkOnPrimaryContainer = Color(0xFFFFFFFF);
  static const Color darkSecondary = Color(0xFF006A60);
  static const Color darkOnSecondary = Color(0xFFFFFFFF);
  static const Color darkSecondaryContainer = Color(0xFF4FFBE6);
  static const Color darkOnSecondaryContainer = Color(0xFF05203c);
  static const Color darkTertiary = Color(0xFF006874);
  static const Color darkOnTertiary = Color(0xFFFFFFFF);
  static const Color darkTertiaryContainer = Color(0xFF97F0FF);
  static const Color darkOnTertiaryContainer = Color(0xFF001F24);
  static const Color darkError = Color(0xFFBA1A1A);
  static const Color darkErrorContainer = Color(0xFFFFDAD6);
  static const Color darkOnError = Color(0xFFFFFFFF);
  static const Color darkOnErrorContainer = Color(0xFF410002);
  static const Color darkBackground = Color(0xff1D182A);
  static const Color darkOnBackground = Color(0xFF05203c);
  static const Color darkOutline = Color(0xFFE8DDFF);
  static const Color darkOnInverseSurface = Color(0xFFEFF1F1);
  static const Color darkInverseSurface = Color(0xFF2E3132);
  static const Color darkInversePrimary = Color(0xFFCFBDFF);
  static const Color darkShadow = Color(0xFF05203c);
  static const Color darkSurfaceTint = Color(0xFF6D23F9);
  static const Color darkOutlineVariant = Color(0xFFCAC4CF);
  static const Color darkScrim = Color(0xFF05203c);
  static const Color darkSurface = Color(0xFFF8FAFA);
  static const Color darkOnSurface = Color(0xFFFFFFFF);
  static const Color darkSurfaceVariant = Color(0xFFE7E0EC);
  static const Color darkOnSurfaceVariant = Color(0xFF49454E);

  /// Dark high contrast

  /// The PrimarySwatch was still set to a color generated by Flutter.
  /// Since you don't have to pass a color but a material color, you need this method.
  /// You could also do this manually for all shades. I found this solution better,
  /// because we can continue to create MaterialColors with it.
  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
