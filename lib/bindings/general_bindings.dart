import 'package:get/get.dart';

import '../utilities/helpers/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NetworkManager(), fenix: true);
  }
}
