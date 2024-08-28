import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/navigator.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/text/title.dart';
import '../../onboarding/domain/app_vectors.dart';
import 'sign_in.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(AppVectors.emailSending),
            TSizes.ms.sbh,
            TTitleText(
              textAlign: TextAlign.center,
              context.translate.resetPasswordMessage,
            ),
            TSizes.ms.sbh,
            TPrimaryButton(
              width: double.maxFinite,
              title: context.translate.btnReturnToLogin,
              onPressed: () => AppNavigator.push(context, SignInPage()),
            ),
          ],
        ).withPadding((h: 16, v: 10).symmetricPadding),
      ),
    );
  }
}
