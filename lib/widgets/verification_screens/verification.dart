import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../commons/style/spacing_style.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../../core/extensions/widget.dart';
import '../buttons/primary.dart';
import '../buttons/tertiary.dart';
import '../icons/circular.dart';
import '../texts/title.dart';

class TVerificationScreen extends StatelessWidget {
  final String image, title, subtitle, continueButtonTitle;
  final String? email;
  final VoidCallback? onClosePressed, onContinuePressed, onResetPressed;

  const TVerificationScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    this.email,
    required this.continueButtonTitle,
    this.onClosePressed,
    this.onContinuePressed,
    this.onResetPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [TCircularIcon(onPressed: onClosePressed, iconData: CupertinoIcons.clear)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              /// Image
              Image(
                width: context.screenWidth * 0.6,
                image: AssetImage(image),
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// title and sub-title
              TTitleText(
                title,
                textAlign: TextAlign.center,
              ).withPadding(TSizes.spaceBtwItems.bottomPadding),
              Text(
                textAlign: TextAlign.center,
                email ?? '',
                style: Theme.of(context).textTheme.labelMedium,
              ).withPadding(TSizes.spaceBtwItems.bottomPadding),
              Text(
                textAlign: TextAlign.center,
                subtitle,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Continue button
              TPrimaryButton(
                title: continueButtonTitle,
                onPressed: onContinuePressed,
              ).withPadding(TSizes.spaceBtwInputFields.topPadding),

              /// Resend email button
              TTertiaryButton(
                title: context.translate.resendEmail,
                onPressed: () {},
              ).withPadding(TSizes.spaceBtwInputFields.topPadding),
            ],
          ),
        ),
      ),
    );
  }
}
