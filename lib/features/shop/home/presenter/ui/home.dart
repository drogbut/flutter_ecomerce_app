import 'package:flutter/material.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/carousel/carousel.dart';
import '../../../../../widgets/clippers/clipper.dart';
import '../../../../../widgets/gridviews/grid_view.dart';
import '../../../../../widgets/products/cards/product_card_vertical.dart';
import '../../../../../widgets/search_bar/search.dart';
import '../../../../../widgets/texts/section_header.dart';
import '../../../../../widgets/texts/title.dart';
import 'widgets/categories.dart';
import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  /// static Page<void> page() => const MaterialPage<void>(child: HomePage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: TTitleText('Home')),
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Column(
            children: [
              /// Background clipper widget
              TCurvedEdgeWidget(
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
                    const THomeCategories().withPadding((TSizes.defaultSpace, TSizes.defaultSpace).topLeftPadding),

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

              /// Header popular
              TSectionHeader(
                title: context.translate.homeCategoriesTitle,
                showActionButton: true,
                //onPressed: () => context.pushNamed(RouteNames.viewAllProducts),
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
