import 'package:flutter/material.dart';

import '../../../../../core/extensions/context.dart';
import '../../../../../widgets/icons/circular.dart';

class OnboardingIndicatorButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData? iconData;

  const OnboardingIndicatorButton({
    super.key,
    required this.onPressed,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TCircularIcon(
      iconData: iconData,
      iconColor: context.whiteOrPrimary,
      backgroundColor: context.primaryOrDark,
      onPressed: onPressed,
    );
  }
}
