import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/texts/title.dart';
import '../../../widgets/buttons/primary.dart';
import '../checkout/presenter/ui/checkout.dart';
import 'widgets/item_card.dart';

class TShoppingCart extends StatelessWidget {
  const TShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTitleText('Cart'), showBackIcon: true),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        ///-- Add Item Card list
        child: ItemCard(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TPrimaryButton(
          title: 'Checkout €325',
          onPressed: () => Get.to(() => const TCheckoutScreen()),
        ),
      ),
    );
  }
}
