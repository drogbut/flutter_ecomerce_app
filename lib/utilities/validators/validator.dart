import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../l10n/app_localizations.dart';

class TValidator {
  /// Empty text validator
  static String? emptyText(
      BuildContext context, String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.fieldRequired(fieldName!);
    }

    return null;
  }

  static String? validateEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.emailRequired;
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.invalidEmail;
    }

    return null;
  }

  static String? validatePassword(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.passwordRequired;
    }

    // Check for minimum password length
    if (value.length < 6) {
      return AppLocalizations.of(context)!.passwordTooShort;
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return AppLocalizations.of(context)!.passwordNeedsUppercase;
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return AppLocalizations.of(context)!.passwordNeedsNumber;
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return AppLocalizations.of(context)!.passwordNeedsSpecial;
    }

    return null;
  }

  static String? validatePhoneNumber(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(context)!.phoneRequired;
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return AppLocalizations.of(context)!.invalidPhone;
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}
