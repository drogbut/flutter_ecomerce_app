import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/images_string.dart';
import '../../../utilities/helpers/network_manager.dart';
import '../../../utilities/popups/full_screen_loader.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  ///================ variables ========================================
  final firstName = TextEditingController();
  final lasttName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey registerFormKey = GlobalKey<FormState>();

  ///-- Signup
  Future<void> signup() async {
    /// Start loading
    TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.animalIcon);

    /// Check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      return;
    }

    /// Check form validation

    /// Check police privacy

    /// Register user in firebase auth & Save user data in firebase

    /// Save authentication user data in firebase

    /// Show success message
  }
}
