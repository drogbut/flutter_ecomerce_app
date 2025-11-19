import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/gridviews/grid_view.dart';
import '../../../../../../widgets/products/cards/product_card_vertical.dart';
import '../../../../../../widgets/texts/title.dart';

class TViewAllProductsScreen extends StatelessWidget {
  const TViewAllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTitleText('Popular products'), showBackIcon: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSizes.defaultSpace.allPadding,
          child: Column(
            children: [
              /// Search card
              DropdownButtonFormField(
                decoration: InputDecoration(
                  prefix: const Icon(Iconsax.sort).withPadding(TSizes.sm.rightPadding),
                  hintText: 'Filter',
                  hintStyle: context.textTheme.titleLarge,
                ),
                items: ['Name', 'Higher Price', 'Lower price', 'sale', 'popularity']
                    .map(
                      (option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ),
                    )
                    .toList(),
                onChanged: (value) {},
              ),

              /// Popular products
              TGridView(
                itemCount: 10,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ).withPadding(TSizes.defaultSpace.allPadding),
            ],
          ),
        ),
      ),
    );
  }
}
