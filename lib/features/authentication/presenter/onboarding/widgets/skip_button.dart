import 'package:flutter/material.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';

class OnboardingSkip extends StatelessWidget {
  final VoidCallback onPressed;
  const OnboardingSkip({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TSizes.appBarHeight,
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: onPressed,
        child: Text(context.translate.btnSkip),
      ),
    );
  }
}
