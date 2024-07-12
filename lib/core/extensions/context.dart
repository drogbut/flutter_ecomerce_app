import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../responsive/domain/breakpoints.dart';
import '../../responsive/domain/device.dart';

/// An extension on the BuildContext class providing easy access to various
/// commonly used properties and methods.
///
/// Example
/// ```dart
/// String title = context.translate.appTitle;
///
/// context.navigator.pushNamed('/newRoute');
///
/// Color primaryColor = context.theme.primaryColor;
/// ```
extension ContextExt on BuildContext {
  /// Provides access to the localized strings for the current context.
  AppLocalizations get translate => AppLocalizations.of(this)!;

  /// Provides access to the navigator state for the current context.
  NavigatorState get navigator => Navigator.of(this);

  /// Provides access to the focus scope node for the current context.
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Provides access to the theme data for the current context.
  ThemeData get theme => Theme.of(this);

  /// Provides access to the color scheme of the current theme.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Provides access to the text theme of the current theme.
  TextTheme get textTheme => theme.textTheme;

  /// Provides access to the date picker theme data for the current context.
  DatePickerThemeData get datePickerTheme => DatePickerTheme.of(this);

  /// Provides access to the time picker theme data for the current context.
  TimePickerThemeData get timePickerTheme => TimePickerTheme.of(this);

  /// Provides access to the expansion tile theme data for the current context.
  ExpansionTileThemeData get expansionTileTheme => ExpansionTileTheme.of(this);

  /// Provides access to the media query data for the current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Provides access to the size of the media query for the current context.
  Size get mediaQuerySize => mediaQuery.size;

  /// Provides access to the screen width from the media query size.
  double get screenWidth => mediaQuerySize.width;

  /// Provides access to the screen height from the media query size.
  double get screenHeight => mediaQuerySize.height;

  /// Indicates whether the current context is in high contrast mode.
  bool get isHighContrast => mediaQuery.highContrast;

  DeviceScreenType get deviceType {
    double deviceWidth = mediaQuerySize.shortestSide;

    if (deviceWidth > DeviceBreakpoints.largeDesktop) {
      return DeviceScreenType.largeDesktop;
    }

    if (deviceWidth > DeviceBreakpoints.desktop) {
      return DeviceScreenType.desktop;
    }

    if (deviceWidth > DeviceBreakpoints.tablet) {
      return DeviceScreenType.tablet;
    }

    if (deviceWidth <= DeviceBreakpoints.wearable) {
      return DeviceScreenType.wearable;
    }

    return DeviceScreenType.mobile;
  }

  bool get isWearable => deviceType == DeviceScreenType.wearable;
  bool get isPhone => deviceType == DeviceScreenType.mobile;
  bool get isTablet => deviceType == DeviceScreenType.tablet;
  bool get isDesktop => deviceType == DeviceScreenType.desktop;
  bool get is4k => deviceType == DeviceScreenType.largeDesktop;

  bool get isPhoneOrSmaller => isPhone || isWearable;
}
