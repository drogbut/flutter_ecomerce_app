import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/appbar/tabbar.dart';
import '../../../../../../widgets/gridviews/grid_view.dart';
import '../../../../../../widgets/products/brand_card.dart';
import '../../../../../../widgets/search_bar/search.dart';
import '../../../../../../widgets/texts/section_header.dart';

class StoreFeaturedBrands extends StatelessWidget {
  const StoreFeaturedBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: SliverAppBar(
        pinned: true,
        floating: true,
        backgroundColor: context.blackOrWhite,
        expandedHeight: 440,
        automaticallyImplyLeading: false,
        flexibleSpace: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            /// Search Bar
            TSearchBar(
              title: context.translate.storeSearchTitle,
              showBackground: false,
              showBorder: true,
            ).withPadding(TSizes.defaultSpace.allPadding),

            /// Featured Brands - Title
            TSectionHeader(
              title: context.translate.storeFeaturedBrandsTitle,
              showActionButton: true,
              onPressed: () {},
            ).withPadding(TSizes.defaultSpace.horizontalPadding),

            ///
            TGridView(
              itemCount: 4,
              mainAxisExtent: 80,
              itemBuilder: (_, index) {
                return TBrandCard(onTap: () {});
              },
            ).withPadding(TSizes.defaultSpace.horizontalPadding),
          ],
        ),

        /// Tabs
        bottom: const TTabBar(
          tabs: [
            Tab(child: Text('Sports')),
            Tab(child: Text('Furnitures')),
            Tab(child: Text('Electronics')),
            Tab(child: Text('Clothes')),
            Tab(child: Text('Cosmetics')),
          ],
        ),
      ),
    );
  }
}
