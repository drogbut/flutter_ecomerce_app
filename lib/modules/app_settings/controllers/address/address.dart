import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/texts/title.dart';
import 'widgets/add_neu_address.dart';
import 'widgets/single_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          const TAppBar(showBackIcon: true, title: TTitleText('Users Address')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNeuAddress()),
        child: const Icon(Iconsax.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSizes.defaultSpace.allPadding,
          child: const Column(
            children: [
              /// Single Address
              TSingleAddress(isSelectedAddress: true),
              TSingleAddress(isSelectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
