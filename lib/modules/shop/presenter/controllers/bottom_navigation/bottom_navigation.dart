import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/favourite/favourite_page.dart';
import '../../ui/home/home.dart';
import '../../ui/stores/store_page.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomePage(), const StorePage(), const WhishlistPage(), Container()];
}
