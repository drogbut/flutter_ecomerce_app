import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/cards/vertical_image_card.dart';
import '../../../../../widgets/texts/section_header.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Header
        TSectionHeader(
          title: context.translate.homeCategoriesTitle,
          textColor: context.isDarkMode ? Colors.black : Colors.white,
        ).withPadding(TSizes.spaceBtwItems.bottomPadding),

        /// categories
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              return TVerticalImageCard(
                imageUrl: null,
                itemTitle: 'title',
                onTap: () {},
              );
            },
            separatorBuilder: (_, index) => TSizes.spaceBtwItems.sbs,
          ),
        ),
      ],
    );
  }
}
