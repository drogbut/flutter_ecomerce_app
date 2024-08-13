import 'package:flutter/material.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../ui/my_appbar/platform_back_button.dart';
import 'categories.dart';
import 'header.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Header().withPadding(8.verticalPadding),
            const SearchField().withPadding(8.verticalPadding),
            const Categories().withPadding(8.verticalPadding),
          ],
        ).withPadding(16.horizontalPadding),
      ),
    );
  }
}
