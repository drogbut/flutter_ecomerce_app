import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../commons/style/shadow.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images_string.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';
import '../../../modules/shop/presenter/ui/stores/product_detail/product_detail_screen.dart';
import '../../containers/rounded_container.dart';
import '../../icons/circular.dart';
import '../../images/rounded.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../widgets/price.dart';
import '../widgets/title.dart';

class TProductCardVertical extends StatelessWidget {
  final VoidCallback? onPressed;
  const TProductCardVertical({
    this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const StoreProductDetailScreen()),
      child: Container(
        width: 180,
        //height: TSizes.productItemHeight,
        padding: 1.allPadding,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: context.isDarkMode ? TColors.darkGrey : TColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Thumbail, whishlist button, Discount tag
            TRoundedContainer(
              height: 180,
              padding: TSizes.sm.allPadding,
              backgroundColor: context.isDarkMode ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbail
                  TRoundedImage(
                    height: 180,
                    padding: TSizes.sm.allPadding,
                    imageUrl: TImages.productImage1,
                  ),

                  /// Sale Tag
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: TSizes.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: (h: TSizes.sm, v: TSizes.xs).symmetricPadding,
                      child: Text('25%', style: context.textTheme.labelLarge?.apply(color: TColors.black)),
                    ),
                  ),

                  /// favorite icon buttonm
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      iconData: Iconsax.heart5,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),

            /// Detail
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ///  title
                  const TProductTitleText(
                    title: 'Greeen Nike Air Shop',
                    isSmallSize: true,
                  ).withPadding(TSizes.xs.topPadding),

                  const TBrandtitleWithVerifyIcon(title: 'Nike'),

                  /// space
                  const Spacer(),

                  ///
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      const TProductPriceText(price: '35.5'),

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
