import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/sizes.dart';

class TCircularIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? tooltip;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize;

  const TCircularIcon({
    required this.onPressed,
    required this.iconData,
    this.tooltip,
    this.iconColor,
    this.backgroundColor,
    this.iconSize = TSizes.iconMd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: const EdgeInsets.all(8),
        constraints: const BoxConstraints(),
        tooltip: tooltip,
        icon: FaIcon(iconData, color: iconColor, size: iconSize),
        onPressed: onPressed,
      ),
    );
  }
}
