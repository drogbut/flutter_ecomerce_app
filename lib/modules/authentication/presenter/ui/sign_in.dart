import 'package:flutter/gestures.dart';
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
import '../../../../widgets/text/my_rich_text.dart';
import '../../../../widgets/text/title_text.dart';
import '../../../home_page/presenter/ui/home.dart';
import '../../domain/entities/user_sign_in_request.dart';
import '../../domain/use_cases/sign_in.dart';
import 'sign_up.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackBar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonSuccessState) {
              AppNavigator.pushReplacement(context, const HomePage());
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyTitle(context.translate.signIn),
              DSizes.ms.sbh,
              MyPrimaryTextField(
                controller: _emailCon,
                hintText: context.translate.enterEmail,
              ),
              DSizes.ms.sbh,
              MyPrimaryTextField(
                controller: _passwordCon,
                hintText: context.translate.enterPassword,
              ),
              DSizes.ms.sbh,
              SizedBox(
                width: double.maxFinite,
                child: BlocBuilder<ButtonStateCubit, ButtonState>(
                  builder: (context, state) {
                    return MyPrimaryButton(
                      title: context.translate.btnContinue,
                      onPressed: () {
                        var userSignInRequest = UserSignInRequest(
                          email: _emailCon.text,
                          password: _passwordCon.text,
                        );
                        context.read<ButtonStateCubit>().execute(
                              usecase: SignInUseCase(),
                              params: userSignInRequest,
                            );
                      },
                    );
                  },
                ),
              ),
              DSizes.ms.sbh,
              MyRichText(
                firstText: context.translate.doYouHaveAnAccount,
                secondText: context.translate.createOne,
                secondRecognizer: TapGestureRecognizer()
                  ..onTap = () {
                    AppNavigator.push(context, SignupPage());
                  },
              )
            ],
          ),
        ),
      ).withPadding((h: 16, v: 10).symmetricPadding),
    );
  }
}
