import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../core/constants/images_string.dart';
import '../../../../utilities/popups/loaders.dart';
import '../../../../widgets/verification_screens/verification.dart';
import '../../data/repository/auth_repository.dart';

class EmailVerificationController extends GetxController {
  static EmailVerificationController get instance => Get.find();
  final authRepository = AuthenticationRepository.instance;
  late Timer _emailVerificationTimer;

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// Email verification link
  Future<void> sendEmailVerification() async {
    try {
      /// Call repository method
      await authRepository.sendEmailVerification();

      /// Success message
      TLoaders.successSnackbar(title: 'Email send', message: 'Please check your inbox and verify your email');
    } catch (e) {
      /// Show generic error
      TLoaders.errorSnackbar(title: 'Ohh error', message: e.toString());
    }
  }

  /// Timer to automatically redirect on email verification
  void setTimerForAutoRedirect() {
    _emailVerificationTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      /// reload the current user
      await FirebaseAuth.instance.currentUser?.reload();

      /// Check if the users email address has been verified.
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        /// If verified, stop the timer
        timer.cancel();

        /// Navigate to the success screen
        Get.off(() => TVerificationScreen(
              image: TImages.staticSuccessIllustration,
              title: 'title text',
              subtitle: 'sub title text',
              continueButtonTitle: 'Continue',
              email: user?.email ?? '',
              onContinuePressed: () => authRepository.screenRedirect(),
            ));
      }
    });
  }

  /// Manually check if email is verified
  Future<void> checkEmailVerifiedStatus() async {
    ///
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      /// Show the success screen
      Get.off(
        () => TVerificationScreen(
          image: TImages.staticSuccessIllustration,
          title: 'title text',
          subtitle: 'sub title text',
          continueButtonTitle: 'Continue',
          onContinuePressed: () => authRepository.screenRedirect(),
        ),
      );
    }
  }

  @override
  void onClose() {
    _emailVerificationTimer.cancel();
    super.onClose();
  }
}
