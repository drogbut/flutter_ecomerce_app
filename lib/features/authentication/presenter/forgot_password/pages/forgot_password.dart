import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../utilities/validators/validator.dart';
import '../../../../../../widgets/buttons/primary.dart';
import '../../../../../../widgets/fields/primary.dart';
import '../../../../../../widgets/texts/title.dart';
import '../cubit/forgot_password_cubit.dart';
import '../cubit/forgot_password_state.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(context.read()),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();

          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: TSizes.defaultSpace.allPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// title and sub-title
                  TTitleText(
                    context.translate.forgotPasswordTitle,
                  ).withPadding(TSizes.spaceBtwItems.bottomPadding),
                  Text(
                    context.translate.forgotPasswordSubtitle,
                  ).withPadding(TSizes.spaceBtwSections.bottomPadding),

                  /// E-mail
                  Form(
                    key: cubit.formKey,
                    child: TPrimaryTextField(
                      controller: cubit.emailController,
                      validator: (value) => TValidator.validateEmail(context, value),
                      prefixIcon: Iconsax.direct_right,
                      label: context.translate.enterEmail,
                    ),
                  ),

                  /// Submit button
                  TPrimaryButton(
                    title: context.translate.submit,
                    onPressed: () => cubit.sendPasswordResetEmail(context),
                  ).withPadding(TSizes.spaceBtwInputFields.topPadding),

                  if (state is ForgetPasswordLoading) const Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
