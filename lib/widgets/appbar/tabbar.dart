import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/context.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const TTabBar({
    required this.tabs,
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(TSizes.appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.blackOrWhite,
      child: TabBar(
        isScrollable: true,
        indicatorColor: TColors.primary,
        unselectedLabelColor: TColors.darkGrey,
        labelColor: context.whiteOrPrimary,
        tabs: tabs,
      ),
    );
  }
}
