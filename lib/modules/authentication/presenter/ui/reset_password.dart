import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/ui/sign_in.dart';
import 'package:flutter_folders_structure/modules/splash/domain/app_vectors.dart';
import 'package:flutter_folders_structure/routing/navigator.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/text/title_text.dart';

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
