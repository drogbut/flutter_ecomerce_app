import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../utilities/validators/validator.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/fields/primary.dart';
import '../../../../../widgets/texts/rich_text.dart';
import '../../../controllers/register_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Form(
      key: controller.registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// First & Last
          Row(
            children: [
              /// First
              Expanded(
                child: TPrimaryTextField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.emptyText('First name', value),
                  prefixIcon: Iconsax.user,
                  label: context.translate.firstname,
                ),
              ),

              /// Space
              TSizes.spaceBtwInputFields.sbs,

              /// Last
              Expanded(
                child: TPrimaryTextField(
                  controller: controller.lasttName,
                  validator: (value) => TValidator.emptyText('Last name', value),
                  prefixIcon: Iconsax.user,
                  label: context.translate.lastname,
                ),
              ),
            ],
          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

          /// Username
          TPrimaryTextField(
            controller: controller.userName,
            validator: (value) => TValidator.emptyText('User name', value),
            prefixIcon: Iconsax.user_add,
            label: context.translate.username,
          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

          /// E-mail
          TPrimaryTextField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            prefixIcon: Iconsax.direct,
            label: context.translate.enterEmail,
          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

          /// Phone number
          TPrimaryTextField(
            controller: controller.phone,
            validator: (value) => TValidator.validatePhoneNumber(value),
            prefixIcon: Iconsax.call,
            label: context.translate.phoneNumber,
          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

          /// Password
          TPrimaryTextField(
            controller: controller.password,
            validator: (value) => TValidator.validatePassword(value),
            isObscureText: true,
            prefixIcon: Iconsax.password_check,
            label: context.translate.enterPassword,
            suffixIcon: const Icon(Iconsax.eye_slash),
          ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

          /// privacy policy & terms of use
          Row(
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(value: true, onChanged: (value) {}),
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

          /// Create account button
          TPrimaryButton(
            title: context.translate.createAccount,
            onPressed: () => controller.signup(),
          ).withPadding(TSizes.spaceBtwInputFields.topPadding),
        ],
      ),
    );
  }
}
