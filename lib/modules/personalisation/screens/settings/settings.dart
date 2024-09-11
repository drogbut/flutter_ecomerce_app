import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/secondary.dart';
import '../../../../widgets/clippers/clipper.dart';
import '../../../../widgets/list_tiles/settings_menu.dart';
import '../../../../widgets/texts/section_header.dart';
import 'widgets/user_profile_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- Settings appbar
                  TAppBar(title: Text('Account')),

                  /// -- User profile card
                  TUserProfileCard(),
                ],
              ),
            ),

            /// -- User profile card
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account  title
                  const TSectionHeader(title: 'Account setttings').withPadding(TSizes.spaceBtwItems.bottomPadding),

                  /// -- Account settings
                  const TSettingsMenuTile(
                      iconData: Iconsax.safe_home, title: 'My Addresse', subTitle: 'Ste Shopping delivery adresse'),
                  const TSettingsMenuTile(
                      iconData: Iconsax.shopping_cart, title: 'My Addresse', subTitle: 'Ste Shopping delivery adresse'),
                  const TSettingsMenuTile(
                      iconData: Iconsax.bag_tick, title: 'My Addresse', subTitle: 'Ste Shopping delivery adresse'),
                  const TSettingsMenuTile(
                      iconData: Iconsax.bank, title: 'My Addresse', subTitle: 'Ste Shopping delivery adresse'),
                  const TSettingsMenuTile(
                      iconData: Iconsax.discount_circle,
                      title: 'My Addresse',
                      subTitle: 'Ste Shopping delivery adresse'),
                  const TSettingsMenuTile(
                      iconData: Iconsax.notification, title: 'My Addresse', subTitle: 'Ste Shopping delivery adresse'),
                  const TSettingsMenuTile(
                      iconData: Iconsax.security_card, title: 'My Addresse', subTitle: 'Ste Shopping delivery adresse'),

                  /// -- App settings  title
                  const TSectionHeader(title: 'App setttings').withPadding(TSizes.spaceBtwItems.verticalPadding),

                  /// -- Account settings
                  const TSettingsMenuTile(
                      iconData: Iconsax.document_upload, title: 'Load Data', subTitle: 'Ste Shopping delivery adresse'),
                  TSettingsMenuTile(
                    iconData: Iconsax.location,
                    title: 'Geolocalisation',
                    subTitle: 'Ste Shopping delivery adresse',
                    trailing: Switch.adaptive(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    iconData: Iconsax.security_user,
                    title: 'Safe mode',
                    subTitle: 'Ste Shopping delivery adresse',
                    trailing: Switch.adaptive(value: false, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    iconData: Iconsax.image,
                    title: 'HD image quality',
                    subTitle: 'Ste Shopping delivery adresse',
                    trailing: Switch.adaptive(value: false, onChanged: (value) {}),
                  ),

                  TSecondaryButton(title: 'Logout', onPressed: () {})
                      .withPadding(TSizes.spaceBtwSections.verticalPadding),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
