import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';
import '../../../core/extensions/color.dart';
import '../../../core/extensions/context.dart';
import '../../../core/extensions/widget.dart';
import '../../buttons/primary.dart';
import '../../containers/rounded_container.dart';

class TPromoteCoupon extends StatelessWidget {
  const TPromoteCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: context.darkOrWhite,
      padding: TSizes.sm.allPadding,
      child: Row(
        children: [
          /// Text field
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promote code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// Button
          TPrimaryButton(
            width: 80,
            padding: TSizes.sm.horizontalPadding,
            backgroundColor: Colors.grey.withOpacityPercent(0.2),
            textButtonColor: context.isDarkMode ? TColors.white.withOpacityPercent(0.5) : TColors.dark.withOpacityPercent(0.5),
            side: BorderSide(color: Colors.grey.withOpacityPercent(0.2)),
            title: 'Apply',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
