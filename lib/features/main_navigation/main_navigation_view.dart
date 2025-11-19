import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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

  static const int favoriteIndex = 2; // ordre défini par tes items
  static const int profileIndex = 3;

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
      BottomNavigationBarItem(icon: const Icon(Iconsax.home), label: context.translate.home),
      BottomNavigationBarItem(icon: const Icon(Iconsax.shop), label: context.translate.store),
      BottomNavigationBarItem(icon: const Icon(Iconsax.heart), label: context.translate.favorite),
      BottomNavigationBarItem(icon: const Icon(Iconsax.user), label: context.translate.profile),
    ];
  }
}
