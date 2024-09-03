import 'package:flutter/material.dart';

import '../../../../../core/extensions/context.dart';
import 'circular_image_icon.dart';

class CategoriesItem extends StatelessWidget {
  final String? imageUrl;
  final String label;

  const CategoriesItem({
    required this.imageUrl,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularImageIcon(
          imagePath: imageUrl,
          size: 60,
        ),
        const SizedBox(height: 10),
        Text(label, style: context.textTheme.labelMedium)
      ],
    );
  }
}
