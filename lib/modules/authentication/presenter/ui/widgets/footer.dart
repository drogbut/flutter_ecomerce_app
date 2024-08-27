import 'package:flutter/material.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/icons/circle_image_icon.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// google
        const TCircularImageIcon(imagePath: TImages.google).withPadding(DSizes.spaceBtwItems.rightPadding),

        /// facebook
        const TCircularImageIcon(imagePath: TImages.facebook),
      ],
    );
  }
}
