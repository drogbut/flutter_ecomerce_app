import 'package:flutter/material.dart';
import 'package:flutter_folders_structure/core/extensions/context.dart';

import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../ui/buttons/primary.dart';
import '../../../../ui/fields/primary.dart';
import '../../../../ui/my_appbar/platform_back_button.dart';
import '../../../../ui/text/title_text.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();

  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTitle(context.translate.forgotPassword),
          MyStyles.mediumSpacingBetweenField.sbh,
          MyPrimaryTextField(
            controller: _emailCon,
            hintText: context.translate.enterEmail,
          ),
          MyStyles.mediumSpacingBetweenField.sbh,
          MyPrimaryButton(
            width: double.maxFinite,
            title: context.translate.btnContinue,
            onPressed: () {},
          ),
        ],
      ).withPadding((h: 16, v: 10).symmetricPadding),
    );
  }
}
