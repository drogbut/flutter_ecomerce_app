import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/buttons/secondary.dart';
import '../../../authentication/data/models/user/user.dart';
import '../../data/repository/user_repository.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  // ignore: unused_field
  final UserRepository _userRepository;
  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController verifyPassword = TextEditingController();
  final GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  UserCubit(this._userRepository) : super(UserState(userModel: UserModel.empty())) {
    fetchUserDetails();
  }

  /// Fetch user record
  Future<void> fetchUserDetails() async {
    try {
      emit(state.copyWith(isProfileLoaded: true));
      // final user = await _userRepository.fetchUserDetails();
      // userModel(user);
    } catch (e) {
      //userModel(User.empty());
    } finally {
      emit(state.copyWith(isProfileLoaded: false));
    }
  }

  /// Save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? credential) async {
    try {
      // if (credential != null) {
      //   // Convert name to first and last name
      //   final userName = User.namePart(credential.user!.displayName ?? '');
      //
      //   // Map data
      //   final userModel = User(
      //     id: credential.user!.uid,
      //     firstName: userName[0],
      //     lastName: userName.length > 1 ? userName.sublist(1).join(' ') : '',
      //     userName: userName.toString(),
      //     email: credential.user!.email ?? '',
      //     phoneNumber: credential.user!.phoneNumber ?? '',
      //     profilePicture: credential.user!.photoURL ?? '',
      //   );
      //
      //   // save user data
      //
      //   await _userRepository.saveUserRecord(user: userModel);
      // }
    } catch (e) {
      /// Show generic error - will be handled by BlocListener in widget
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// Toggle password visibility
  void toggleHidePassword() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  /// Delete user Account warning
  Future<void> deleteAccountWarningPopup(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) => AlertDialog(
        contentPadding: EdgeInsets.all(TSizes.md.toDouble()),
        title: const Text('Delete Account'),
        content: const Text(
          "Are you sure to want to delete your account permanently? This action isn't reversible and all your data will be removed permanently.",
        ),
        actions: [
          TPrimaryButton(
            backgroundColor: Colors.red,
            side: const BorderSide(color: Colors.red),
            title: 'Delete',
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              await deleteAccount();
            },
          ),
          TSecondaryButton(
            title: 'cancel',
            onPressed: () => Navigator.of(dialogContext).pop(),
          ),
        ],
      ),
    );
  }

  /// Delete user Account
  Future<void> deleteAccount() async {
    try {
      // /// Start loading
      // //TFullScreenLoader.openLoadingDialog('Login you in...', TImages.verifyIllustration);
      //
      // final authUserId = _authRepository.authUser!.providerData
      //     .map((userinfo) => userinfo.providerId)
      //     .first;
      // if (authUserId.isNotEmpty) {
      //   // re-verify authentication
      //   if (authUserId == 'google.com') {
      //     await _authRepository.signInWithGoogle();
      //     await _authRepository.deleteAccount();
      //     TFullScreenLoader.stopLoading();
      //   } else if (authUserId == 'password') {
      //     TFullScreenLoader.stopLoading();
      //     // Navigate to re-authenticate screen
      //   }
      // }
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// Re-Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // /// Start loading
      // //TFullScreenLoader.openLoadingDialog('Login you in...', TImages.verifyIllustration);
      //
      // /// Check internet connectivity
      // final isConnected = await NetworkManager.instance.isConnected();
      // if (!isConnected) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }
      //
      // /// Form validation
      // if (!reAuthFormKey.currentState!.validate()) {
      //   TLoaders.errorSnackbar(
      //       title: 'Error', message: 'Please fill in all required fields');
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }
      //
      // /// Login user using email and password
      // await _authRepository.reAuthenticateEmailAndPasswordUser(
      //   email: verifyEmail.text.trim(),
      //   password: verifyPassword.text.trim(),
      // );
      //
      // /// Delete account
      // _authRepository.deleteAccount();
      //
      // /// Remove loader
      // TFullScreenLoader.stopLoading();
      //
      // /// Redirect
      // Navigate to login screen
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  /// Store & Download user image from firebase storage
  Future<void> uploadUserprofileImage() async {
    try {
      emit(state.copyWith(isProfileLoaded: true));
      // // Pick the image from device
      // final deviceImage = await ImagePicker().pickImage(
      //     source: ImageSource.gallery,
      //     maxHeight: 512,
      //     maxWidth: 512,
      //     imageQuality: 70);
      //
      // // store & Download in firebase storage
      // if (deviceImage != null) {
      //   final imageUrl = await _userRepository.uploadImage(
      //       path: 'Users/Images/Profile/', deviceSelectedImage: deviceImage);
      //
      //   // Update user record image
      //   Map<String, dynamic> json = {'profilePicture': imageUrl};
      //   await _userRepository.updateSingleField(json: json);
      //
      //   // Success message
      //   TLoaders.successSnackbar(
      //       title: 'Congratulations',
      //       message: 'your profile image has been updated !');
      // }
    } catch (e) {
      emit(state.copyWith(
        isProfileLoaded: false,
        errorMessage: e.toString(),
      ));
    } finally {
      emit(state.copyWith(isProfileLoaded: false));
    }
  }

  @override
  Future<void> close() {
    verifyEmail.dispose();
    verifyPassword.dispose();
    return super.close();
  }
}

