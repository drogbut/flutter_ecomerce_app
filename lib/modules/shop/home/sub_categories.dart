import 'package:flutter/material.dart';

import '../../../core/constants/images_string.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/images/rounded.dart';
import '../../../widgets/products/cards/product_card_horizontal.dart';
import '../../../widgets/texts/section_header.dart';
import '../../../widgets/texts/title.dart';

class HomeSubCategories extends StatelessWidget {
  const HomeSubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTitleText('Category'), showBackIcon: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: TSizes.defaultSpace.allPadding,
          child: Column(
            children: [
              /// Slider Image
              const TRoundedImage(imageUrl: TImages.banner3),
              TSizes.spaceBtwSections.sbs,

              /// Equipment header
              TSectionHeader(
                title: 'Popular categories',
                showActionButton: true,
                onPressed: () {},
              ),

              /// Product list
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
                  itemBuilder: (_, index) => const TProductCardHorizontal(),
                ),
              ),
              TSizes.spaceBtwSections.sbs,

              /// Equipment header
              TSectionHeader(
                title: 'Popular categories',
                showActionButton: true,
                onPressed: () {},
              ),

              /// Product list
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
                  itemBuilder: (_, index) => const TProductCardHorizontal(),
                ),
              ),
              TSizes.spaceBtwSections.sbs,

              /// Equipment header
              TSectionHeader(
                title: 'Popular categories',
                showActionButton: true,
                onPressed: () {},
              ),

              /// Product list
              SizedBox(
                height: 120,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
                  itemBuilder: (_, index) => const TProductCardHorizontal(),
                ),
              ),
              TSizes.spaceBtwSections.sbs,
            ],
          ),
        ),
      ),
    );
  }
}
