import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/texts/title.dart';
import '../../../../../widgets/buttons/primary.dart';
import 'widgets/item_card.dart';

class TShoppingCart extends StatelessWidget {
  const TShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTitleText('Cart'), showBackIcon: true),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
          itemCount: 10,
          itemBuilder: (_, index) => const ItemCard(),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TPrimaryButton(title: 'Checkout €325', onPressed: () {}),
      ),
    );
  }
}
