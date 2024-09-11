import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../containers/rounded_container.dart';
import 'brand_card.dart';

class TBrandShowcase extends StatelessWidget {
  final List<String> images;

  const TBrandShowcase({
    required this.images,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.defaultSpace),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          /// Brands with products count
          const TBrandCard(showBorder: false),

          /// Brand top 3 products
          Row(
            children: images
                .map(
                  (image) => Expanded(
                    child: brandTopProductImage(image, context),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandTopProductImage(String image, BuildContext context) {
    return TRoundedContainer(
      height: 100,
      backgroundColor: context.darkgreyOrLight,
      margin: const EdgeInsets.only(right: TSizes.sm),
      padding: const EdgeInsets.all(TSizes.md),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    );
  }
}
