import 'package:flutter/material.dart';

import '../../../../core/constants/sizes.dart';
import '../../../../widgets/appbar/appbar.dart';
import '../../../../widgets/texts/title.dart';
import '../../../core/extensions/widget.dart';
import 'widgets/order_item_card.dart';

class TOrdersScreen extends StatelessWidget {
  const TOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTitleText('my Orders'), showBackIcon: true),
      body: Padding(
        padding: TSizes.defaultSpace.allPadding,

        /// Orders list items
        child: const TOrderItemCard(),
      ),
    );
  }
}
