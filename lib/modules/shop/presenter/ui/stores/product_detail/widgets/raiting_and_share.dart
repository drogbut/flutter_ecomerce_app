import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../core/constants/sizes.dart';
import '../../../../../../../core/extensions/widget.dart';

class TRaitingAndShare extends StatelessWidget {
  const TRaitingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Iconsax.star5, color: Colors.amber),
            TSizes.sm.sbs,
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: '5.0 ', style: context.textTheme.bodyLarge),
                  const TextSpan(text: '(199)'),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {},
        ),
      ],
    );
  }
}
