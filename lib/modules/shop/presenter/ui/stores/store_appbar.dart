import 'package:flutter/material.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/icons/cart_counter.dart';
import '../../../../../widgets/texts/title.dart';

class StoreAppBar extends StatelessWidget {
  const StoreAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: TTitleText(context.translate.store),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
        ).withPadding(TSizes.defaultSpace.rightPadding),
      ],
    );
  }
}
