import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/colors.dart';
import '../../../core/extensions/context.dart';
import '../../../widgets/appbar/appbar.dart';
import '../../../widgets/icons/cart_counter.dart';
import '../../../widgets/loaders/shimmer_effects.dart';
import '../../authentication/personalisation/controllers/user_controller.dart';
import '../shopping_cart/shopping_card.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.translate.homeAppBarTitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: TColors.grey),
          ),
          Obx(
            () {
              if (controller.isProfileLoaded.value) {
                const TShimmerEffects(width: 80, height: 15);
              }
              return Text(
                controller.userModel.value.fullName,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
              );
            },
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
