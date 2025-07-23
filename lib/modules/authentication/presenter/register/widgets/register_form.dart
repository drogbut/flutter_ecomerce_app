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
import '../controllers/register_controller.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());

    return Form(
      key: controller.registerFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// First & Last
            Row(
              children: [
                /// First
                Expanded(
                  child: TPrimaryTextField(
                    key: Key('firstName'),
                    controller: controller.firstName,
                    validator: (value) => TValidator.emptyText(
                        context, context.translate.firstname, value),
                    prefixIcon: Iconsax.user,
                    label: context.translate.firstname,
                  ),
                ),

                /// Space
                TSizes.spaceBtwInputFields.sbs,

                /// Last
                Expanded(
                  child: TPrimaryTextField(
                    key: Key('lastName'),
                    controller: controller.lastName,
                    validator: (value) => TValidator.emptyText(
                        context, context.translate.lastname, value),
                    prefixIcon: Iconsax.user,
                    label: context.translate.lastname,
                  ),
                ),
              ],
            ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

            /// Username
            TPrimaryTextField(
              key: Key('userName'),
              controller: controller.userName,
              validator: (value) => TValidator.emptyText(
                  context, context.translate.username, value),
              prefixIcon: Iconsax.user_add,
              label: context.translate.username,
            ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

            /// E-mail
            TPrimaryTextField(
              key: Key('email'),
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(context, value),
              prefixIcon: Iconsax.direct,
              label: context.translate.enterEmail,
            ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

            /// Phone number
            TPrimaryTextField(
              key: Key('phone'),
              controller: controller.phone,
              validator: (value) =>
                  TValidator.validatePhoneNumber(context, value),
              prefixIcon: Iconsax.call,
              label: context.translate.phoneNumber,
            ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

            /// Password
            Obx(
              () => TPrimaryTextField(
                key: Key('password'),
                controller: controller.password,
                validator: (value) =>
                    TValidator.validatePassword(context, value),
                isObscureText: controller.hidePassword.value,
                prefixIcon: Iconsax.password_check,
                label: context.translate.enterPassword,
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: Icon(controller.hidePassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
              ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),
            ),

            /// privacy policy & terms of use
            Wrap(
              children: [
                SizedBox(
                  width: 24,
                  height: 24,
                  child: Obx(
                    () => Checkbox(
                      key: Key('privacyPolicy'),
                      value: controller.privacyPolicy.value,
                      onChanged: (value) => controller.privacyPolicy.value =
                          !controller.privacyPolicy.value,
                    ),
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

            /// Create account button
            TPrimaryButton(
              key: Key('createAccountButton'),
              title: context.translate.createAccount,
              onPressed: () => controller.signup(),
            ).withPadding(TSizes.spaceBtwInputFields.topPadding),
          ],
        ),
      ),
    );
  }
}
