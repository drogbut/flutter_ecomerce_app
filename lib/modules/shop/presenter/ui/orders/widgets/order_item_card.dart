import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/containers/rounded_container.dart';

class TOrderItemCard extends StatelessWidget {
  const TOrderItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 10,
        separatorBuilder: (_, __) => TSizes.defaultSpace.sbs,
        itemBuilder: (_, __) => TRoundedContainer(
              showBorder: true,
              backgroundColor: context.darkgreyOrLight,
              child: Column(
                children: [
                  ///-- Row 1
                  ListTile(
                    leading: Icon(Iconsax.ship, color: context.whiteOrBlack).withPadding(TSizes.sm.leftPadding),
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      'Processing',
                      style: context.textTheme.bodyLarge?.copyWith(color: TColors.primary, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      '01 Sept. 2023',
                      style: context.textTheme.headlineSmall,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Icon(
                      Iconsax.arrow_right_34,
                      color: context.whiteOrBlack,
                      size: TSizes.iconSm,
                    ).withPadding(TSizes.spaceBtwItems.rightPadding),
                  ),

                  ///-- Row 2
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Iconsax.tag, color: context.whiteOrBlack).withPadding(TSizes.sm.leftPadding),
                          title: Text(
                            'Order',
                            style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            'CWT0025',
                            style: context.textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading:
                              Icon(Iconsax.calendar, color: context.whiteOrBlack).withPadding(TSizes.sm.leftPadding),
                          title: Text(
                            'Shipping Date',
                            style: context.textTheme.labelMedium?.copyWith(color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                            '01 Sept. 2023',
                            style: context.textTheme.titleMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
