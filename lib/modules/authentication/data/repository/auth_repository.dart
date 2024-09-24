import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../navigation_menu.dart';
import '../../../../utilities/exceptions/firebase_auth_exceptions.dart';
import '../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../utilities/exceptions/platform_exceptions.dart';
import '../../screens/login/login.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/register/widgets/verification_email_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///================ Variables ===========================================
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    /// Remove the splash screen
    FlutterNativeSplash.remove();

    /// Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to show the relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;

    /// Check if the user doesn't exit
    if (user != null) {
      /// If User exist, check if he is verified
      if (user.emailVerified) {
        /// Navigate to home screen
        Get.offAll(() => const TNavigationMenu());
      } else {
        /// Navigate to verified email screen
        Get.offAll(() => VerificationEmailScreen(email: _auth.currentUser?.email ?? ''));
      }
    } else {
      /// Local storage
      deviceStorage.writeIfNull('IsFirsttime', true);

      /// Check if it's the first time to launch the app
      deviceStorage.read('IsFirsttime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /// [FirebaseAuthentication] - Sign-in

  /// [FirebaseAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }

  /// [FirebaseAuthentication] - Email verification
  Future<void> sendEmailVerification({required}) async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }

  /// [LogoutUser] - valid for any authentication.
  Future<void> logout({required}) async {
    try {
      await _auth.signOut();

      /// Redirect to login screen
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went Wrong. Please try again';
    }
  }
}
