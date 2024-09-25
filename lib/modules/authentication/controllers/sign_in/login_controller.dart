import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../utilities/helpers/network_manager.dart';
import '../../../../utilities/popups/full_screen_loader.dart';
import '../../../../utilities/popups/loaders.dart';
import '../../data/repository/auth_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final authRepository = AuthenticationRepository.instance;

  ///================ variables ========================================
  RxBool rememberMe = false.obs;
  RxBool hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('REMENBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMENBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  ///================ methods ========================================
  Future<void> signInWithEmailAndPassword() async {
    try {
      /// Start loading
      //TFullScreenLoader.openLoadingDialog('Login you in...', TImages.verifyIllustration);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Form validation
      if (!loginFormKey.currentState!.validate()) {
        /// Show an error message if the form is invalid
        TLoaders.errorSnackbar(title: 'Error', message: 'Please fill in all required fields');
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Save data if RememberMe is selected
      if (rememberMe.value) {
        localStorage.write('REMENBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMENBER_ME_PASSWORD', password.text.trim());
      }

      /// Login user using email and password
      await authRepository.loginWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      /// Remove loader
      //TFullScreenLoader.stopLoading();

      /// Redirect
      authRepository.screenRedirect();
    } catch (e) {
      /// Show generic error
      TLoaders.errorSnackbar(title: 'Register error', message: e.toString());
    }
  }
}
