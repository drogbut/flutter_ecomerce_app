import 'package:get/get.dart';

import '../authentication/personalisation/settings/settings.dart';
import 'favourite/favourite_page.dart';
import 'home/presenter/ui/home.dart';
import 'stores/product/product_screen.dart';

class BottomNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomePage(),
    const StoreProductScreen(),
    const WhishlistPage(),
    const SettingsPage(),
  ];
}
