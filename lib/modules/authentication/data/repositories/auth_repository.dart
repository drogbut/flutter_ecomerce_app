import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../navigation_menu.dart';
import '../../../../utilities/exceptions/firebase_auth_exceptions.dart';
import '../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../utilities/exceptions/platform_exceptions.dart';
import '../../../app_settings/data/repository/user_repository.dart';
import '../../presenter/login/pages/login_screen.dart';
import '../../presenter/onboarding/pages/onboarding_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///================ Variables ===========================================
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///================ GETTERS =============================================
  User? get authUser => _auth.currentUser;

  /// Called from main.dart on app launch
  @override
  void onReady() {
    /// Remove the splash screen
    FlutterNativeSplash.remove();

    /// Redirect to the appropriate screen
    screenRedirect();
  }

  /// ================= Function to show the relevant screen ===================
  void screenRedirect() async {
    final user = _auth.currentUser;

    // Check if the user doesn't exit
    if (user != null) {
      Get.offAll(() => const TNavigationMenu());

      // =====> REMOVE VERIFIED E-MAIL AT THE MOMENT
      // // If User exist, check if he is verified
      // if (user.emailVerified) {
      //   // Navigate to home screen
      //   Get.offAll(() => const TNavigationMenu());
      // }
      // else {
      //   // Navigate to verified email screen
      //   Get.offAll(() =>
      //       VerificationEmailScreen(email: _auth.currentUser?.email ?? ''));
      // }
    } else {
      // Local storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // Check if it's the first time to launch the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /// ============ [FirebaseAuthentication] - Sign-in ========================
  Future<UserCredential> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
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

  /// ============ [FirebaseAuthentication] - Register =======================
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

  /// ============ [FirebaseAuthentication] - Forget password =======================
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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

  /// ============ [FirebaseAuthentication] - GOOGLE =======================
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // obtain the auth detail from the request
      GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // create a new google credential
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //Once signed in, return credential
      return _auth.signInWithCredential(credential);
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

  /// ============= [FirebaseAuthentication] - Email verification ==========
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

  /// ============= [LogoutUser] - valid for any authentication ===========
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
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

  /// ============ [Re-Authentication] - Sign-in ========================
  Future<void> reAuthenticateEmailAndPasswordUser({required String email, required String password}) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // Re-authenticate
      await _auth.currentUser?.reauthenticateWithCredential(credential);
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

  /// ============= DeleteAccount ==========================================
  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(userId: _auth.currentUser!.uid);
      await _auth.currentUser?.delete();
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
