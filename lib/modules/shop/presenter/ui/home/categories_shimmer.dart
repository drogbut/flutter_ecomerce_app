import 'package:flutter/material.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/loaders/shimmer_effects.dart';

class TCategoriesShimmer extends StatelessWidget {
  final int itemCount;

  const TCategoriesShimmer({
    this.itemCount = 6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
        itemBuilder: (_, index) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// image
            TShimmerEffects(width: 80, height: 80, radius: 55),
            const SizedBox(height: TSizes.sm),

            /// Title
            TShimmerEffects(width: 80, height: 8),
          ],
        ),
      ),
    );
  }
}
