import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/enums.dart';
import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/containers/rounded_container.dart';
import '../../../../../widgets/gridviews/grid_view.dart';
import '../../../../../widgets/images/circular.dart';
import '../../../../../widgets/search_bar/search.dart';
import '../../../../../widgets/texts/brand_title_with_verify_icon.dart';
import '../../../../../widgets/texts/section_header.dart';

class StoreFeaturedBrands extends StatelessWidget {
  const StoreFeaturedBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      backgroundColor: context.isDarkMode ? TColors.black : TColors.white,
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
              return GestureDetector(
                onTap: () {},
                child:

                    /// Featured Brandss - body
                    TRoundedContainer(
                  showBorder: true,
                  backgroundColor: Colors.transparent,
                  child: Row(
                    children: [
                      /// Icon
                      Flexible(
                        child: TCircularImage(
                          imagePath: TImages.clothIcon,
                          backgroundColor: Colors.transparent,
                          overlayColor: context.isDarkMode ? TColors.white : TColors.black,
                        ),
                      ),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const TBrandtitleWithVerifyIcon(
                              title: 'Nike',
                              brandtextSizes: TextSizes.large,
                            ),
                            Text(
                              '255 products',
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ).withPadding(TSizes.defaultSpace.horizontalPadding),
        ],
      ),
    );
  }
}
