import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../utilities/exceptions/firebase_auth_exceptions.dart';
import '../../../../../utilities/exceptions/firebase_exceptions.dart';
import '../../../../../utilities/exceptions/format_exceptions.dart';
import '../../../../../utilities/exceptions/platform_exceptions.dart';
import '../../presenter/onboarding/service/onboarding_prefs.dart';

class AuthenticationRepository {
  final _auth = FirebaseAuth.instance;

  /// Give the current firebase user.
  User? get authUser => _auth.currentUser;

  /// Check first launch with SharedPreferences
  Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    final isFirstTime = prefs.getBool(OnboardingPrefsKeys.isFirstTime) ?? true;

    if (isFirstTime) {
      await prefs.setBool(OnboardingPrefsKeys.isFirstTime, false);
    }
    return isFirstTime;
  }

  /// Firebase sign-in with email and password.
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

  /// Firebase Email register
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

  /// Reset password
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

  /// Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      // final userAccount = await GoogleSignIn().signIn();
      // final googleAuth = await userAccount?.authentication;
      //
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );
      //
      // return await _auth.signInWithCredential(credential);
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

  /// Email verification
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

  /// Logout
  Future<void> logout() async {
    try {
      //await GoogleSignIn().signOut();
      await _auth.signOut();
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

  /// Re-authentication
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
      // await UserRepository.instance.removeUserRecord(userId: _auth.currentUser!.uid);
      // await _auth.currentUser?.delete();
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
