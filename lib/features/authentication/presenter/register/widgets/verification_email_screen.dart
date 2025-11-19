import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/constants/images_string.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../widgets/verification_screens/verification.dart';
import '../../../data/repository/auth_repository.dart';
import '../cubit/email_verification_cubit.dart';
import '../cubit/email_verification_state.dart';

class VerificationEmailScreen extends StatelessWidget {
  final String email;

  const VerificationEmailScreen({required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmailVerificationCubit(
        context.read<AuthenticationRepository>(),
      ),
      child: BlocConsumer<EmailVerificationCubit, EmailVerificationState>(
        listener: (context, state) {
          if (state is EmailVerificationVerified) {
            // Redirection après vérification
            //context.read<AuthenticationRepository>().screenRedirect();
          } else if (state is EmailVerificationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<EmailVerificationCubit>();

          return TVerificationScreen(
            onClosePressed: () => context.read<AuthenticationRepository>().logout(),
            image: TImages.onBoardingImage1,
            title: context.translate.confirmEmail,
            subtitle: context.translate.confirmEmailSubTitle,
            email: email,
            continueButtonTitle: context.translate.btnContinue,
            onContinuePressed: cubit.checkEmailVerified,
            onResetPressed: cubit.sendVerificationEmail,
          );
        },
      ),
    );
  }
}
