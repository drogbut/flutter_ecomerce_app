import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/enums.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/widget.dart';
import 'brand_title.dart';

class TBrandtitleWithVerifyIcon extends StatelessWidget {
  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign textAlign;
  final TextSizes brandtextSizes;

  const TBrandtitleWithVerifyIcon({
    required this.title,
    this.maxLines = 1,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandtextSizes = TextSizes.small,
    this.textColor = TColors.darkGrey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// title
        TBrandTitleText(
          title,
          color: textColor,
          brandtextSizes: brandtextSizes,
          maxLines: maxLines,
          textAlign: textAlign,
        ).withPadding(TSizes.xs.rightPadding),
        Icon(Iconsax.verify5, size: TSizes.iconXs, color: iconColor)
      ],
    );
  }
}
