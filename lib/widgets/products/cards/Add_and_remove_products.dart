import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';
import '../../icons/circular.dart';
import '../../texts/title.dart';

class TAddAndRemoveProducts extends StatelessWidget {
  final VoidCallback? onMinusPressed, onPlusPressed;
  final double? iconWidth, iconHeight;
  final String counter;
  final Color? minusIconColor, minusBackgroundColor, plusIconColor, plusBackgroundColor;

  const TAddAndRemoveProducts({
    required this.counter,
    required this.onMinusPressed,
    required this.onPlusPressed,
    this.iconWidth = 40,
    this.iconHeight = 40,
    super.key,
    this.minusIconColor = Colors.black,
    this.minusBackgroundColor = TColors.grey,
    this.plusIconColor = Colors.white,
    this.plusBackgroundColor = TColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        /// Minus icon
        TCircularIcon(
          width: iconWidth,
          height: iconHeight,
          onPressed: onMinusPressed,
          iconData: Iconsax.minus,
          iconColor: minusIconColor,
          backgroundColor: minusBackgroundColor,
        ),

        /// Counter
        TTitleText(counter).withPadding(TSizes.sm.horizontalPadding),

        /// Plus icon
        TCircularIcon(
          width: iconWidth,
          height: iconHeight,
          onPressed: onPlusPressed,
          iconData: Iconsax.add,
          iconColor: plusIconColor,
          backgroundColor: plusBackgroundColor,
        ),
      ],
    );
  }
}
