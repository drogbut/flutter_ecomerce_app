import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../widgets/verification_screens/verification.dart';
import '../controllers/email_verification_controller.dart';

class VerificationEmailScreen extends StatelessWidget {
  final String email;

  const VerificationEmailScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EmailVerificationController());

    return TVerificationScreen(
      onClosePressed: () => controller.authRepository.logout(),
      image: TImages.onBoardingImage1,
      title: context.translate.confirmEmail,
      subtitle: context.translate.confirmEmailSubTitle,
      email: email,
      continueButtonTitle: context.translate.btnContinue,
      onContinuePressed: () => controller.checkEmailVerifiedStatus(),
      onResetPressed: () => controller.sendEmailVerification(),
    );
  }
}
