import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/extensions/color.dart';
import 'rounded_container.dart';

/// The header part of clipper
class THeaderContainer extends StatelessWidget {
  final Color? color;
  final double? height;
  final Widget child;

  const THeaderContainer({
    super.key,
    required this.color,
    required this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: SizedBox(
        height: height,
        child: Stack(
          children: [
            /// background custom shape
            Positioned(
                top: -150, right: -250, child: TRoundedContainer(backgroundColor: TColors.textWhite.withOpacityPercent(0.1))),
            Positioned(
                top: 100, right: -300, child: TRoundedContainer(backgroundColor: TColors.textWhite.withOpacityPercent(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
