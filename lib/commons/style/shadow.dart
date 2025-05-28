import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/extensions/color.dart';


class TShadowStyle {
  /// Vertical
  static final verticalProductShadow = BoxShadow(
    color: TColors.darkGrey.withOpacityPercent(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2),
  );

  /// Horizontal
  static final horizontalDragGestureRecognizer = BoxShadow(
    color: TColors.darkGrey.withOpacityPercent(0.1),
    spreadRadius: 7,
    blurRadius: 50,
    offset: const Offset(0, 2),
  );
}
