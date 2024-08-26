import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../providers/onboarding_controller.dart';

class OnboardingSkip extends StatelessWidget {
  final OnboardingController controller;

  const OnboardingSkip({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: DSizes.appBarHeight,
      right: DSizes.defaultSpace,
      child: TextButton(
        onPressed: () => controller.skipPage(),
        child: Text(context.translate.btnSkip),
      ),
    );
  }
}
