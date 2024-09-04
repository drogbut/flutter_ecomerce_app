import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/extensions/context.dart';

class TCartCounterIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? iconColor;
  final IconData? cartIcon;

  const TCartCounterIcon({
    required this.onPressed,
    this.iconColor,
    this.cartIcon = Iconsax.shopping_cart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(onPressed: onPressed, icon: Icon(cartIcon, color: iconColor)),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '2',
                style: context.textTheme.labelMedium?.copyWith(color: Colors.white),
                textScaler: const TextScaler.linear(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
