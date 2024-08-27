import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';

class TCircularImageIcon extends StatelessWidget {
  final String imagePath;
  final Function()? onPressed;

  const TCircularImageIcon({
    super.key,
    required this.imagePath,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: onPressed,
        icon: Image(
          width: DSizes.iconMd,
          height: DSizes.iconMd,
          image: AssetImage(imagePath),
        ),
      ),
    );
  }
}
