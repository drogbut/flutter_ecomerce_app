import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../providers/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingNextButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: DSizes.bottomNavigationHeight,
      right: DSizes.zero,
      child: SizedBox(
        width: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: context.isDarkMode ? DColors.primary : DColors.dark,
          ),
          child: const Icon(Iconsax.arrow_right_3),
          onPressed: () => controller.nextPage(),
        ),
      ),
    );
  }
}
