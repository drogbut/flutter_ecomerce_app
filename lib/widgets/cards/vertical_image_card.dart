import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';
import '../../features/shop/widgets/circular_image_icon.dart';

class TVerticalImageCard extends StatelessWidget {
  final String? imageUrl;
  final String itemTitle;
  final Color? titleColor;
  final VoidCallback? onTap;

  const TVerticalImageCard({
    required this.imageUrl,
    required this.itemTitle,
    this.titleColor = Colors.white,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Circular image
          CircularImageIcon(imagePath: imageUrl),

          const SizedBox(height: TSizes.sm),

          /// Title
          SizedBox(
            width: 55,
            child: Text(
              itemTitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.labelMedium?.copyWith(color: titleColor),
            ),
          )
        ],
      ),
    );
  }
}
