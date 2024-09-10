import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';

class TCircularImage extends StatelessWidget {
  final double? width, height, padding;
  final String imagePath;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;

  const TCircularImage({
    required this.imagePath,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
    this.backgroundColor,
    this.overlayColor = TColors.black,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        color: backgroundColor ?? (context.isDarkMode ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          color: overlayColor,
          image: isNetworkImage ? NetworkImage(imagePath) : AssetImage(imagePath) as ImageProvider,
        ),
      ),
    );
  }
}
