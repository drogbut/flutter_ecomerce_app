import 'package:flutter/material.dart';

import '../../../../widgets/clippers/clipper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: SafeArea(
          child: Column(
            children: [
              /// Background clipper widget
              TClipperWidget(),

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
