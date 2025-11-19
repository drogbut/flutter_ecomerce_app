import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/sizes.dart';
import '../../core/extensions/widget.dart';
import '../containers/rounded_container.dart';
import '../images/rounded.dart';
import 'cubit/carousel_cubit.dart';
import 'cubit/carousel_state.dart';

class TCarousel extends StatelessWidget {
  final List<String> banners;

  const TCarousel({
    required this.banners,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselCubit(),
      child: BlocBuilder<CarouselCubit, CarouselState>(
        builder: (context, state) {
          return Column(
            children: [
              /// Rounded image
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) => context.read<CarouselCubit>().updatePageIndicator(index),
                ),
                items: banners
                    .map(
                      (url) => TRoundedImage(imageUrl: url),
                    )
                    .toList(),
              ),

              /// Spacer
              TSizes.spaceBtwItems.sbs,

              /// Slider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < banners.length; i++)
                    TRoundedContainer(
                      width: 20,
                      height: 4,
                      backgroundColor: state.currentPageIndex == i ? TColors.primary : TColors.grey,
                      margin: const EdgeInsets.all(TSizes.xs),
                    )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
