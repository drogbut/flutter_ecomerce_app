import 'package:flutter/material.dart';

// coverage:ignore-file

class UtilityNavigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final UtilityNavigation _instance = UtilityNavigation._internal();
  factory UtilityNavigation() => _instance;

  UtilityNavigation._internal();

  void navigateToPopUntil(String routeName) {
    navigatorKey.currentState!.popUntil(ModalRoute.withName(routeName));
  }
}
