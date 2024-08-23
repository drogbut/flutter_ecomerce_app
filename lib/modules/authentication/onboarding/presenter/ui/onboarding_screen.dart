import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/images_string.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/context.dart';
import '../providers/onboarding_controller.dart';
import 'widgets/onboarding.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = OnboardingController();
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal scrollable page
          PageView(
            children: [
              OnboardingPage(
                image: DImages.onboarding1,
                title: context.translate.onboardingTitle1,
                subTitle: context.translate.onboardingSubTitle1,
              ),
              OnboardingPage(
                image: DImages.onboarding2,
                title: context.translate.onboardingTitle2,
                subTitle: context.translate.onboardingSubTitle2,
              ),
              OnboardingPage(
                image: DImages.onboarding3,
                title: context.translate.onboardingTitle3,
                subTitle: context.translate.onboardingSubTitle3,
              ),
            ],
          ),

          /// The skip button
          Positioned(
            top: DSizes.appBarHeight,
            right: DSizes.defaultSpace,
            child: TextButton(
              onPressed: () {},
              child: Text(context.translate.btnSkip),
            ),
          ),

          /// The next button
          Positioned(
            bottom: DSizes.bottomNavigationHeight,
            right: DSizes.zero,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                backgroundColor: context.isDarkMode ? DColors.primary : DColors.dark,
                //foregroundColor: Colors.white,
              ),
              onPressed: () {},
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),

          /// The smooth page indicator
          Positioned(
            bottom: DSizes.bottomNavigationHeight + 25,
            left: DSizes.defaultSpace,
            child: SmoothPageIndicator(
              effect: ExpandingDotsEffect(
                activeDotColor: context.isDarkMode ? DColors.light : DColors.dark,
                dotHeight: 6,
              ),
              controller: controller.pageController,
              count: 3,
            ),
          ),
        ],
      ),
    );
  }
}
