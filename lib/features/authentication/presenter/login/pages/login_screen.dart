import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../commons/style/spacing_style.dart';
import '../../../../../../core/constants/images_string.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/dividers/form_divider.dart';
import '../../../../../../widgets/icons/image_circular.dart';
import '../cubit/login_cubit.dart';
import '../widgets/header.dart';
import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginCubit loginCubit = context.read<LoginCubit>();
    return BlocProvider.value(
      value: loginCubit,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: TSpacingStyle.paddingWithAppbarHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: TSizes.spaceBtwSections,
              children: [
                /// Header - logo, title and sub-title
                const LoginHeader(),

                /// Form
                LoginForm(loginCubit: loginCubit),

                /// Divider
                TFormDivider(
                  label: context.translate.orSignInWith,
                ),

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
      ),
    );
  }
}
