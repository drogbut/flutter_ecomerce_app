import 'package:flutter/material.dart';

import '../../../../commons/style/spacing_style.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/texts/title.dart';

class SuccessScreen extends StatelessWidget {
  final String image, title, subTitle;
  final VoidCallback? onPressed;

  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight * 2,
          child: Column(
            children: [
              /// Image
              Image(
                image: AssetImage(image),
                width: context.screenWidth * 0.6,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// title and sub-title
              TTitleText(title, textAlign: TextAlign.center).withPadding(TSizes.spaceBtwItems.bottomPadding),
              Text(subTitle, textAlign: TextAlign.center).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Button
              TPrimaryButton(title: context.translate.btnContinue, onPressed: onPressed)
                  .withPadding(TSizes.spaceBtwInputFields.topPadding),
            ],
          ),
        ),
      ),
    );
  }
}
