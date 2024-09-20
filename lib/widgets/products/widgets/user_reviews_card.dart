import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/images_string.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/extensions/context.dart';
import '../../../core/extensions/widget.dart';
import '../../containers/rounded_container.dart';
import '../ratings/raitingbar_indicator.dart';

class TUserReviewsCard extends StatelessWidget {
  const TUserReviewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// User heder
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const CircleAvatar(
            backgroundImage: AssetImage(TImages.userProfileImage1),
          ),
          title: Text(
            'First Last',
            style: context.textTheme.titleLarge,
          ),
          trailing: IconButton(
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),

        /// Reviews
        Row(
          children: [
            const TRatingsBarIndicator(rating: 4).withPadding(TSizes.xs.rightPadding),
            Text('02.02.2024', style: context.textTheme.bodyMedium),
          ],
        ),
        TSizes.spaceBtwItems.sbs,

        /// Read more
        ReadMoreText(
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          'I thing the product was good butnoting else. the ist top and i can recomanded it. Sometime the return take a long time. I thing the product was good butnoting else. the ist top and i can recomanded it. Sometime the return take a long time.',
          moreStyle: context.textTheme.labelMedium?.apply(color: TColors.primary, fontWeightDelta: 400),
          lessStyle: context.textTheme.labelMedium?.apply(color: TColors.primary, fontWeightDelta: 400),
        ),
        TSizes.spaceBtwItems.sbs,

        /// Compagny reviews
        TRoundedContainer(
          backgroundColor: context.darkgreyOrLight,
          child: Padding(
            padding: TSizes.md.allPadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///
                    Text("T's store", style: context.textTheme.titleMedium),
                    Text('02 Nov. 2022', style: context.textTheme.bodyMedium),
                  ],
                ),
                TSizes.spaceBtwItems.sbs,
                ReadMoreText(
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  'Thank you for your reply. We appreciate what your are doing. We would take time to ajust all your request. top and i can recomanded it. Sometime the return take a long time. I thing the product was good butnoting else. the ist top and i can recomanded it. Sometime the return take a long time.',
                  moreStyle: context.textTheme.labelMedium?.apply(color: TColors.primary, fontWeightDelta: 400),
                  lessStyle: context.textTheme.labelMedium?.apply(color: TColors.primary, fontWeightDelta: 400),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
