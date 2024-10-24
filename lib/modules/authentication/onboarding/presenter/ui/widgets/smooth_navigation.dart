import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../controllers/onboarding_controller.dart';

class OnboardingSmoothNavigation extends StatelessWidget {
  final OnboardingController controller;
  const OnboardingSmoothNavigation({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TSizes.appBarHeight + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        effect: ExpandingDotsEffect(activeDotColor: context.isDarkMode ? TColors.light : TColors.dark, dotHeight: 6),
        onDotClicked: controller.dotNavigationClick,
      ),
    );
  }
}
