import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LocaleCubit extends Cubit<Locale?> {
  LocaleCubit() : super(null);

  void setLocale(Locale? locale) {
    emit(locale);

    if (locale != null) {
      Intl.defaultLocale = locale.languageCode;
      Intl.systemLocale = locale.languageCode;
    } else {
      Intl.defaultLocale = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
      Intl.systemLocale = WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    }
  }

  void clearLocale() {
    setLocale(null);
  }
}
