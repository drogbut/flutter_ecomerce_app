import 'package:flutter/material.dart';

import '../../../../../../../core/constants/colors.dart';
import '../../../../../../../core/constants/images_string.dart';
import '../../../../../../../core/constants/sizes.dart';
import '../../../../../../../core/extensions/context.dart';
import '../../../../../../../core/extensions/widget.dart';
import '../../../../../../../widgets/containers/rounded_container.dart';
import '../../../../../../../widgets/images/circular.dart';
import '../../../../../../../widgets/products/widgets/price.dart';
import '../../../../../../../widgets/products/widgets/title.dart';
import '../../../../../../../widgets/texts/brand_title_with_verify_icon.dart';

class TMetaData extends StatelessWidget {
  const TMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            /// Sale
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
                style: context.textTheme.labelLarge?.apply(color: TColors.black),
              ),
            ),

            TSizes.sm.sbs,

            /// price
            const TProductPriceText(price: '250', lineThrough: true),
            TSizes.spaceBtwItems.sbs,
            const TProductPriceText(price: '175', isLarge: true),
          ],
        ),

        /// Title
        TSizes.spaceBtwItems.sbs,
        const TProductTitleText(title: 'Green Sport Nike'),
        TSizes.sm.sbs,

        /// Stock status
        Row(
          children: [
            /// price
            const TProductTitleText(title: 'Status'),
            TSizes.spaceBtwItems.sbs,
            Text('in stock', style: context.textTheme.titleMedium),
          ],
        ),
        TSizes.spaceBtwItems.sbs,

        /// Brands
        Row(
          children: [
            TCircularImage(
              width: 32,
              height: 32,
              overlayColor: context.whiteOrBlack,
              image: TImages.shoeIcon,
            ),
            const TBrandtitleWithVerifyIcon(title: 'Nike'),
          ],
        )
      ],
    );
  }
}
