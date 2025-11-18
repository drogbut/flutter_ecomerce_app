import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/gridviews/grid_view.dart';
import '../../../widgets/icons/circular.dart';
import '../../../widgets/products/cards/product_card_vertical.dart';
import '../../../widgets/texts/title.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: const TTitleText('Whishlist'),
        actions: [
          TCircularIcon(iconData: Iconsax.add, onPressed: () {}).withPadding(TSizes.defaultSpace.rightPadding),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TGridView(itemBuilder: (_, index) => const TProductCardVertical(), itemCount: 4),
          ),
        ],
      ),
    );
  }
}
