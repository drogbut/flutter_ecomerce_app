import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../utilities/validators/validator.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/fields/primary.dart';
import '../../../../widgets/texts/title.dart';
import '../../controllers/update_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: const TAppBar(
        showBackIcon: true,
        title: TTitleText('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Header
              Text(
                'User real name for easy verification. this name will appear on several pages.',
                style: Theme.of(context).textTheme.labelSmall,
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// -- Form
              Form(
                key: controller.updateNameFormKey,
                child: Column(
                  children: [
                    /// E-mail
                    TPrimaryTextField(
                      controller: controller.firstName,
                      validator: (value) => TValidator.emptyText(context, 'First name', value),
                      prefixIcon: Iconsax.user,
                      label: context.translate.firstname,
                    ).withPadding(TSizes.spaceBtwInputFields.bottomPadding),

                    /// E-mail
                    TPrimaryTextField(
                      controller: controller.lastName,
                      validator: (value) => TValidator.emptyText(context, 'Last name', value),
                      prefixIcon: Iconsax.user,
                      label: context.translate.lastname,
                    ),
                  ],
                ),
              ).withPadding(TSizes.spaceBtwSections.bottomPadding),

              /// -- Close Account
              TPrimaryButton(
                title: 'Save',
                onPressed: () => controller.updateUserName(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
