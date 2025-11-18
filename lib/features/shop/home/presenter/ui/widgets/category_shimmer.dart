import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/loaders/shimmer_effects.dart';

class TCategoryShimmer extends StatelessWidget {
  final int itemCount;
  const TCategoryShimmer({
    this.itemCount = 6,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
        itemBuilder: (_, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              TShimmerEffects(width: 55, height: 55, radius: 55),
              TSizes.spaceBtwItems.sbs,

              /// Text
              TShimmerEffects(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}
