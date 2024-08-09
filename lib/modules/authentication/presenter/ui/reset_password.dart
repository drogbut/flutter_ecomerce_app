import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/navigator.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/text/title_text.dart';
import '../../../splash/domain/app_vectors.dart';
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
            MyStyles.mediumSpacingBetweenField.sbh,
            MyTitle(
              textAlign: TextAlign.center,
              context.translate.resetPasswordMessage,
            ),
            MyStyles.mediumSpacingBetweenField.sbh,
            MyPrimaryButton(
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
