import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/extensions/context.dart';
import '../cubit/onbording_cubit.dart';

class OnboardingSmoothNavigation extends StatelessWidget {
  final int pageCount;

  const OnboardingSmoothNavigation({
    required this.pageCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();

    return SmoothPageIndicator(
      controller: cubit.pageController,
      count: pageCount,
      effect: ExpandingDotsEffect(
        activeDotColor: context.isDarkMode ? TColors.light : TColors.dark,
        dotHeight: 8,
      ),
      onDotClicked: cubit.goToPage,
    );
  }
}
