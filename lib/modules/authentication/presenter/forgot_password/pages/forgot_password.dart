import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../utilities/validators/validator.dart';
import '../../../../../../widgets/buttons/primary.dart';
import '../../../../../../widgets/fields/primary.dart';
import '../../../../../../widgets/texts/title.dart';
import '../controllers/forget_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());

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
            Form(
              key: controller.forgetPasswordFormKey,
              child: TPrimaryTextField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(context, value),
                prefixIcon: Iconsax.direct_right,
                label: context.translate.enterEmail,
              ),
            ),

            /// Submit button
            TPrimaryButton(
              title: context.translate.submit,
              onPressed: () => controller.sendPasswordResetEmail(),
            ).withPadding(TSizes.spaceBtwInputFields.topPadding),
          ],
        ),
      ),
    );
  }
}
