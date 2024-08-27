import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';

class TSpacingStyle {
  ///Return custom EdgeInsets for default pages.
  static const paddingWithAppbarHeight = EdgeInsets.only(
    top: DSizes.appBarHeight,
    bottom: DSizes.defaultSpace,
    left: DSizes.defaultSpace,
    right: DSizes.defaultSpace,
  );
}
