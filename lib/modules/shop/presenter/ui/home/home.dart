import 'package:flutter/material.dart';

import '../../../../../core/constants/sizes.dart';
import '../../../../../core/extensions/widget.dart';
import '../../../../../widgets/clippers/clipper.dart';
import 'appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Column(
            children: [
              /// Background clipper widget
              TClipperWidget(
                child: Column(
                  children: [
                    /// Appbar
                    const THomeAppBar().withPadding((h: TSizes.sm, v: TSizes.spaceBtwSections).symmetricPadding),

                    /// Search bar

                    /// Categories

                    /// Articles
                  ],
                ),
              ),

              // const Header().withPadding(8.verticalPadding),
              // const SearchField().withPadding(8.verticalPadding),
              // const Categories().withPadding(8.verticalPadding),
              // const TopSelling().withPadding(8.verticalPadding),
            ],
          ),
        ),
      ),
    );
  }
}
