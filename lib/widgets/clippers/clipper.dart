import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'footer.dart';
import 'header.dart';

/// The custom clipper design screen
class TClipperWidget extends StatelessWidget {
  final Color? color;
  final double? height;
  final Widget child;

  const TClipperWidget({
    required this.child,
    this.color = DColors.primary,
    this.height = 400,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TFooterContainer(),
      child: THeaderContainer(color: color, height: height, child: child),
    );
  }
}
