import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/fields/primary.dart';
import '../../../../../widgets/texts/title.dart';

class AddNeuAddress extends StatelessWidget {
  const AddNeuAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackIcon: true, title: TTitleText('Add new Address')),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSizes.defaultSpace.allPadding,
          child: Form(
            child: Column(
              children: [
                /// Text field
                const TPrimaryTextField(prefixIcon: Iconsax.user, label: 'Name'),
                TSizes.spaceBtwInputFields.sbs,
                const TPrimaryTextField(prefixIcon: Iconsax.mobile, label: 'Phone Number'),
                TSizes.spaceBtwInputFields.sbs,
                Row(
                  children: [
                    const Expanded(child: TPrimaryTextField(prefixIcon: Iconsax.building_31, label: 'Street')),
                    TSizes.spaceBtwInputFields.sbs,
                    const Expanded(child: TPrimaryTextField(prefixIcon: Iconsax.code, label: 'Postal Code')),
                  ],
                ),
                TSizes.spaceBtwInputFields.sbs,
                Row(
                  children: [
                    const Expanded(child: TPrimaryTextField(prefixIcon: Iconsax.building, label: 'City')),
                    TSizes.spaceBtwInputFields.sbs,
                    const Expanded(child: TPrimaryTextField(prefixIcon: Iconsax.activity, label: 'State')),
                  ],
                ),
                TSizes.spaceBtwInputFields.sbs,
                const TPrimaryTextField(prefixIcon: Iconsax.global, label: 'Country'),

                /// Button
                TSizes.defaultSpace.sbs,
                TPrimaryButton(title: 'Save', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
