import 'package:flutter/material.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../controllers/onboarding_controller.dart';

class OnboardingSkip extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingSkip({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TSizes.appBarHeight,
      right: TSizes.defaultSpace,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: AlignmentDirectional.centerEnd,
        ),
        onPressed: () => controller.skipPage(),
        child: Text(context.translate.btnSkip),
      ),
    );
  }
}
