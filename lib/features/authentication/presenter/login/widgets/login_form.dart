import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../cubit/login_cubit.dart';

class LoginForm extends StatelessWidget {
  final LoginCubit loginCubit;
  const LoginForm({super.key, required this.loginCubit});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginCubit.loginFormKey,
      child: Column(
        children: [
          /// E-mail
          TPrimaryTextField(
            controller: loginCubit.emailController,
            validator: (value) => TValidator.validateEmail(context, value),
            prefixIcon: Iconsax.direct_right,
            label: context.translate.enterEmail,
          ),

          /// Password
          TPrimaryTextField(
            controller: loginCubit.passwordController,
            validator: (value) => TValidator.emptyText(context, 'Password', value),
            isObscureText: context.watch<LoginCubit>().state.hidePassword,
            prefixIcon: Iconsax.password_check,
            label: context.translate.enterPassword,
            suffixIcon: IconButton(
              onPressed: loginCubit.toggleHidePassword,
              icon: Icon(context.watch<LoginCubit>().state.hidePassword ? Iconsax.eye_slash : Iconsax.eye),
            ),
          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

          /// Remember me & forgot password
          Row(
            children: [
              /// Remember Me
              TCheckBoxListTile(
                title: context.translate.rememberMe,
                value: context.watch<LoginCubit>().state.rememberMe,
                onChanged: (_) => loginCubit.toggleRememberMe(!context.watch<LoginCubit>().state.rememberMe),
              ),

              /// Forgot password
              TTertiaryButton(
                title: '${context.translate.forgotPassword} ?',
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
                ),
              ),
            ],
          ).withPadding(TSizes.spaceBtwItems.bottomPadding),

          /// SignIn button
          TPrimaryButton(
            title: context.translate.signIn,
            onPressed: () {},
          ).withPadding(TSizes.spaceBtwItems.bottomPadding),

          /// Register button
          TSecondaryButton(
            title: context.translate.doYouHaveAnAccount,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const RegisterScreen()),
            ),
          ),
        ],
      ),
    );
  }
}
