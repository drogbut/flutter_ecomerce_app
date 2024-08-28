import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';

class TImageCircularIcon extends StatelessWidget {
  final String imagePath;
  final Function()? onPressed;

  const TImageCircularIcon({
    super.key,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Image(
          width: TSizes.iconMd,
          height: TSizes.iconMd,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
