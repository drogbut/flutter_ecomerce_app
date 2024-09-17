import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/buttons/secondary.dart';
import '../../../../../widgets/buttons/tertiary.dart';
import '../../../../../widgets/checkbox_and_radio/checkbox.dart';
import '../../../../../widgets/fields/primary.dart';
import '../../../../shop/presenter/ui/bottom_navigation.dart';
import '../forgot_password.dart';
import '../register.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// E-mail
        TPrimaryTextField(
          prefixIcon: Iconsax.direct_right,
          label: context.translate.enterEmail,
        ),

        /// Password
        TPrimaryTextField(
          prefixIcon: Iconsax.password_check,
          label: context.translate.enterPassword,
          suffixIcon: const Icon(Iconsax.eye_slash),
        ),

        /// Remember me & forgot password
        Row(
          children: [
            /// Remember Me
            TCheckBoxListTile(
              title: context.translate.rememberMe,
              value: true,
              onChanged: (value) {},
            ),

            /// Forgot password
            TTertiaryButton(
              title: '${context.translate.forgotPassword} ?',
              onPressed: () => Get.to(() => const ForgotPasswordScreen()),
            ),
          ],
        ).withPadding(TSizes.spaceBtwItems.bottomPadding),

        /// SignIn button
        TPrimaryButton(title: context.translate.signIn, onPressed: () => Get.offAll(() => const BottomNavigationMenu()))
            .withPadding(TSizes.spaceBtwItems.bottomPadding),

        ///  Register button
        TSecondaryButton(
          title: context.translate.doYouHaveAnAccount,
          onPressed: () => Get.to(() => const SignupScreen()),
        ),
      ],
    );
  }
}
