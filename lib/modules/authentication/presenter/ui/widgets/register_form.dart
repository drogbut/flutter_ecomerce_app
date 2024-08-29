import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/fields/primary.dart';
import '../../../../../widgets/success_screens/success.dart';
import '../../../../../widgets/text/rich_text.dart';
import '../sign_in.dart';
import '../verification.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// First & Last
        Row(
          children: [
            /// First
            Expanded(
              child: TPrimaryTextField(
                prefixIcon: Iconsax.user,
                label: context.translate.firstname,
              ),
            ),

            /// Space
            TSizes.spaceBtwInputFields.sbs,

            /// Last
            Expanded(
              child: TPrimaryTextField(
                prefixIcon: Iconsax.user,
                label: context.translate.lastname,
              ),
            ),
          ],
        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

        /// Username
        TPrimaryTextField(
          prefixIcon: Iconsax.user_add,
          label: context.translate.username,
        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

        /// E-mail
        TPrimaryTextField(
          prefixIcon: Iconsax.direct,
          label: context.translate.enterEmail,
        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

        /// Phone number
        TPrimaryTextField(
          prefixIcon: Iconsax.call,
          label: context.translate.phoneNumber,
        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

        /// Password
        TPrimaryTextField(
          isObscureText: true,
          prefixIcon: Iconsax.password_check,
          label: context.translate.enterPassword,
          suffixIcon: const Icon(Iconsax.eye_slash),
        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

        /// privacy policy & terms of use
        Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(value: true, onChanged: (value) {}),
            ).withPadding(TSizes.sm.rightPadding),
            MyRichText(
              firstText: context.translate.iAgreeTo,
              secondText: context.translate.privatePolice,
            ),
            MyRichText(
              firstText: ' ${context.translate.abvAnd}',
              secondText: context.translate.termsOfUse,
            ),
          ],
        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

        /// Create account button
        TPrimaryButton(
          title: context.translate.createAccount,
          onPressed: () => Get.to(
            () => VerificationScreen(
              image: TImages.deliveryEmail1,
              title: context.translate.confirmEmail,
              subtitle: context.translate.confirmEmailSubTitle,
              email: 'support@dreamteam.com',
              continueButtonTitle: context.translate.btnContinue,
              onContinuePressed: () => Get.to(
                () => SuccessScreen(
                  image: TImages.successIllustration,
                  title: context.translate.yourAccountCreatedTitle,
                  subTitle: context.translate.yourAccountCreatedSubTitle,
                  onPressed: () => Get.offAll(() => const SignInPage()),
                ),
              ),
            ),
          ),
        ).withPadding(TSizes.spaceBtwInputFields.topPadding),
      ],
    );
  }
}
