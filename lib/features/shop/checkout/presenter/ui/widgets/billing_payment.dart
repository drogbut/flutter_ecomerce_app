import 'package:flutter/material.dart';

import '../../../../../../core/constants/images_string.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/containers/rounded_container.dart';
import '../../../../../../widgets/texts/section_header.dart';

class TBillingPaymentMethods extends StatelessWidget {
  const TBillingPaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Header
        const TSectionHeader(
          title: 'Payment methods',
          showActionButton: true,
          buttonTitle: 'Change',
        ),
        TSizes.sm.sbs,

        /// PayPal
        Padding(
          padding: TSizes.sm.horizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: context.lightOrWhite,
                child: const Image(
                  image: AssetImage(TImages.paypal),
                  fit: BoxFit.contain,
                ),
              ),
              TSizes.sm.sbs,
              Text('Paypal', style: context.textTheme.bodyLarge)
            ],
          ),
        ),
        TSizes.sm.sbs,
      ],
    );
  }
}
