import 'package:flutter/material.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/clippers/clipper.dart';
import '../../../../../widgets/search_bar/search.dart';
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
                    HomeSearchBar(
                      title: context.translate.homeSearchTitle,
                      showBorder: false,
                    ).withPadding(TSizes.defaultSpace.horizontalPadding),

                    /// Categories
                    const HomeCategories().withPadding((TSizes.defaultSpace, TSizes.defaultSpace).topLeftPadding),

                    /// Articles
                  ],
                ),
              ),

              // const TopSelling().withPadding(8.verticalPadding),
            ],
          ),
        ),
      ),
    );
  }
}
