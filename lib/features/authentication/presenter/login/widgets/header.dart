import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            color: TColors.primary,
            colorBlendMode: context.isDarkMode ? BlendMode.darken : BlendMode.lighten,
            image: const AssetImage(
              TImages.lightLogo,
            )).withPadding(TSizes.md.bottomPadding),
        Text(context.translate.loginTitle, style: Theme.of(context).textTheme.headlineSmall)
            .withPadding(TSizes.sm.bottomPadding),
        Text(context.translate.loginSubTitle).withPadding(TSizes.sm.bottomPadding),
      ],
    );
  }
}
