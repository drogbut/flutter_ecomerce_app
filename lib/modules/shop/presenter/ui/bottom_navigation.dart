import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/extensions/context.dart';
import '../controllers/bottom_navigation/bottom_navigation.dart';

class BottomNavigationMenu extends StatelessWidget {
  const BottomNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomNavigationController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: const Icon(Iconsax.home), label: context.translate.home),
            NavigationDestination(icon: const Icon(Iconsax.shop), label: context.translate.store),
            NavigationDestination(icon: const Icon(Iconsax.heart), label: context.translate.favorite),
            NavigationDestination(icon: const Icon(Iconsax.user), label: context.translate.profile),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}
