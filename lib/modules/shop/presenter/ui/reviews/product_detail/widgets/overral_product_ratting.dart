import 'package:flutter/material.dart';

import '../../../../../../../core/constants/sizes.dart';
import '../../../../../../../core/extensions/context.dart';
import '../../../../../../../core/extensions/widget.dart';
import 'rating_progress_indicator.dart';

class TOverrralProductRatings extends StatelessWidget {
  const TOverrralProductRatings({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// Score
        Expanded(
            flex: 3,
            child: Text('4.8', style: context.textTheme.displayLarge).withPadding(TSizes.spaceBtwItems.rightPadding)),

        /// Rating
        const Expanded(
            flex: 7,
            child: Column(
              children: [
                TRatingProgressIndicator(text: '5', value: 0.9),
                TRatingProgressIndicator(text: '4', value: 0.8),
                TRatingProgressIndicator(text: '3', value: 0.6),
                TRatingProgressIndicator(text: '2', value: 0.4),
                TRatingProgressIndicator(text: '1', value: 0.2),
              ],
            )),
      ],
    );
  }
}
