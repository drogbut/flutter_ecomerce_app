import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images_string.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/extensions/color.dart';
import '../../../core/extensions/context.dart';
import '../../../core/extensions/widget.dart';
import '../../../modules/shop/stores/product_detail/product_detail_screen.dart';
import '../../containers/rounded_container.dart';
import '../../icons/circular.dart';
import '../../images/rounded.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../widgets/price.dart';
import '../widgets/title.dart';

class TProductCardHorizontal extends StatelessWidget {
  final VoidCallback? onPressed;

  const TProductCardHorizontal({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const StoreProductDetailScreen()),
      child: Container(
        width: 310,
        padding: 1.allPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: context.darkgreyOrGrey,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbail, whishlist button, Discount tag
            TRoundedContainer(
              height: 120,
              padding: TSizes.sm.allPadding,
              backgroundColor: context.darkgreyOrGrey,
              child: Stack(
                children: [
                  /// Thumbail
                  TRoundedImage(
                    height: 120,
                    width: 120,
                    padding: TSizes.sm.allPadding,
                    imageUrl: TImages.productImage1,
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacityPercent(0.8),
                      padding: (h: TSizes.sm, v: TSizes.xs).symmetricPadding,
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge?.apply(color: TColors.black)),
                    ),
                  ),

                  /// favorite icon buttonm
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      iconColor: Colors.red,
                      iconData: Iconsax.heart5,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            /// Detail
            SizedBox(
              width: 172,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///  title
                  const TProductTitleText(
                    title: 'Greeen Nike Air Shop Greeen Nike Air Shop Greeen Nike Air Shop',
                    isSmallSize: true,
                  ).withPadding(TSizes.xs.verticalPadding),

                  const TBrandtitleWithVerifyIcon(title: 'Nike'),

                  /// space
                  const Spacer(),

                  /// Price and icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      /// Price
                      const Flexible(child: TProductPriceText(price: '35.5', currentSign: '€')),

                      /// Icon
                      Container(
                        decoration: const BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(TSizes.productImageRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ).withPadding(TSizes.sm.leftPadding),
            ),
          ],
        ),
      ),
    );
  }
}
