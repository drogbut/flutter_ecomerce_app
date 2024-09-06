import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/icons/circular.dart';

class CircularImageIcon extends StatelessWidget {
  final String? imagePath;
  final double size;
  final Color? backgroundColor;

  const CircularImageIcon({
    super.key,
    this.imagePath,
    this.size = 56.0,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: TSizes.sm.allPadding,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(size),
        ),
        child: imagePath != null && imagePath!.isNotEmpty
            ? Image.network(
                imagePath!,
                width: size,
                height: size,
                fit: BoxFit.cover,
                color: context.isDarkMode ? DColors.black : DColors.light,
              )
            : TCircularIcon(
                iconData: Icons.shopping_bag,
                onPressed: () {},
              ));
  }
}
