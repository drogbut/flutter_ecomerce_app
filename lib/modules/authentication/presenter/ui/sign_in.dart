import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';
import 'package:flutter_folders_structure/core/extensions/widget.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/ui/enter_password.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/ui/sign_up.dart';
import 'package:flutter_folders_structure/ui/buttons/primary.dart';
import 'package:flutter_folders_structure/ui/fields/primary.dart';
import 'package:flutter_folders_structure/ui/text/my_richt_text.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../routing/navigator.dart';
import '../../../../ui/my_appbar/plattform_back_button.dart';
import '../../../../ui/text/title_text.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTitle(context.translate.signIn),
          MyStyles.spacingBetweenTextField.sbh,
          MyPrimaryTextField(
            controller: _emailCon,
            hintText: context.translate.enterEmail,
          ),
          MyStyles.spacingBetweenTextField.sbh,
          SizedBox(
            width: double.maxFinite,
            child: MyPrimaryButton(
              title: context.translate.btnContinue,
              onPressed: () => AppNavigator.push(context, EnterPasswordPage()),
            ),
          ),
          MyStyles.spacingBetweenTextField.sbh,
          MyRichText(
            firstText: context.translate.doYouHaveAnAccount,
            secondText: context.translate.createOne,
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
