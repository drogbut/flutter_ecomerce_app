import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../utilities/validators/validator.dart';
import '../../../../../../widgets/buttons/primary.dart';
import '../../../../../../widgets/fields/primary.dart';
import '../../../../../../widgets/texts/rich_text.dart';
import '../cubit/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();

        return Form(
          key: cubit.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// First & Last Name
                Row(
                  children: [
                    Expanded(
                      child: TPrimaryTextField(
                        controller: cubit.firstName,
                        validator: (value) => TValidator.emptyText(context, context.translate.firstname, value),
                        prefixIcon: Iconsax.user,
                        label: context.translate.firstname,
                      ),
                    ),
                    TSizes.spaceBtwInputFields.sbs,
                    Expanded(
                      child: TPrimaryTextField(
                        controller: cubit.lastName,
                        validator: (value) => TValidator.emptyText(context, context.translate.lastname, value),
                        prefixIcon: Iconsax.user,
                        label: context.translate.lastname,
                      ),
                    ),
                  ],
                ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                /// Username
                TPrimaryTextField(
                  controller: cubit.userName,
                  validator: (value) => TValidator.emptyText(context, context.translate.username, value),
                  prefixIcon: Iconsax.user_add,
                  label: context.translate.username,
                ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                /// Email
                TPrimaryTextField(
                  controller: cubit.email,
                  validator: (value) => TValidator.validateEmail(context, value),
                  prefixIcon: Iconsax.direct,
                  label: context.translate.enterEmail,
                ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                /// Phone
                TPrimaryTextField(
                  controller: cubit.phone,
                  validator: (value) => TValidator.validatePhoneNumber(context, value),
                  prefixIcon: Iconsax.call,
                  label: context.translate.phoneNumber,
                ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                /// Password
                TPrimaryTextField(
                  controller: cubit.password,
                  validator: (value) => TValidator.validatePassword(context, value),
                  isObscureText: cubit.hidePassword,
                  prefixIcon: Iconsax.password_check,
                  label: context.translate.enterPassword,
                  suffixIcon: IconButton(
                    onPressed: cubit.togglePasswordVisibility,
                    icon: Icon(cubit.hidePassword ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                /// Privacy policy
                Wrap(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: cubit.privacyPolicy,
                        onChanged: (_) => cubit.togglePrivacyPolicy(),
                      ),
                    ).withPadding(TSizes.sm.rightPadding),
                    MyRichText(
                      firstText: context.translate.iAgreeTo,
                      secondText: context.translate.privatePolice,
                    ),
                    MyRichText(
                      firstText: ' ${context.translate.abvAnd}',
                      secondText: context.translate.termsOfUse,
                    ),
                  ],
                ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                /// Create Account Button
                TPrimaryButton(
                  title: context.translate.createAccount,
                  onPressed: cubit.signup,
                ).withPadding(TSizes.spaceBtwInputFields.topPadding),

                /// Loader
                if (state is RegisterLoading) const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        );
      },
    );
  }
}
