import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/style/spacing_style.dart';
import '../../../../core/constants/images_string.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/buttons/tertiary.dart';
import '../../../../widgets/icons/circular.dart';
import '../../../../widgets/success_screens/success_screen.dart';
import '../../../../widgets/text/title.dart';
import 'sign_in.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [TCircularIcon(onPressed: () => Get.offAll(() => const SignInPage()), iconData: CupertinoIcons.clear)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            children: [
              /// Image
              Image(
                width: context.screenWidth * 0.6,
                image: const AssetImage(TImages.deliveryWoman),
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// title and sub-title
              TTitleText(
                context.translate.confirmEmail,
                textAlign: TextAlign.center,
              ).withPadding(TSizes.spaceBtwItems.bottomPadding),
              Text(
                textAlign: TextAlign.center,
                'support@dreamteam.com',
                style: Theme.of(context).textTheme.labelMedium,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),
              Text(
                textAlign: TextAlign.center,
                context.translate.confirmEmailSubTitle,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Continue button
              TPrimaryButton(
                title: context.translate.btnContinue,
                onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.staticSuccessIllustration,
                    title: context.translate.yourAccountCreatedTitle,
                    subTitle: context.translate.yourAccountCreatedSubTitle,
                    onPressed: () => Get.to(() => const SignInPage()),
                  ),
                ),
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
