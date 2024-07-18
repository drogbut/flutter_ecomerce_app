import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/navigator.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/fields/primary.dart';
import '../../../../ui/my_appbar/plattform_back_button.dart';
import '../../../../ui/text/my_richt_text.dart';
import '../../../../ui/text/title_text.dart';
import 'enter_password.dart';
import 'forgot_password.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstNameCon = TextEditingController();
  final TextEditingController _lastNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTitle(context.translate.createAccount),
          MyStyles.spacingBetweenTextField.sbh,
          MyPrimaryTextField(
            controller: _firstNameCon,
            hintText: context.translate.firstname,
          ),
          MyStyles.spacingBetweenTextField.sbh,
          MyPrimaryTextField(
            controller: _lastNameCon,
            hintText: context.translate.lastname,
          ),
          MyStyles.spacingBetweenTextField.sbh,
          MyPrimaryTextField(
            controller: _emailCon,
            hintText: context.translate.enterEmail,
          ),
          MyStyles.spacingBetweenTextField.sbh,
          MyPrimaryTextField(
            controller: _passwordCon,
            hintText: context.translate.enterPassword,
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
            firstText: '${context.translate.forgotPassword}?',
            secondText: context.translate.reset,
            secondRecognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.push(context, ForgotPasswordPage());
              },
          )
        ],
      ).withPadding((h: 16, v: 10).symmetricPadding),
    );
  }
}
