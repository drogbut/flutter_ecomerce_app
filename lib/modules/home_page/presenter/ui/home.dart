import 'package:flutter/material.dart';
import '../../../../core/extensions/widget.dart';
import '../../../../ui/my_appbar/platform_back_button.dart';
import 'header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const MyAppBarBackButton(hideBack: true),
      body: SingleChildScrollView(
        child:   Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderHomePage().withPadding(16.horizontalPadding),
          ],
        ),
      ),
    );
  }
}
