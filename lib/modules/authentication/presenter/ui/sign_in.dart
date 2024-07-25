import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/navigator.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/fields/primary.dart';
import '../../../../ui/my_appbar/platform_back_button.dart';
import '../../../../ui/text/my_rich_text.dart';
import '../../../../ui/text/title_text.dart';
import 'enter_password.dart';
import 'sign_up.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTitle(context.translate.signIn),
            MyStyles.mediumSpacingBetweenField.sbh,
            MyPrimaryTextField(
              controller: _emailCon,
              hintText: context.translate.enterEmail,
            ),
            MyStyles.mediumSpacingBetweenField.sbh,
            SizedBox(
              width: double.maxFinite,
              child: MyPrimaryButton(
                title: context.translate.btnContinue,
                onPressed: () => AppNavigator.push(context, EnterPasswordPage()),
              ),
            ),
            MyStyles.mediumSpacingBetweenField.sbh,
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
      ),
    );
  }
}
