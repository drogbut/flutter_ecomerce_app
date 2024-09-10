import 'package:flutter/material.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/carousel/carousel.dart';
import '../../../../../widgets/clippers/clipper.dart';
import '../../../../../widgets/gridviews/grid_view.dart';
import '../../../../../widgets/products/vertical.dart';
import '../../../../../widgets/search_bar/search.dart';
import '../../../../../widgets/texts/section_header.dart';
import 'categories.dart';
import 'header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Column(
            children: [
              /// Background clipper widget
              TClipperWidget(
                child: Column(
                  children: [
                    /// Header
                    const HomeHeader().withPadding((h: TSizes.sm, v: TSizes.spaceBtwSections).symmetricPadding),

                    /// Search bar
                    TSearchBar(
                      title: context.translate.homeSearchTitle,
                      showBorder: false,
                    ).withPadding(TSizes.defaultSpace.horizontalPadding),

                    /// Categories
                    const HomeCategories().withPadding((TSizes.defaultSpace, TSizes.defaultSpace).topLeftPadding),

                    /// Articles
                  ],
                ),
              ),

              /// Carousel Slider
              const TCarousel(
                banners: [
                  TImages.promoBanner1,
                  TImages.promoBanner2,
                  TImages.promoBanner3,
                ],
              ).withPadding(TSizes.defaultSpace.horizontalPadding),

              /// Header populat
              TSectionHeader(
                title: context.translate.homeCategoriesTitle,
                showActionButton: true,
                onPressed: () {},
              ).withPadding(TSizes.defaultSpace.horizontalPadding),

              /// Popular products
              TGridView(
                itemCount: 10,
                itemBuilder: (_, index) => const TProductCardVertical(),
              ).withPadding(TSizes.defaultSpace.allPadding),
            ],
          ),
        ),
      ),
    );
  }
}
