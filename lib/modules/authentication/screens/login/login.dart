import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../commons/style/spacing_style.dart';
import '../../../../core/constants/images_string.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/dividers/form_divider.dart';
import '../../../../widgets/icons/image_circular.dart';
import '../../controllers/sign_in/login_controller.dart';
import 'widgets/header.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppbarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header - logo, title and sub-title
              const LoginHeader().withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Form
              const LoginForm().withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Divider
              TFormDivider(
                label: context.translate.orSignInWith,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// google
                  TImageCircularIcon(
                    imagePath: TImages.google,
                    onPressed: () => controller.googleSignIn(),
                  ).withPadding(TSizes.spaceBtwItems.rightPadding),

                  /// facebook
                  TImageCircularIcon(
                    imagePath: TImages.facebook,
                    onPressed: () {},
                  ),
                ],
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}
