import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/cards/vertical_image_text.dart';
import '../../../../../widgets/texts/section_header.dart';
import '../../controllers/categories/categories_controller.dart';
import 'categories_shimmer.dart';
import 'sub_categories.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

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

        /// popular categories
        Obx(
          () {
            // Loading state
            if (controller.isLoading.value) return TCategoriesShimmer();

            // Error state
            if (controller.featuredCategories.isEmpty) {
              return Center(
                child: Text(
                  'No data found!',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
                ),
              );
            }

            // Loaded state
            return SizedBox(
              height: 110,
              child: ListView.separated(
                itemCount: controller.featuredCategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final category = controller.featuredCategories[index];

                  return TVerticalImageText(
                    image: category.image,
                    title: category.name,
                    onTap: () => Get.to(
                      () => const HomeSubCategories(),
                    ),
                  );
                },
                separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
              ),
            );
          },
        ),
      ],
    );
  }
}
