import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/products/ratings/raitingbar_indicator.dart';
import '../../../../../../widgets/products/widgets/user_reviews_card.dart';
import '../../../../../../widgets/texts/title.dart';
import 'widgets/overral_product_ratting.dart';

class StoreProductReviewsScreen extends StatelessWidget {
  const StoreProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: TTitleText('Reviews & Ratings'),
        showBackIcon: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 1- Text
              const Text(
                  'Ratings and reviews are verify an more. Ratings and reviews are verify an more. Ratings and reviews are verify an more. Ratings and reviews are verify an more. Ratings and reviews are verify an more. Ratings and reviews are verify an more. '),
              TSizes.spaceBtwItems.sbs,

              /// 2- Overall product ratings
              const TOverrralProductRatings(),
              const TRatingsBarIndicator(rating: 3.5),
              Text('12,612', style: context.textTheme.bodySmall),

              /// User reviews list
              const TUserReviewsCard(),
              const TUserReviewsCard(),
              const TUserReviewsCard(),
            ],
          ),
        ),
      ),
    );
  }
}
