import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/images_string.dart';
import '../../../utilities/helpers/network_manager.dart';
import '../../../utilities/popups/full_screen_loader.dart';
import '../../../utilities/popups/loaders.dart';
import '../data/repository/auth_repository.dart';
import '../data/repository/user_repository.dart';
import '../models/user/user.dart';
import '../screens/widgets/verification.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final authRepository = AuthenticationRepository.instance;

  ///================ variables ========================================
  RxBool hidePassword = true.obs;
  RxBool privacyPolicy = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  ///====================== Signup =====================================
  Future<void> signup() async {
    try {
      /// Start loading
      TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.animalIcon);

      /// Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      /// Check privacy policy --> make it before form validation check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackbar(
            title: 'Accept pravicy policy',
            message:
                'in order to create account, you must you must to read and accept the privacy policy and terms of conditions.');
        return;
      }

      /// Check form validation
      if (!registerFormKey.currentState!.validate()) return;

      /// Register user in firebase auth & Save user data in firebase
      final userCredential = await authRepository.registerWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );

      /// Save authentication user data in firebase
      final userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phoneNumber: phone.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserrecord(user: userModel);

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Show success message
      TLoaders.successSnackbar(
          title: 'Congratulations', message: 'your account has been created! Verify email to continue.');

      /// Move to verify email screen
      Get.to(() => VerificationScreen(
            image: TImages.onBoardingImage1,
            title: 'Verify your Emial Adress!',
            subtitle: 'subititle',
            email: email.text,
            continueButtonTitle: 'continue',
          ));
    } catch (e) {
      /// show some generics erros for the user
      TLoaders.errorSnackbar(title: 'Register error', message: e.toString());
    } finally {
      /// Remove loader
      TLoaders.stopLoading();
    }
  }
}
