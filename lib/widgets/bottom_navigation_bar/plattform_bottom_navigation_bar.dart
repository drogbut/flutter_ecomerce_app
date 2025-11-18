import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Create a bottom navigation bar depend on the platform.
class PfBottomNavigationBar extends StatelessWidget {
  /// Bottom navigation bar items.
  final List<BottomNavigationBarItem> destinations;

  /// Bottom navigation bar selected index.
  final int selectedIndex;

  /// Bottom navigation bar on destination selected.
  final Function(int index)? onDestinationSelected;

  /// Constructor.
  const PfBottomNavigationBar({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTabBar(
        onTap: onDestinationSelected,
        iconSize: 18,
        currentIndex: selectedIndex,
        items: destinations,
      );
    } else if (Platform.isAndroid) {
      return NavigationBar(
          selectedIndex: selectedIndex,
          onDestinationSelected: onDestinationSelected,
          destinations: _toNavigationDestinations(destinations));
    }

    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onDestinationSelected,
      items: destinations,
    );
  }

  List<NavigationDestination> _toNavigationDestinations(
    List<BottomNavigationBarItem> bottomNavigationBarItems,
  ) {
    List<NavigationDestination> navDestinations = <NavigationDestination>[];
    for (BottomNavigationBarItem nav in bottomNavigationBarItems) {
      navDestinations.add(
        NavigationDestination(
          icon: nav.icon,
          label: nav.label ?? '',
          tooltip: nav.tooltip,
          selectedIcon: nav.activeIcon,
        ),
      );
    }
    return navDestinations;
  }
}
