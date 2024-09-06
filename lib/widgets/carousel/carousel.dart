import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/widget.dart';
import '../clippers/clip_oval.dart';
import '../images/rounded_image.dart';
import 'controller.dart';

class TCarousel extends StatelessWidget {
  final List<String> banners;

  const TCarousel({
    required this.banners,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TCarouselController());

    return Column(
      children: [
        /// Rounded image
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage(imageUrl: url)).toList(),
        ),

        /// Spacer
        TSizes.spaceBtwItems.sbs,

        /// Slider
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                    width: 20,
                    height: 4,
                    backgroundColor: controller.currentPageIndex.value == i ? DColors.primary : DColors.grey,
                    margin: TSizes.xs,
                  )
              ],
            ))
      ],
    );
  }
}
