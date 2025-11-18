import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../utilities/validators/validator.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/fields/primary.dart';
import '../../../../widgets/texts/title.dart';
import '../../../app_settings/presenter/cubit/user_cubit.dart';
import '../../../app_settings/presenter/cubit/user_state.dart';
class ReAuthenticateUserLogin extends StatelessWidget {
  const ReAuthenticateUserLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserCubit>();
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
              BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  return Form(
                    key: cubit.reAuthFormKey,
                    child: Column(
                      children: [
                        /// E-mail
                        TPrimaryTextField(
                          controller: cubit.verifyEmail,
                          validator: (value) =>
                              TValidator.validateEmail(context, value),
                          prefixIcon: Iconsax.direct_right,
                          label: context.translate.confirmEmail,
                        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                        /// Password
                        TPrimaryTextField(
                          controller: cubit.verifyPassword,
                          validator: (value) =>
                              TValidator.emptyText(context, 'Password', value),
                          isObscureText: state.hidePassword,
                          prefixIcon: Iconsax.password_check,
                          label: context.translate.enterPassword,
                          suffixIcon: IconButton(
                            onPressed: () => cubit.toggleHidePassword(),
                            icon: Icon(state.hidePassword
                                ? Iconsax.eye_slash
                                : Iconsax.eye),
                          ),
                        ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),
                      ],
                    ),
                  );
                },
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// -- Close Account
              TPrimaryButton(
                title: 'Save',
                onPressed: () =>
                    cubit.reAuthenticateEmailAndPasswordUser(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
