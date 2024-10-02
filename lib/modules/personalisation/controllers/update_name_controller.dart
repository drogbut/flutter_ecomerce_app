import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utilities/helpers/network_manager.dart';
import '../../../utilities/popups/full_screen_loader.dart';
import '../../../utilities/popups/loaders.dart';
import '../../authentication/data/repository/user_repository.dart';
import '../../authentication/models/user/user.dart';
import '../screens/profile/profile.dart';
import 'user_controller.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  final userController = UserController.instance;

  ///================ Variables ===========================================
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateNameFormKey = GlobalKey<FormState>();

  ///================ GETTERS ===========================================
  UserModel get userModelValue => userController.userModel.value;

  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  /// Fetch user data record
  Future<void> initializeNames() async {
    firstName.text = userModelValue.firstName;
    lastName.text = userModelValue.firstName;
  }

  /// update the user name
  Future<void> updateUserName() async {
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
      if (!updateNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Update first & last name in the Firebase
      Map<String, dynamic> name = {'firstName': firstName.text.trim(), 'lastName': firstName.text.trim()};
      await userRepository.updateSingleField(json: name);

      /// Update the Rx user value using copyWith
      userController.userModel.value = userModelValue.copyWith(
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
      );

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Show success message
      TLoaders.successSnackbar(title: 'Congratulations', message: 'Your name has been updated.');

      /// Move to previous screen
      Get.off(() => const TProfilePage());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'Register error', message: e.toString());
    }
  }
}
