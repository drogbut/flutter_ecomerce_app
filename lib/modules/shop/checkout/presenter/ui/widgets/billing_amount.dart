import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/products/widgets/price.dart';

class TBillingAmount extends StatelessWidget {
  const TBillingAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: context.textTheme.bodyMedium),
            const TProductPriceText(price: '235.0', currentSign: '€'),
          ],
        ),
        TSizes.sm.sbs,

        /// Shipping free
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Free', style: context.textTheme.bodyMedium),
            const TProductPriceText(price: '6.0', currentSign: '€'),
          ],
        ),
        TSizes.sm.sbs,

        /// Tax free
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TAX Free', style: context.textTheme.bodyMedium),
            const TProductPriceText(price: '16.0', currentSign: '€'),
          ],
        ),
        TSizes.sm.sbs,

        /// Order total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total', style: context.textTheme.bodyMedium),
            const TProductPriceText(price: '252.0', currentSign: '€'),
          ],
        ),
        TSizes.sm.sbs,
      ],
    );
  }
}
