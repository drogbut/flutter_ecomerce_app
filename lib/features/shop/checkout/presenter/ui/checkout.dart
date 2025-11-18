import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../routing/route_names.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/texts/title.dart';
import '../../../../../core/extensions/context.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/buttons/primary.dart';
import '../../../../../widgets/containers/rounded_container.dart';
import '../../../../../widgets/products/cards/coupon.dart';
import 'widgets/billing_address.dart';
import 'widgets/billing_amount.dart';
import 'widgets/billing_payment.dart';
import 'widgets/checkout_item_card.dart';

class TCheckoutScreen extends StatelessWidget {
  const TCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTitleText('Order Reviews'), showBackIcon: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///-- Add Item Card list
              const CheckoutItemCard(),
              TSizes.spaceBtwSections.sbs,

              /// Promote Coupon
              const TPromoteCoupon(),
              TSizes.spaceBtwSections.sbs,

              /// Billings section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: context.darkOrWhite,
                padding: TSizes.sm.allPadding,
                child: Column(
                  children: [
                    /// Pricing
                    const TBillingAmount(),
                    TSizes.spaceBtwItems.sbs,

                    /// Divider
                    const Divider(),
                    TSizes.spaceBtwItems.sbs,

                    /// Payment methods
                    const TBillingPaymentMethods(),
                    TSizes.spaceBtwItems.sbs,

                    /// Address Section
                    const TBillingAddress(),
                    TSizes.spaceBtwItems.sbs,
                  ],
                ),
              ),
              TSizes.spaceBtwSections.sbs,
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TPrimaryButton(
            title: 'Checkout €325',
            onPressed: () => context.pushNamed(RouteNames.success)),
      ),
    );
  }
}
