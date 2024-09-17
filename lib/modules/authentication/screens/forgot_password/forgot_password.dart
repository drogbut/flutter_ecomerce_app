import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/images_string.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/fields/primary.dart';
import '../../../../widgets/success_screens/success.dart';
import '../../../../widgets/texts/title.dart';
import '../login/login.dart';
import '../widgets/verification.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: TSizes.defaultSpace.allPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// title and sub-title
            TTitleText(
              context.translate.forgotPasswordTitle,
            ).withPadding(TSizes.spaceBtwItems.bottomPadding),
            Text(
              context.translate.forgotPasswordSubtitle,
            ).withPadding(TSizes.spaceBtwSections.bottomPadding),

            /// E-mail
            TPrimaryTextField(
              prefixIcon: Iconsax.direct_right,
              label: context.translate.enterEmail,
            ),

            /// Submit button
            TPrimaryButton(
              title: context.translate.submit,
              onPressed: () => Get.offAll(
                () => VerificationScreen(
                  image: TImages.deliveredEmailIllustration,
                  title: context.translate.passwordResetEmailSend,
                  subtitle: context.translate.passwordResetEmailSendSubtitle,
                  email: 'your_e_mail@test.com',
                  continueButtonTitle: context.translate.done,
                  onContinuePressed: () => Get.to(
                    () => SuccessScreen(
                      image: TImages.staticSuccessIllustration,
                      title: context.translate.yourAccountCreatedTitle,
                      subTitle: context.translate.yourAccountCreatedSubTitle,
                      onPressed: () => Get.offAll(() => const LoginScreen()),
                    ),
                  ),
                ),
              ),
            ).withPadding(TSizes.spaceBtwInputFields.topPadding),
          ],
        ),
      ),
    );
  }
}
