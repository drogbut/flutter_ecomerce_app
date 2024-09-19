import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../../core/extensions/widget.dart';
import '../buttons/secondary.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  final String text, animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPrssed;

  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPrssed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation, width: context.screenWidth * 0.8),
          TSizes.defaultSpace.sbs,
          Text(
            text,
            style: context.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          TSizes.defaultSpace.sbs,
          if (showAction)
            SizedBox(
              width: 250,
              child: TSecondaryButton(
                title: actionText!,
                onPressed: onActionPrssed,
              ),
            ),
        ],
      ),
    );
  }
}
