import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/navigator.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/fields/primary.dart';
import '../../../../widgets/my_appbar/platform_back_button.dart';
import '../../../../widgets/text/my_rich_text.dart';
import '../../../../widgets/text/title_text.dart';
import '../../domain/entities/user_signup_request.dart';
import 'forgot_password.dart';
import 'gender_and_age.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTitle(context.translate.createAccount),
            DSizes.ms.sbh,
            TPrimaryTextField(
              controller: _firstNameCon,
              label: context.translate.firstname,
            ),
            DSizes.ms.sbh,
            TPrimaryTextField(
              controller: _lastNameCon,
              label: context.translate.lastname,
            ),
            DSizes.ms.sbh,
            TPrimaryTextField(
              controller: _emailCon,
              label: context.translate.enterEmail,
            ),
            DSizes.ms.sbh,
            TPrimaryTextField(
              controller: _passwordCon,
              label: context.translate.enterPassword,
            ),
            DSizes.ms.sbh,
            SizedBox(
              width: double.maxFinite,
              child: TPrimaryButton(
                title: context.translate.btnContinue,
                onPressed: () => AppNavigator.push(
                    context,
                    GenderAndAgePage(
                      userSignUpRequest: UserSignUpRequest(
                          firstName: _firstNameCon.text,
                          email: _emailCon.text,
                          lastName: _lastNameCon.text,
                          password: _passwordCon.text),
                    )),
              ),
            ),
            DSizes.ms.sbh,
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
      ),
    );
  }
}
