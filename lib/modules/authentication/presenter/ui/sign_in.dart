import 'package:flutter/material.dart';

import '../../../../commons/style/spacing_style.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/widget.dart';
import 'widgets/divider.dart';
import 'widgets/footer.dart';
import 'widgets/form.dart';
import 'widgets/header.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              const LoginDivider().withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// Footer
              const LoginFooter().withPadding(TSizes.spaceBtwSections.bottomPadding),
            ],
          ),
        ),
      ),
    );
  }
}
