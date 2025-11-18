import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/clippers/clipper.dart';
import '../../../../../widgets/icons/circular.dart';
import '../../../../../widgets/images/rounded.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      color: context.whiteOrPrimary,
      child: Stack(
        children: [
          /// Large background image
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TRoundedImage(
              height: 400,
              padding: TSizes.sm.allPadding,
              imageUrl: TImages.productImage5,
            ).withPadding(TSizes.productImageRadius.allPadding),
          ),

          /// Image slider
          Positioned(
            bottom: 30,
            left: TSizes.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (_, __) => TSizes.sm.sbs,
                itemBuilder: (_, index) => SizedBox(
                  width: 80,
                  child: TRoundedImage(
                    imageUrl: TImages.productImage3,
                    backgroundColor: context.darkOrWhite,
                    border: Border.all(color: TColors.primary),
                    padding: TSizes.sm.allPadding,
                  ),
                ),
              ),
            ),
          ),

          /// Appbar
          TAppBar(
            showBackIcon: true,
            actions: [
              TCircularIcon(onPressed: () {}, iconData: Iconsax.heart).withPadding(TSizes.sm.rightPadding),
            ],
          ),
        ],
      ),
    );
  }
}
