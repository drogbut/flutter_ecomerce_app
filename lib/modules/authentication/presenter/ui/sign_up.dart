import 'package:flutter/material.dart';

import '../../../../core/constants/images_string.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/dividers/form_divider.dart';
import '../../../../widgets/icons/image_circular.dart';
import '../../../../widgets/texts/title.dart';
import 'widgets/register_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title
              TTitleText(context.translate.createAccount).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Signup Form
              const RegisterForm().withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Divider
              TFormDivider(
                label: context.translate.orSignUpWith,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// google
                  TImageCircularIcon(
                    imagePath: TImages.google,
                    onPressed: () {},
                  ).withPadding(TSizes.spaceBtwItems.rightPadding),

                  /// facebook
                  TImageCircularIcon(
                    imagePath: TImages.facebook,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
