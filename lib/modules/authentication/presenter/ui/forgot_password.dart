import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_folders_structure/modules/authentication/domain/use_cases/reset_password.dart';
import 'package:flutter_folders_structure/modules/authentication/presenter/ui/reset_password.dart';
import 'package:flutter_folders_structure/routing/navigator.dart';

import '../../../../commons/providers/button/button_state_cubit.dart';
import '../../../../core/constants/my_styles.dart';
import '../../../../core/extensions/context.dart';
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
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.push(context, const ResetPasswordPage());
            }
          },
          child: Column(
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
              BlocBuilder<ButtonStateCubit, ButtonState>(
                builder: (context, state) {
                  return MyPrimaryButton(
                    width: double.maxFinite,
                    title: context.translate.btnContinue,
                    onPressed: () {
                      context.read<ButtonStateCubit>().execute(
                            usecase: ResetPasswordUseCase(),
                            params: _emailCon.text,
                          );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ).withPadding((h: 16, v: 10).symmetricPadding),
    );
  }
}
