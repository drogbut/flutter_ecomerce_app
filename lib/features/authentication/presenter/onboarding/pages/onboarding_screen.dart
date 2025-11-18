import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../routing/route_names.dart';
import '../../../../../widgets/appbar/appbar.dart';
import '../../../../../widgets/buttons/tertiary.dart';
import '../../../../app/cubit/auth_cubit.dart';
import '../cubit/onbording_cubit.dart';
import '../cubit/onbording_state.dart';
import '../widgets/indicator_button.dart';
import '../widgets/onboarding_image.dart';
import '../widgets/smooth_navigation.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listenWhen: (previous, current) => previous.completed != current.completed,
        listener: (context, state) async {
          if (state.completed) {
            context.read<AuthenticationCubit>().completeOnboarding();

            // Manual navigation to Home
            context.goNamed(RouteNames.home);
          }
        },
        builder: (context, state) {
          final cubit = context.read<OnboardingCubit>();

          return Scaffold(
            appBar: TAppBar(
              title: Text('Guide Tour'),
              actions: [
                TTertiaryButton(
                  title: context.translate.btnSkip,
                  onPressed: () {
                    cubit.onBoardingSkipped();
                    //context.goNamed(RouteNames.home);
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: PageView(
                controller: cubit.pageController,
                onPageChanged: cubit.updatePageIndicator,
                children: [
                  OnboardingImage(
                    image: TImages.onBoardingImage1,
                    title: context.translate.onboardingTitle1,
                    subTitle: context.translate.onboardingSubTitle1,
                  ),
                  OnboardingImage(
                    image: TImages.onBoardingImage2,
                    title: context.translate.onboardingTitle2,
                    subTitle: context.translate.onboardingSubTitle2,
                  ),
                  OnboardingImage(
                    image: TImages.onBoardingImage3,
                    title: context.translate.onboardingTitle3,
                    subTitle: context.translate.onboardingSubTitle3,
                  ),
                ],
              ),
            ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Row(
                  children: [
                    /// Page indicator
                    Expanded(
                      child: OnboardingSmoothNavigation(pageCount: cubit.pageCount),
                    ),

                    /// Next button
                    OnboardingIndicatorButton(
                        iconData: Iconsax.arrow_right_3,
                        onPressed: () {
                          cubit.nextPage();
                        }),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
