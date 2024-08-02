import 'package:flutter/material.dart';

import '../../core/extensions/context.dart';

class MyTitle extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;

  const MyTitle(
    this.title, {
    super.key,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ));
  }
}
