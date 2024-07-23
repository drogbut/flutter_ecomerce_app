import 'package:flutter/material.dart';

class GenderSelectedProvider {
  final ValueNotifier<int> _genderIndexNotifier = ValueNotifier(1);

  ValueNotifier<int> get genderIndexNotifier => _genderIndexNotifier;

  int get genderIndex => _genderIndexNotifier.value;

  void setGenderIndex(int value) => _genderIndexNotifier.value = value;
}
