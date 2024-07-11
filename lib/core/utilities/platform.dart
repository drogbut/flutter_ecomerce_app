import 'package:flutter/foundation.dart';

class UtilityPlatform {
  static final UtilityPlatform _instance = UtilityPlatform._internal();
  factory UtilityPlatform() => _instance;

  UtilityPlatform._internal();

  bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  bool get isNotWebAndIsAndroid => !kIsWeb && isAndroid;

  bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  bool get isNotWebAndIsIOS => !kIsWeb && isIOS;

  bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  bool get isWebOrIsWindows => kIsWeb || isWindows;

  bool get isNotWebAndIsWindows => !kIsWeb && isWindows;

  bool get isNotWebAndIsNotWindows => !kIsWeb && !isWindows;

  bool get isNotWebOrIsNotWindows => !kIsWeb || !isWindows;

  bool get isQrCodeScannerVisible => !isWindows;

  String get targetPlatformName => !kIsWeb ? defaultTargetPlatform.name : 'Web ${defaultTargetPlatform.name}';
}
