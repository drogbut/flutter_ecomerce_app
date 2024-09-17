import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../containers/rounded_container.dart';

/// The header part of clipper
class THeaderContainer extends StatelessWidget {
  final Color? color;
  final Widget child;

  const THeaderContainer({
    super.key,
    this.color = TColors.primary,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Stack(
        children: [
          /// background custom shape
          Positioned(
              top: -150, right: -250, child: TRoundedContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
          Positioned(
              top: 100, right: -300, child: TRoundedContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
          Column(
            children: [
              child,
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ],
      ),
    );
  }
}
