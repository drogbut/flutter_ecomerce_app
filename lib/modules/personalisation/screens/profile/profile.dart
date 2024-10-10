import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/tertiary.dart';
import '../../../../widgets/list_tiles/profile_menu.dart';
import '../../../../widgets/texts/section_header.dart';
import '../../../../widgets/texts/title.dart';
import '../../controllers/user_controller.dart';
import 'widgets/profile_picture.dart';

class TProfilePage extends StatelessWidget {
  const TProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
      appBar: const TAppBar(showBackIcon: true, title: TTitleText('Profile')),

      /// -- body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- profile picture
              ProfilePicture(controller: controller),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Details
              Column(
                children: [
                  const TSectionHeader(title: 'Profile information').withPadding(TSizes.spaceBtwItems.bottomPadding),
                  TProfileMenuTile(title: 'name', subTitle: controller.userModel.value.firstName),
                  TProfileMenuTile(title: 'username', subTitle: controller.userModel.value.lastName),
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Personal inform
              Column(
                children: [
                  const TSectionHeader(title: 'Personal information').withPadding(TSizes.spaceBtwItems.bottomPadding),
                  TProfileMenuTile(title: 'UserID', subTitle: controller.userModel.value.id, iconData: Iconsax.copy),
                  TProfileMenuTile(title: 'E-Mail', subTitle: controller.userModel.value.email),
                  TProfileMenuTile(title: 'phone number', subTitle: controller.userModel.value.phoneNumber),
                  const TProfileMenuTile(title: 'Gender', subTitle: 'Male'),
                  const TProfileMenuTile(title: 'Date of Birth', subTitle: '04 Sept. 1990'),
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Close Account
              TTertiaryButton(
                title: 'close Account',
                onPressed: () => controller.deleteAccountWarningPopup(),
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
