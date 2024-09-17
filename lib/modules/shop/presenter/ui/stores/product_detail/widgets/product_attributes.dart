import 'package:flutter/material.dart';

import '../../../../../../../core/constants/sizes.dart';
import '../../../../../../../core/extensions/context.dart';
import '../../../../../../../core/extensions/widget.dart';
import '../../../../../../../widgets/chips/choice_chip.dart';
import '../../../../../../../widgets/containers/rounded_container.dart';
import '../../../../../../../widgets/products/widgets/price.dart';
import '../../../../../../../widgets/products/widgets/title.dart';
import '../../../../../../../widgets/texts/section_header.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Variation rounded card
        TRoundedContainer(
          padding: TSizes.md.allPadding,
          backgroundColor: context.darkgreyOrGrey,
          child: Column(
            children: [
              Row(
                children: [
                  /// variation title
                  const TSectionHeader(title: 'Variation'),
                  TSizes.spaceBtwItems.sbs,

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: 'Price : '),

                          /// Actuel price
                          const TProductPriceText(price: '25', lineThrough: true),
                          TSizes.spaceBtwItems.sbs,

                          /// Sale price
                          const TProductPriceText(price: '20'),
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          /// Stock title
                          const TProductTitleText(title: 'StocK : '),

                          /// Stock desciption
                          Text('in stock', style: context.textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation desciption
              const TProductTitleText(
                maxlines: 4,
                isSmallSize: true,
                title: 'This is the description of the product and it can go up with max lines of 4',
              ),
            ],
          ),
        ),

        /// Attributes
        TSizes.spaceBtwSections.sbs,
        const TSectionHeader(title: 'Colors', showActionButton: true),
        Wrap(
          children: [
            TChoiceChip(
              colorName: Colors.green,
              onSelected: (value) {},
              selected: true,
            ),
            TChoiceChip(colorName: Colors.red, onSelected: (value) {}),
            TChoiceChip(colorName: Colors.yellow, onSelected: (value) {}),
          ],
        ),

        /// Attributes
        TSizes.spaceBtwSections.sbs,
        const TSectionHeader(title: 'Sizes', showActionButton: true),
        Wrap(
          spacing: TSizes.sm,
          children: [
            TChoiceChip(
              text: 'EU 34',
              onSelected: (value) {},
              selected: true,
            ),
            TChoiceChip(
              text: 'EU 42',
              onSelected: (value) {},
              selected: false,
            ),
            TChoiceChip(
              text: 'EU 44',
              onSelected: (value) {},
              selected: false,
            ),
          ],
        ),
      ],
    );
  }
}
