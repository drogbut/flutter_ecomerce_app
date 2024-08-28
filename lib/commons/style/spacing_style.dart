import 'package:flutter/material.dart';

import '../../core/constants/sizes.dart';

class TSpacingStyle {
  ///Return custom EdgeInsets for default pages.
  static const paddingWithAppbarHeight = EdgeInsets.only(
    top: TSizes.appBarHeight,
    bottom: TSizes.defaultSpace,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
  );
}
