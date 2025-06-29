import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class TValidator {
  /// Empty text validator
  static String? emptyText(BuildContext context, String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emailRequired;
    }

    return null;
  }

  /// Email validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(Get.context!)!.emailRequired;
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return AppLocalizations.of(Get.context!)!.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(Get.context!)!.passwordRequired;
    }

    // Check for minimum password length
    if (value.length < 6) {
      return AppLocalizations.of(Get.context!)!.passwordTooShort;
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppLocalizations.of(Get.context!)!.passwordNeedsUppercase;
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppLocalizations.of(Get.context!)!.passwordNeedsNumber;
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppLocalizations.of(Get.context!)!.passwordNeedsSpecial;
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(Get.context!)!.phoneRequired;
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return AppLocalizations.of(Get.context!)!.invalidPhone;
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
