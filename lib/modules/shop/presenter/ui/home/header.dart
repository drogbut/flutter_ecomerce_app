import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/icons/cart_counter.dart';
import '../shopping_cart/shopping_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.translate.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey),
          ),
          Text(
            'User Name',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          iconColor: Colors.white,
          onPressed: () => Get.to(() => const TShoppingCart()),
        )
      ],
    );
  }
}
