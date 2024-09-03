import 'package:flutter/material.dart';

import '../../../../../widgets/icons/circular.dart';

class CircularImageIcon extends StatelessWidget {
  final String? imagePath;
  final double size;

  const CircularImageIcon({super.key, this.imagePath, this.size = 50.0});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: imagePath != null && imagePath!.isNotEmpty
            ? Image.network(
                imagePath!,
                width: size,
                height: size,
                fit: BoxFit.cover,
              )
            : TCircularIcon(
                iconData: Icons.person,
                onPressed: () {},
              ));
  }
}
