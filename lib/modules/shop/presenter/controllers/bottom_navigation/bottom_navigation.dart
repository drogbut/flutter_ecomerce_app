import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../ui/home.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomePage(), Container(), Container(), Container()];
}
