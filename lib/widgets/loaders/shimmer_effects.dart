import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/extensions/context.dart';

class TShimmerEffects extends StatelessWidget {
  final double width, height, radius;
  final Color? color;

  const TShimmerEffects({
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.isDarkMode ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: context.isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(color: color ?? context.darkgreyOrWhite, borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
