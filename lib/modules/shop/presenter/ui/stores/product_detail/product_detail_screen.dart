import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/buttons/primary.dart';
import '../../../../../../widgets/products/bottom_add_to_card.dart';
import '../../../../../../widgets/texts/section_header.dart';
import 'widgets/meta_data.dart';
import 'widgets/product_attributes.dart';
import 'widgets/product_image_slider.dart';
import 'widgets/raiting_and_share.dart';

class StoreProductDetailScreen extends StatelessWidget {
  const StoreProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 1- images slider
            const TProductImageSlider(),

            /// 2- Product details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & share
                  const TRaitingAndShare(),

                  /// price, title, stock & brand
                  const TMetaData(),

                  /// Attributes
                  const TProductAttributes(),

                  /// Checkout
                  TSizes.spaceBtwSections.sbs,
                  TPrimaryButton(title: 'Checkout', onPressed: () {}),

                  /// Description
                  TSizes.spaceBtwSections.sbs,
                  const TSectionHeader(title: 'Description'),
                  const ReadMoreText(
                    trimLength: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    'Hier is the text that can containt more lines and the user can use less or more tu expand the text.Hier is the text that can containt more lines and the user can use less or more tu expand the text.',
                  ),

                  /// Reviews
                  const Divider(),
                  TSizes.spaceBtwItems.sbs,
                  TSectionHeader(
                    title: 'Reviews (199)',
                    showActionButton: true,
                    onPressed: () {},
                  ),
                  TSizes.spaceBtwSections.sbs,
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const TBottomAddToCard(),
    );
  }
}
