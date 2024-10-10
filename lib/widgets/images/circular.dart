import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../loaders/shimmer_effects.dart';

class TCircularImage extends StatelessWidget {
  final double? width, height, padding;
  final String imagePath;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final Widget errorWidget;

  const TCircularImage({
    required this.imagePath,
    this.width = 80,
    this.height = 80,
    this.padding = TSizes.sm,
    this.backgroundColor,
    this.overlayColor = TColors.black,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.errorWidget = const Icon(Iconsax.user),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
        color: backgroundColor ?? (context.isDarkMode ? TColors.black : Colors.white),
      ),
      alignment: Alignment.center,
      child: isNetworkImage
          ? ClipOval(
              child: CachedNetworkImage(
                width: width,
                height: height,
                fit: fit,
                color: overlayColor,
                imageUrl: imagePath,
                progressIndicatorBuilder: (_, __, ___) => const TShimmerEffects(width: 80, height: 80),
                errorWidget: (_, __, ___) => errorWidget,
              ),
            )
          : ClipOval(
              child: Image(
                width: width,
                height: height,
                fit: fit,
                color: overlayColor,
                image: AssetImage(imagePath) as ImageProvider,
              ),
            ),
    );
  }
}
