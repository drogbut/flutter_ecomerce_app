import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/tertiary.dart';
import '../../../../widgets/icons/circular.dart';
import '../../../../widgets/list_tiles/profile_menu.dart';
import '../../../../widgets/texts/section_header.dart';
import '../../../../widgets/texts/title.dart';

class TProfilePage extends StatelessWidget {
  const TProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackIcon: true,
        title: TTitleText('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Header
              Column(
                children: [
                  TCircularIcon(
                    backgroundColor: TColors.dark.withOpacity(0.2),
                    onPressed: () {},
                    iconData: Iconsax.user,
                    width: 80,
                    height: 80,
                    iconSize: 36,
                  ),
                  TTertiaryButton(
                    title: 'Max Mustermann',
                    onPressed: () {},
                  )
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Details
              Column(
                children: [
                  const TSectionHeader(title: 'Profile information').withPadding(TSizes.spaceBtwItems.bottomPadding),
                  const TProfileMenuTile(title: 'name', subTitle: 'Max Musterman'),
                  const TProfileMenuTile(title: 'username', subTitle: 'max_musterman'),
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Personnal inform
              Column(
                children: [
                  const TSectionHeader(title: 'Personal information').withPadding(TSizes.spaceBtwItems.bottomPadding),
                  const TProfileMenuTile(title: 'UserID', subTitle: '12345', iconData: Iconsax.copy),
                  const TProfileMenuTile(title: 'E-Mail', subTitle: 'max.musterman@gmail.com'),
                  const TProfileMenuTile(title: 'Gender', subTitle: 'Male'),
                  const TProfileMenuTile(title: 'Date of Birth', subTitle: '04 Sept. 1990'),
                ],
              ),

              /// -- Break
              const Divider().withPadding(TSizes.spaceBtwItems.verticalPadding),

              /// -- Close Account
              TTertiaryButton(
                title: 'close Account',
                onPressed: () {},
                style: const TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
