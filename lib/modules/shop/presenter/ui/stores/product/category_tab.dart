import 'package:flutter/material.dart';

import '../../../../../../core/constants/images_string.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/gridviews/grid_view.dart';
import '../../../../../../widgets/products/brand_showcase.dart';
import '../../../../../../widgets/products/vertical.dart';
import '../../../../../../widgets/texts/section_header.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          margin: const EdgeInsets.all(TSizes.sm),
          child: Column(
            children: [
              /// -- Brands
              const TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),
              const TBrandShowcase(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3,
                ],
              ),

              /// -- Products header section
              TSectionHeader(
                showActionButton: true,
                title: 'You might like',
                onPressed: () {},
              ).withPadding(TSizes.spaceBtwItems.bottomPadding),

              /// -- Products gridview
              TGridView(
                itemBuilder: (_, index) => const TProductCardVertical(),
                itemCount: 4,
              )
            ],
          ),
        ),
      ],
    );
  }
}
