import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

/// A roundet container with a background and a child
class TRoundedContainer extends StatelessWidget {
  final double? width, height, radius;
  final Widget? child;
  final Color backgroundColor, borderColor;
  final bool showBorder;
  final EdgeInsetsGeometry? padding, margin;

  const TRoundedContainer({
    this.width,
    this.height,
    this.radius = TSizes.cardRadiusLg,
    this.child,
    this.backgroundColor = Colors.white,
    this.borderColor = TColors.borderPrimary,
    this.padding,
    this.margin,
    this.showBorder = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius!),
          color: backgroundColor,
          border: showBorder ? Border.all(color: borderColor) : null),
      child: child,
    );
  }
}
