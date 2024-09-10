import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/icons/cart_counter.dart';

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
            style: context.textTheme.labelMedium?.copyWith(color: TColors.grey),
          ),
          Text(
            'User Name',
            style: context.textTheme.headlineSmall?.copyWith(color: Colors.white),
          ),
        ],
      ),
      actions: [TCartCounterIcon(onPressed: () {}, iconColor: Colors.white)],
    );
  }
}