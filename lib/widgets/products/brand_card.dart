import 'package:flutter/material.dart';

import '../../core/constants/enums.dart';
import '../../core/constants/images_string.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../containers/rounded_container.dart';
import '../images/circular.dart';
import '../texts/brand_title_with_verify_icon.dart';

class TBrandCard extends StatelessWidget {
  final VoidCallback? onTap;
  final bool showBorder;

  const TBrandCard({
    this.onTap,
    this.showBorder = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      ///container Design
      child: TRoundedContainer(
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(TSizes.sm),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Icon
            Flexible(
              child: TCircularImage(
                image: TImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: context.whiteOrBlack,
              ),
            ),

            /// Texts
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
  }
}
