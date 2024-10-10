import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/sizes.dart';
import '../../../core/extensions/widget.dart';
import '../../../utilities/helpers/network_manager.dart';
import '../../../utilities/popups/full_screen_loader.dart';
import '../../../utilities/popups/loaders.dart';
import '../../../widgets/buttons/primary.dart';
import '../../../widgets/buttons/secondary.dart';
import '../../authentication/data/repository/auth_repository.dart';
import '../../authentication/data/repository/user_repository.dart';
import '../../authentication/models/user/user.dart';
import '../../authentication/screens/login/login.dart';
import '../screens/profile/widgets/re_auth_user_login.dart';

class UserController extends GetxController {
  /// controller needs instance & repositories
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  final _authRepository = AuthenticationRepository.instance;

  ///================ Variables ===========================================
  Rx<UserModel> userModel = UserModel.empty().obs;
  Rx<bool> isProfileLoaded = false.obs;
  RxBool hidePassword = true.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  late File _profileImage;
  late ImagePicker _picker;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  /// Fetch user record
  Future<void> fetchUserDetails() async {
    try {
      isProfileLoaded.value = true;
      final user = await userRepository.fetchUserDetails();
      userModel(user);
    } catch (e) {
      userModel(UserModel.empty());
    } finally {
      isProfileLoaded.value = false;
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? credential) async {
    try {
      if (credential != null) {
        // Convert name to first and last name
        final userName = UserModel.namePart(credential.user!.displayName ?? '');

        // Map data
        final userModel = UserModel(
          id: credential.user!.uid,
          firstName: userName[0],
          lastName: userName.length > 1 ? userName.sublist(1).join(' ') : '',
          userName: userName.toString(),
          email: credential.user!.email ?? '',
          phoneNumber: credential.user!.phoneNumber ?? '',
          profilePicture: credential.user!.photoURL ?? '',
        );

        // save user data

        await userRepository.saveUserRecord(user: userModel);
      }
    } catch (e) {
      /// Show generic error
      TLoaders.errorSnackbar(title: 'Data not save', message: e.toString());
    }
  }

  /// Delete user Account warning
  Future<void> deleteAccountWarningPopup() async {
    Get.defaultDialog(
      contentPadding: TSizes.md.allPadding,
      title: 'Delete Account',
      middleText:
          "Are you sure to want to delete your account permanently? This action isn't reversible and all your data will be removed permanently.",
      confirm: TPrimaryButton(
        backgroundColor: Colors.red,
        side: const BorderSide(color: Colors.red),
        title: 'Delete',
        onPressed: () async => deleteAccount(),
      ),
      cancel: TSecondaryButton(
        title: 'cancel',
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  /// Delete user Account
  Future<void> deleteAccount() async {
    try {
      /// Start loading
      //TFullScreenLoader.openLoadingDialog('Login you in...', TImages.verifyIllustration);

      final authUserId = _authRepository.authUser!.providerData.map((userinfo) => userinfo.providerId).first;
      if (authUserId.isNotEmpty) {
        // re-verify authentication
        if (authUserId == 'google.com') {
          await _authRepository.signInWithGoogle();
          await _authRepository.deleteAccount();
          TFullScreenLoader.stopLoading();
        } else if (authUserId == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUserLogin());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'Oh! snap', message: e.toString());
    }
  }

  /// Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
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
      if (!reAuthFormKey.currentState!.validate()) {
        TLoaders.errorSnackbar(title: 'Error', message: 'Please fill in all required fields');
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Login user using email and password
      await _authRepository.reAuthenticateEmailAndPasswordUser(
        email: verifyEmail.text.trim(),
        password: verifyPassword.text.trim(),
      );

      /// Delete account
      _authRepository.deleteAccount();

      /// Remove loader
      TFullScreenLoader.stopLoading();

      /// Redirect
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackbar(title: 'Oh! snap', message: e.toString());
    }
  }

  /// Store & Download user image from firebase storage
  Future<void> uploadUserprofileImage() async {
    try {
      // Start of upload
      isProfileLoaded.value = true;

      // Pick the image from device
      final deviceImage =
          await ImagePicker().pickImage(source: ImageSource.gallery, maxHeight: 512, maxWidth: 512, imageQuality: 70);

      // store & Download in firebase storage
      if (deviceImage != null) {
        final imageUrl =
            await userRepository.uploadImage(path: 'Users/Images/Profile/', deviceSelectedImage: deviceImage);

        // Update user record image
        Map<String, dynamic> json = {'profilePicture': imageUrl};
        await userRepository.updateSingleField(json: json);

        // Update the observable `userModel` with the new data
        userModel.value = userModel.value.copyWith(profilePicture: imageUrl);

        // Success message
        TLoaders.successSnackbar(title: 'Congratulations', message: 'your profile image has been updated !');
      }
    } catch (e) {
      TLoaders.errorSnackbar(title: 'Oh! snap', message: e.toString());
    } finally {
      // End of upload
      isProfileLoaded.value = false;
    }
  }
}
