import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/icons/circular.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingNextButton({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TSizes.appBarHeight,
      right: TSizes.zero,
      child: TCircularIcon(
        iconData: Iconsax.arrow_right_3,
        iconColor: context.whiteOrPrimary,
        backgroundColor: context.primaryOrDark,
        onPressed: () => controller.nextPage(),
      ).withPadding(TSizes.defaultSpace.rightPadding),
    );
  }
}
