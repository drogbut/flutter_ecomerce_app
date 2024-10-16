import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../loaders/shimmer_effects.dart';

class TCircularImage extends StatelessWidget {
  final double width, height, padding;
  final String image;
  final BoxFit? fit;
  final bool isNetworkImage;
  final Color? overlayColor, backgroundColor;
  final Widget errorWidget;

  const TCircularImage({
    required this.image,
    this.width = 80,
    this.height = 80,
    this.padding = TSizes.sm,
    this.backgroundColor,
    this.overlayColor = TColors.black,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
    this.errorWidget = const Icon(Icons.error),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ?? context.blackOrWhite,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
          child: isNetworkImage
              ? CachedNetworkImage(
                  width: width,
                  height: height,
                  fit: fit,
                  color: overlayColor,
                  imageUrl: image,
                  progressIndicatorBuilder: (_, __, ___) => const TShimmerEffects(width: 55, height: 55, radius: 55),
                  errorWidget: (_, __, ___) => errorWidget,
                )
              : Image(
                  width: width,
                  height: height,
                  fit: fit,
                  color: overlayColor,
                  image: AssetImage(image) as ImageProvider,
                ),
        ),
      ),
    );
  }
}
