import 'package:flutter/material.dart';

import '../../../../core/constants/images_string.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/images/rounded.dart';
import '../../../../widgets/products/cards/add_and_remove_products.dart';
import '../../../../widgets/products/widgets/price.dart';
import '../../../../widgets/products/widgets/title.dart';
import '../../../../widgets/texts/brand_title_with_verify_icon.dart';

class ItemCard extends StatelessWidget {
  final bool shwAddAndRemoveButtons;

  const ItemCard({
    this.shwAddAndRemoveButtons = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
      itemCount: 10,
      itemBuilder: (_, index) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          TRoundedImage(
            width: 60,
            height: 60,
            padding: TSizes.sm.allPadding,
            backgroundColor: context.darkgreyOrLight,
            imageUrl: TImages.productImage1,
          ),
          TSizes.sm.sbs,

          /// Title, brands ans more
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Brands title
                const TBrandtitleWithVerifyIcon(title: 'Nike'),
                const Flexible(child: TProductTitleText(title: 'Black sport shoes')),

                /// Attribute
                Text.rich(
                  TextSpan(children: [
                    TextSpan(text: 'Color ', style: context.textTheme.bodySmall),
                    TextSpan(text: 'Green', style: context.textTheme.bodyLarge),
                    TextSpan(text: ' Size ', style: context.textTheme.bodySmall),
                    TextSpan(text: 'EU 34', style: context.textTheme.bodyLarge),
                  ]),
                ),
                if (shwAddAndRemoveButtons) TSizes.sm.sbs,

                /// PlusMinus card & Price
                if (shwAddAndRemoveButtons)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// PlusMinus card
                      Expanded(
                        child: TAddAndRemoveProducts(
                          iconHeight: 30,
                          iconWidth: 30,
                          counter: '2',
                          onMinusPressed: () {},
                          onPlusPressed: () {},
                        ),
                      ),

                      /// Price
                      const TProductPriceText(price: '325', currentSign: '€')
                    ],
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
