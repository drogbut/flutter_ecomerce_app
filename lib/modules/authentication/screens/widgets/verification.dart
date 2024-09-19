import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/style/spacing_style.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/buttons/tertiary.dart';
import '../../../../widgets/icons/circular.dart';
import '../../../../widgets/texts/title.dart';
import '../login/login.dart';

class VerificationScreen extends StatelessWidget {
  final String image, title, subtitle, email, continueButtonTitle;
  final VoidCallback? onContinuePressed, onResetPressed;

  const VerificationScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.email,
    required this.continueButtonTitle,
    this.onContinuePressed,
    this.onResetPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          TCircularIcon(onPressed: () => Get.offAll(() => const LoginScreen()), iconData: CupertinoIcons.clear)
        ],
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
                email,
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
                style: Theme.of(context).textTheme.labelSmall,
                onPressed: () {},
              ).withPadding(TSizes.spaceBtwInputFields.topPadding),
            ],
          ),
        ),
      ),
    );
  }
}
