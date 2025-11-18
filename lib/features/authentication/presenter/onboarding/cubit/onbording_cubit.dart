import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/constants/sizes.dart';
import '../service/onboarding_prefs.dart';
import 'onbording_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  /// Controller for the onboarding pages
  final PageController pageController = PageController();

  /// Total number of onboarding pages
  final int pageCount = 3;

  /// CONSTRUCTORS
  OnboardingCubit() : super(const OnboardingState(currentPage: 0));

  /// GETTERS
  int get lastPageIndex => pageCount - 1;

  /// Updates the current page indicator
  void updatePageIndicator(int index) {
    emit(state.copyWith(currentPage: index));
  }

  /// Go to a specific page
  Future<void> goToPage(int index) async {
    final clamped = index.clamp(0, lastPageIndex);
    await pageController.animateToPage(
      clamped,
      duration: const Duration(milliseconds: TSizes.defaultDuration),
      curve: Curves.easeOut,
    );
  }

  /// Go to the next page.
  Future<void> nextPage() async {
    if (state.currentPage == lastPageIndex) {
      await _completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: TSizes.defaultDuration),
        curve: Curves.ease,
      );
    }
  }

  /// Go to the previous page.
  Future<void> previousPage() async {
    if (state.currentPage == 0) {
      return;
    } else {
      pageController.previousPage(
        duration: const Duration(milliseconds: TSizes.defaultDuration),
        curve: Curves.ease,
      );
    }
  }

  /// Jump to the last page.
  void onBoardingSkipped() async {
    await _completeOnboarding();
  }

  /// Marks onboarding as complete and updates state
  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(OnboardingPrefsKeys.isFirstTime, false);
    emit(state.copyWith(completed: true));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
