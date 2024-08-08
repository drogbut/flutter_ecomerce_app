import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyCircleIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? iconData;
  final String? tooltip;
  final Color? iconColor;
  final double? iconSize;

  const MyCircleIcon({
    required this.onPressed,
    required this.iconData,
    this.tooltip,
    this.iconColor,
    this.iconSize = 24,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: context.colorScheme.primary, shape: BoxShape.circle),
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
