import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExt on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this)!;

  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);

  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;

  DatePickerThemeData get datePickerTheme => DatePickerTheme.of(this);
  TimePickerThemeData get timePickerTheme => TimePickerTheme.of(this);
  ExpansionTileThemeData get expansionTileTheme => ExpansionTileTheme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);
  Size get mediaQuerySize => mediaQuery.size;
  double get screenWidth => mediaQuerySize.width;
  double get screenHeight => mediaQuerySize.height;
  bool get isHighContrast => mediaQuery.highContrast;
}
