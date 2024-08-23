import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  static OnboardingController get instance => Get.find();

  /// variables
  PageController pageController = PageController();

  /// update current index when page change
  void updatePageIndicator(int index) {}

  /// Jump to the specific do selected page
  void dotNavigationClick() {}

  /// update current index and jump to the next page
  void nextPage() {}

  /// update current index and jump to the last page
  void skipPage() {}
}
