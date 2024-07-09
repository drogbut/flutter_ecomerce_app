import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LocaleProvider {
  ///----------------- constructor .............................................
  final ValueNotifier<Locale?> _localeNotifier = ValueNotifier(null);

  ///----------------- value notifier ..........................................
  ValueNotifier<Locale?> get localeNotifier => _localeNotifier;

  ///----------------- value getters ..........................................
  Locale? get locale => _localeNotifier.value;

  ///----------------- value setters ...........................................
  void setLocale(Locale? value) {
    setLocale(value);

    if (locale != null) {
      Intl.defaultLocale = locale!.languageCode;
      Intl.systemLocale = locale!.languageCode;
    } else {
      Intl.defaultLocale =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      Intl.systemLocale =
          WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    }
    //if (!L10n.all.contains(value)) return;
  }

  void clearLocale() {
    setLocale(null);
  }
}
