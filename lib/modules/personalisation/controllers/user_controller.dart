import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../utilities/popups/loaders.dart';
import '../../authentication/data/repository/user_repository.dart';
import '../../authentication/models/user/user.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

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
}
