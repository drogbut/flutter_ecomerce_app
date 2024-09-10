import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize, radius, width, height;

  const TCircularIcon({
    required this.onPressed,
    required this.iconData,
    this.iconColor,
    this.width,
    this.height,
    this.radius = 100,
    this.backgroundColor,
    this.iconSize = TSizes.iconMd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 100),
        color: backgroundColor != null
            ? backgroundColor!
            : context.isDarkMode
                ? TColors.black.withOpacity(0.8)
                : TColors.white.withOpacity(0.8),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        icon: Icon(iconData, color: iconColor, size: iconSize),
        onPressed: onPressed,
      ),
    );
  }
}
