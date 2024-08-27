import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/buttons/secondary.dart';
import '../../../../../widgets/buttons/tertiary.dart';
import '../../../../../widgets/checkbox_and_radio/checkbox.dart';
import '../../../../../widgets/fields/primary.dart';

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
              onPressed: () {},
            ),
          ],
        ).withPadding(DSizes.spaceBtwItems.bottomPadding),

        /// SignIn button
        TPrimaryButton(
          title: context.translate.signIn,
          onPressed: () {},
        ).withPadding(DSizes.spaceBtwItems.bottomPadding),

        ///  Register button
        TSecondaryButton(
          title: context.translate.doYouHaveAnAccount,
          onPressed: () {},
        ),
      ],
    );
  }
}
