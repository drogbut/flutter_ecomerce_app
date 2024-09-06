import 'package:get/get.dart';

class TCarouselController extends GetxController {
  static TCarouselController get instance => Get.find();

  /// variables
  Rx<int> currentPageIndex = 0.obs;

  /// update current index when the page change
  void updatePageIndicator(index) => currentPageIndex.value = index;
}
