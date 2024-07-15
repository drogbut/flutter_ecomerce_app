import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwOutlineIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? tooltip;
  final Color? iconColor;
  final double? iconSize;

  const TwOutlineIcon({
    required this.onPressed,
    required this.iconData,
    this.tooltip,
    this.iconColor,
    this.iconSize = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      tooltip: tooltip,
      icon: FaIcon(iconData, color: iconColor, size: iconSize),
      onPressed: onPressed,
    );
  }
}
