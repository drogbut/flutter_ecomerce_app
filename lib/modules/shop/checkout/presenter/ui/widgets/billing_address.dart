import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/texts/section_header.dart';

class TBillingAddress extends StatelessWidget {
  const TBillingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Header
        const TSectionHeader(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
        ),
        Text('Shopping Wit T', style: context.textTheme.bodyLarge),
        TSizes.sm.sbs,

        /// phone
        Padding(
          padding: TSizes.sm.horizontalPadding,
          child: Row(
            children: [
              const Icon(Icons.phone, color: Colors.grey, size: 16),
              TSizes.spaceBtwItems.sbs,
              Text('+49 (0) 176 123123', style: context.textTheme.bodyMedium),
            ],
          ),
        ),
        TSizes.sm.sbs,

        /// phone
        Padding(
          padding: TSizes.sm.horizontalPadding,
          child: Row(
            children: [
              const Icon(Icons.location_history, color: Colors.grey, size: 16),
              TSizes.spaceBtwItems.sbs,
              Text(
                'Strasse 2, 44444 Dortmund',
                style: context.textTheme.bodyMedium,
                softWrap: true,
              ),
            ],
          ),
        ),
        TSizes.sm.sbs,
      ],
    );
  }
}
