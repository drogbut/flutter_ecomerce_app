import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import 'cards/add_and_remove_products.dart';

class TBottomAddToCard extends StatelessWidget {
  const TBottomAddToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: context.darkgreyOrLight,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(TSizes.cardRadiusLg),
            topRight: Radius.circular(TSizes.cardRadiusLg),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// PlusMinus card
          TAddAndRemoveProducts(
            counter: '2',
            onMinusPressed: () {},
            onPlusPressed: () {},
          ),

          /// bag icon
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: TColors.grey,
            ),
            icon: const Icon(Iconsax.shopping_bag),
            onPressed: () {},
            label: const Text('Add to bag'),
          )
        ],
      ),
    );
  }
}
