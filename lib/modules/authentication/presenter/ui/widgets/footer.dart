import 'package:flutter/material.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/icons/image_circular.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// google
        const TImageCircularIcon(imagePath: TImages.google).withPadding(TSizes.spaceBtwItems.rightPadding),

        /// facebook
        const TImageCircularIcon(imagePath: TImages.facebook),
      ],
    );
  }
}
