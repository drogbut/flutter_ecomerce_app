import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constants/images_string.dart';
import '../../../../../../core/extensions/context.dart';
import '../onboarding_controller.dart';
import '../../widgets/next_button.dart';
import '../../widgets/skip_button.dart';
import '../../widgets/slider_image.dart';
import '../../widgets/smooth_navigation.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
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

          /// The skip button
          OnboardingSkip(controller: controller),

          /// The smooth page indicator
          OnboardingSmoothNavigation(controller: controller),

          /// The next button
          OnboardingNextButton(controller: controller),
        ],
      ),
    );
  }
}
