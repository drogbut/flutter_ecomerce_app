import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../utilities/validators/validator.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/buttons/secondary.dart';
import '../../../../../widgets/buttons/tertiary.dart';
import '../../../../../widgets/checkbox_and_radio/checkbox.dart';
import '../../../../../widgets/fields/primary.dart';
import '../../forgot_password/pages/forgot_password.dart';
import '../../register/pages/register_screen.dart';
import '../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          /// E-mail
          TPrimaryTextField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            prefixIcon: Iconsax.direct_right,
            label: context.translate.enterEmail,
          ),

          /// Password
          Obx(
            () => TPrimaryTextField(
              controller: controller.password,
              validator: (value) => TValidator.emptyText('Password', value),
              isObscureText: controller.hidePassword.value,
              prefixIcon: Iconsax.password_check,
              label: context.translate.enterPassword,
              suffixIcon: IconButton(
                onPressed: () => controller.hidePassword.value =
                    !controller.hidePassword.value,
                icon: Icon(controller.hidePassword.value
                    ? Iconsax.eye_slash
                    : Iconsax.eye),
              ),
            ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),
          ),

          /// Remember me & forgot password
          Row(
            children: [
              /// Remember Me
              Obx(
                () => TCheckBoxListTile(
                  title: context.translate.rememberMe,
                  value: controller.rememberMe.value,
                  onChanged: (value) => controller.rememberMe.value =
                      !controller.rememberMe.value,
                ),
              ),

              /// Forgot password
              TTertiaryButton(
                title: '${context.translate.forgotPassword} ?',
                onPressed: () => Get.to(() => const ForgotPasswordScreen()),
              ),
            ],
          ).withPadding(TSizes.spaceBtwItems.bottomPadding),

          /// SignIn button
          TPrimaryButton(
            title: context.translate.signIn,
            onPressed: () => controller.signInWithEmailAndPassword(),
          ).withPadding(TSizes.spaceBtwItems.bottomPadding),

          ///  Register button
          TSecondaryButton(
            title: context.translate.doYouHaveAnAccount,
            onPressed: () => Get.to(() => const RegisterScreen()),
          ),
        ],
      ),
    );
  }
}
