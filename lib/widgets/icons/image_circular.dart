import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';

class TImageCircularIcon extends StatelessWidget {
  final String assetsImagePath;
  final Function()? onPressed;

  const TImageCircularIcon({
    required this.assetsImagePath,
    required this.onPressed,
    super.key,
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
          image: AssetImage(assetsImagePath),
        ),
      ),
    );
  }
}
