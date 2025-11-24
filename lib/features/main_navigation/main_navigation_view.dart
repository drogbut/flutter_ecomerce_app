import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/images_string.dart';
import '../../core/extensions/context.dart';
import '../../widgets/bottom_navigation_bar/plattform_bottom_navigation_bar.dart';

class MainNavigationView extends StatelessWidget {
  final StatefulNavigationShell navigationShel;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const MainNavigationView({
    super.key,
    required this.navigationShel,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return PfBottomNavigationBar(
      destinations: _buildNavigationItems(context),
      selectedIndex: navigationShel.currentIndex,
      onDestinationSelected: onTap,
    );
  }

  List<BottomNavigationBarItem> _buildNavigationItems(BuildContext context) {
    return [
      BottomNavigationBarItem(icon: SvgPicture.asset(TImages.homeIcon, height: 24), label: context.translate.home),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: context.translate.favorite),
      BottomNavigationBarItem(icon: const Icon(CupertinoIcons.search), label: context.translate.search),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: context.translate.profile),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), label: context.translate.shoppingCart),
    ];
  }
}
