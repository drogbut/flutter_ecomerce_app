import 'package:flutter/material.dart';

import '../../../../../../core/constants/sizes.dart';
import '../../../../../../core/extensions/context.dart';
import '../../../../../../core/extensions/widget.dart';
import '../../../../../../widgets/appbar/appbar.dart';
import '../../../../../../widgets/icons/cart_counter.dart';
import '../../../../../../widgets/texts/title.dart';
import 'category_tab.dart';
import 'featured_brands.dart';

class StoreProductScreen extends StatelessWidget {
  const StoreProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: TTitleText(context.translate.store),
        actions: [
          TCartCounterIcon(onPressed: () {}).withPadding(TSizes.defaultSpace.rightPadding),
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              /// Featured brands section
              const StoreFeaturedBrands()
            ];
          },
          body: const DefaultTabController(
            length: 5,
            child: TabBarView(
              children: [
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),
                TCategoryTab(),

                /// Products
              ],
            ),
          )),
    );
  }
}
