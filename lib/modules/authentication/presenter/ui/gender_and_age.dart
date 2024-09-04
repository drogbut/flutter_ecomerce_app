import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../commons/providers/button/button_state_cubit.dart';
import '../../../../core/extensions/context.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/buttons/primary.dart';
import '../../../../widgets/indicators/loading_indicator.dart';
import '../../../../widgets/text/title.dart';
import '../../domain/entities/user_signup_request.dart';
import '../../domain/use_cases/signup.dart';
import '../controllers/gender_and_age_provider/age_selection_cubit.dart';
import '../controllers/gender_and_age_provider/display_age_cubit.dart';
import '../controllers/gender_and_age_provider/gender_selection_cubit.dart';
import 'widgets/age_range_button.dart';
import 'widgets/gender_container.dart';

class GenderAndAgePage extends StatelessWidget {
  final UserSignUpRequest userSignUpRequest;

  const GenderAndAgePage({required this.userSignUpRequest, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
          BlocProvider(create: (context) => ButtonStateCubit())
        ],
        child: BlocListener<ButtonStateCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonFailureState) {
              var snackbar = SnackBar(content: Text(state.errorMessage), behavior: SnackBarBehavior.floating);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
            if (state is ButtonSuccessState) {
              var snackbar = SnackBar(content: Text(state.successMessage), behavior: SnackBarBehavior.floating);
              ScaffoldMessenger.of(context).showSnackBar(snackbar);
            }
          },
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TTitleText(context.translate.tellUsAboutYouSelf).withPadding(40.bottomPadding),
                    Text(context.translate.whoDoYouShopFor).withPadding(10.bottomPadding),
                    const GenderContainer().withPadding(40.bottomPadding),
                    Text(context.translate.howOldAreYou).withPadding(10.bottomPadding),
                    const AgeRangeButton(),
                  ],
                ).withPadding(16.allPadding),
              ),
              ColoredBox(
                color: context.colorScheme.primaryContainer.withOpacity(0.2),
                child: BlocBuilder<ButtonStateCubit, ButtonState>(
                  builder: (context, state) {
                    if (state is ButtonLoadingState) {
                      return const LoadingIndicator();
                    }

                    return Builder(builder: (context) {
                      return TPrimaryButton(
                        width: context.screenWidth,
                        title: context.translate.btnFinish,
                        onPressed: () {
                          userSignUpRequest.gender = context.read<GenderSelectionCubit>().selectedIndex;
                          userSignUpRequest.age = context.read<AgeSelectionCubit>().selectedAge;
                          context.read<ButtonStateCubit>().execute(
                                usecase: SignupUseCase(),
                                params: userSignUpRequest,
                              );
                        },
                      );
                    });
                  },
                ).withPadding(16.allPadding),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
