import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';

class OnboardingImage extends StatelessWidget {
  final String image, title, subTitle;

  const OnboardingImage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(
            width: context.screenWidth * 0.8,
            height: context.screenWidth * 0.6,
            image: AssetImage(image),
          ),
          Text(title, style: context.textTheme.headlineMedium, textAlign: TextAlign.center),
          TSizes.defaultSpace.sbs,
          Text(subTitle, textAlign: TextAlign.center),
        ],
      ).withPadding(TSizes.defaultSpace.horizontalPadding),
    );
  }
}
