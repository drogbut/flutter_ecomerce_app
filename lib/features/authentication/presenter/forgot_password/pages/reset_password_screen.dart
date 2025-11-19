import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../l10n/text_strings.dart';
import '../../../../../widgets/verification_screens/verification.dart';
import '../../login/pages/login_screen.dart';
import '../cubit/forgot_password_cubit.dart';
import '../cubit/forgot_password_state.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String email;
  const ResetPasswordScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgetPasswordCubit(context.read()),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();

          return TVerificationScreen(
            onClosePressed: () => Navigator.of(context).pop(),
            image: TImages.deliveredEmailIllustration,
            title: TTexts.changeYourPasswordTitle,
            email: email,
            subtitle: TTexts.changeYourPasswordSubTitle,
            continueButtonTitle: 'Continue',
            onContinuePressed: () => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const LoginScreen()),
              (route) => false,
            ),
            onResetPressed: () => cubit.resendPassword(context, email: email),
          );
        },
      ),
    );
  }
}
