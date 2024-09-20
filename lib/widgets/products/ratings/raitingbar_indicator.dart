import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

import '../../../core/constants/colors.dart';

class TRatingsBarIndicator extends StatelessWidget {
  final double rating;
  const TRatingsBarIndicator({required this.rating, super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      itemCount: 5,
      itemSize: 20,
      rating: rating,
      itemBuilder: (_, index) => const Icon(
        Iconsax.star1,
        color: TColors.secondary,
      ),
    );
  }
}
