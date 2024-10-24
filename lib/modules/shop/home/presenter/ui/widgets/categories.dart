import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/cards/vertical_image_card.dart';
import '../../../../../../widgets/texts/section_header.dart';
import '../../controllers/categories_controller.dart';
import 'category_shimmer.dart';
import 'sub_categories.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Header
        TSectionHeader(
          title: context.translate.homeCategoriesTitle,
          textColor: context.isDarkMode ? Colors.black : Colors.white,
        ).withPadding(TSizes.spaceBtwItems.bottomPadding),

        /// categories
        Obx(() {
          /// loading
          if (controller.isLoading.value) return TCategoryShimmer();

          /// Empty list
          if (controller.featuredCategories.isEmpty) {
            return Center(
                child: Text('No data Found!',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)));
          }

          /// Leoded
          return SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: controller.featuredCategories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final category = controller.featuredCategories[index];

                return TVerticalImageCard(
                  imageUrl: category.image,
                  itemTitle: category.name,
                  onTap: () => Get.to(() => const HomeSubCategories()),
                );
              },
              separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
            ),
          );
        }),
      ],
    );
  }
}
