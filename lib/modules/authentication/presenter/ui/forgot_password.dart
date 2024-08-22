import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commons/providers/button/button_state_cubit.dart';
import '../../../../core/constants/sizes.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../routing/navigator.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/fields/primary.dart';
import '../../../../widgets/my_appbar/platform_back_button.dart';
import '../../../../widgets/text/title_text.dart';
import '../../domain/use_cases/reset_password.dart';
import 'reset_password.dart';

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
              DSizes.ms.sbh,
              MyPrimaryTextField(
                controller: _emailCon,
                hintText: context.translate.enterEmail,
              ),
              DSizes.ms.sbh,
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
