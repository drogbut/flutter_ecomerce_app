import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../utilities/validators/validator.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/fields/primary.dart';
import '../../../../../widgets/texts/title.dart';
import '../../../controllers/user_controller.dart';

class ReAuthenticateUserLogin extends StatelessWidget {
  const ReAuthenticateUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackIcon: true,
        title: TTitleText('Re-Authenticate user'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Form
              Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    /// E-mail
                    TPrimaryTextField(
                      controller: controller.verifyEmail,
                      validator: (value) => TValidator.validateEmail(value),
                      prefixIcon: Iconsax.direct_right,
                      label: context.translate.confirmEmail,
                    ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                    /// Password
                    Obx(
                      () => TPrimaryTextField(
                        controller: controller.verifyPassword,
                        validator: (value) => TValidator.emptyText('Password', value),
                        isObscureText: controller.hidePassword.value,
                        prefixIcon: Iconsax.password_check,
                        label: context.translate.enterPassword,
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                        ),
                      ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),
                    ),
                  ],
                ),
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// -- Close Account
              TPrimaryButton(
                title: 'Save',
                onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
