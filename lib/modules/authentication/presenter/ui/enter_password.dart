import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:flutter_folders_structure/core/extensions/widget.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/ui/sign_up.dart';
import 'package:flutter_folders_structure/ui/my_appbar/platform_back_button.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../routing/navigator.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/fields/primary.dart';
import '../../../../ui/text/my_richt_text.dart';
import '../../../../ui/text/title_text.dart';

class EnterPasswordPage extends StatelessWidget {
  final TextEditingController _passwordCon = TextEditingController();

  EnterPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTitle(context.translate.signIn),
          MyStyles.mediumSpacingBetweenField.sbh,
          MyPrimaryTextField(
            controller: _passwordCon,
            hintText: context.translate.enterPassword,
          ),
          MyStyles.mediumSpacingBetweenField.sbh,
          MyPrimaryButton(
            width: double.maxFinite,
            title: context.translate.btnContinue,
            onPressed: () => AppNavigator.push(context, EnterPasswordPage()),
          ),
          MyStyles.mediumSpacingBetweenField.sbh,
          MyRichText(
            firstText: context.translate.forgotPassword,
            secondText: context.translate.reset,
            secondRecognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, SignupPage());
              },
          )
        ],
      ).withPadding((h: 16, v: 10).symmetricPadding),
    );
  }
}
