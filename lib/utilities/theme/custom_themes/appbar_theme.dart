import 'package:flutter/material.dart';

import '../../../core/constants/sizes.dart';

class TAppBarTheme {
  TAppBarTheme._();

  /// LIGHT
  static AppBarTheme lightAppBarTheme = const AppBarTheme(
    elevation: TSizes.zero,
    centerTitle: false,
    scrolledUnderElevation: TSizes.zero,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Colors.black, size: TSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  /// DARK
  static AppBarTheme darkAppBarTheme = const AppBarTheme(
    elevation: TSizes.zero,
    centerTitle: false,
    scrolledUnderElevation: TSizes.zero,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: TSizes.iconMd),
    actionsIconTheme: IconThemeData(color: Colors.white, size: TSizes.iconMd),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
}
