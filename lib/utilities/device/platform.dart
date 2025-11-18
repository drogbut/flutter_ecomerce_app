import 'package:flutter/foundation.dart';

/// An utility class for platform-specific operations.
class UtilityPlatform {
  /// Returns true if the current platform is web.
  static bool get isWeb => kIsWeb;

  /// Returns true if the current platform is Android.
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;

  /// Returns true if the current platform is not web but is android.
  static bool get isNotWebAndIsAndroid => !kIsWeb && isAndroid;

  /// Returns true if the current platform is iOS.
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;

  /// Returns true if the current platform is not web but is iOS.
  static bool get isNotWebAndIsIOS => !kIsWeb && isIOS;

  /// Returns true if the current platform is Windows.
  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;

  /// Returns true if the current platform is web or is windows.
  static bool get isWebOrIsWindows => kIsWeb || isWindows;

  /// Returns true if the current platform is not Web but is Windows.
  static bool get isNotWebAndIsWindows => !kIsWeb && isWindows;

  /// Returns true if the current platform is not Web and is not Windows.
  static bool get isNotWebAndIsNotWindows => !kIsWeb && !isWindows;

  /// Returns true if the current platform is not Web or is Windows.
  static bool get isNotWebOrIsNotWindows => !kIsWeb || !isWindows;

  /// Returns true if the current platform is not Windows.
  static bool get isQrCodeScannerVisible => !isWindows;

  /// Returns the name of the current platform.
  static String get targetPlatformName => !kIsWeb ? defaultTargetPlatform.name : 'Web ${defaultTargetPlatform.name}';
}
