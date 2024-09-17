import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../../core/extensions/widget.dart';
import '../icons/circular.dart';
import '../texts/title.dart';

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
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Minus icon
              TCircularIcon(
                width: 40,
                height: 40,
                onPressed: () {},
                iconData: Iconsax.minus,
                iconColor: Colors.white,
                backgroundColor: TColors.darkGrey,
              ),

              /// Counter
              const TTitleText('2').withPadding(TSizes.sm.horizontalPadding),

              /// Plus icon
              TCircularIcon(
                width: 40,
                height: 40,
                onPressed: () {},
                iconData: Iconsax.add,
                iconColor: Colors.white,
                backgroundColor: TColors.black,
              ),
            ],
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
