import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/icons/circular.dart';
import '../../providers/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingNextButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TSizes.bottomNavigationHeight,
      right: TSizes.zero,
      child: TCircularIcon(
        iconData: Iconsax.arrow_right_3,
        iconColor: context.isDarkMode ? DColors.primary : Colors.white,
        backgroundColor: context.isDarkMode ? DColors.primary : DColors.dark,
        onPressed: () => controller.nextPage(),
      ).withPadding(TSizes.defaultSpace.rightPadding),
    );
  }
}
