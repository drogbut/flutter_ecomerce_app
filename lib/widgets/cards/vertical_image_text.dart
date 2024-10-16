import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../images/circular.dart';

class TVerticalImageText extends StatelessWidget {
  final String image;
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool isNetworkImage;

  const TVerticalImageText({
    required this.image,
    required this.title,
    this.titleColor = Colors.white,
    required this.onTap,
    this.isNetworkImage = true,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Circular icon
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              //padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: context.lightOrDark,
            ),

            const SizedBox(height: TSizes.sm),

            /// Title
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.labelMedium?.copyWith(color: titleColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
