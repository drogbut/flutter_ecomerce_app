import 'package:flutter/material.dart';

import '../../../../../locator.dart';
import '../../../domain/use_cases/get_ages.dart';
import 'display_age_state.dart';

class GenderAndAgeProvider {
  final ValueNotifier<int> _genderIndexNotifier = ValueNotifier(1);
  final ValueNotifier<String> _selectedAgeNotifier = ValueNotifier('Age Range');
  final ValueNotifier<DisplayAgeState> _displayAgeStateNotifier = ValueNotifier(AgesLoading());

  ValueNotifier<int> get genderIndexNotifier => _genderIndexNotifier;
  ValueNotifier<String> get selectedAgeNotifier => _selectedAgeNotifier;
  ValueNotifier<DisplayAgeState> get displayAgeStateNotifier => _displayAgeStateNotifier;

  int get genderIndex => _genderIndexNotifier.value;
  String get selectedAge => _selectedAgeNotifier.value;
  DisplayAgeState get displayAgeState => _displayAgeStateNotifier.value;

  void setGenderIndex(int value) => _genderIndexNotifier.value = value;
  void setSelectedAge(String value) => _selectedAgeNotifier.value = value;
  void setDisplayAgeState(DisplayAgeState value) => _displayAgeStateNotifier.value = value;

  void displayAges() async {
    setDisplayAgeState(AgesLoading());

    var agesResponse = await sl<GetAgesUseCase>().call();

    agesResponse.fold((message) {
      setDisplayAgeState(AgesLoadFailure(errorMessage: message));
    }, (data) {
      setDisplayAgeState(AgesLoaded(agesSnapshot: data));
    });
  }
}
