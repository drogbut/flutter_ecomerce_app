import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/images_string.dart';
import '../../../../l10n/text_strings.dart';
import '../../../../widgets/verification_screens/verification.dart';
import '../../controllers/forget_password/forget_password_controller.dart';
import '../login/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  const ResetPasswordScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return TVerificationScreen(
      onClosePressed: () => Get.back(),
      image: TImages.deliveredEmailIllustration,
      title: TTexts.changeYourPasswordTitle,
      email: email,
      subtitle: TTexts.changeYourPasswordSubTitle,
      continueButtonTitle: 'continue',
      onContinuePressed: () => Get.offAll(() => const LoginScreen()),
      onResetPressed: () => ForgetPasswordController.instance.resentPassword(email: email),
    );
  }
}
