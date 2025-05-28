import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/color.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/containers/rounded_container.dart';

class TSingleAddress extends StatelessWidget {
  final bool isSelectedAddress;
  const TSingleAddress({required this.isSelectedAddress, super.key});

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      padding: TSizes.sm.allPadding,
      showBorder: true,
      width: double.infinity,
      backgroundColor: isSelectedAddress
          ? TColors.primary.withOpacityPercent(0.5)
          : Colors.transparent,
      borderColor:
          isSelectedAddress ? Colors.transparent : context.darkgreyOrGrey,
      margin: TSizes.spaceBtwItems.bottomPadding,
      child: Stack(
        children: [
          /// Icon
          Positioned(
            top: 0,
            right: 5,
            child: Icon(
              isSelectedAddress ? Iconsax.tick_circle5 : null,
              color: isSelectedAddress ? context.darkOrWhite : null,
            ),
          ),

          /// Infos
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'john Doe',
                style: context.textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              TSizes.xs.sbs,
              const Text('+49(0) 176 123123',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              TSizes.xs.sbs,
              const Text('Strasse 2, 44444 Dortmund',
                  maxLines: 1, overflow: TextOverflow.ellipsis),
              TSizes.xs.sbs,
              const Text('Dortmund, Germany', softWrap: true),
              TSizes.xs.sbs,
            ],
          ),
        ],
      ),
    );
  }
}
