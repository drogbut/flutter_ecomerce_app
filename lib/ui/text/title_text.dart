import 'package:flutter/material.dart';

import '../../core/extensions/context.dart';

class MyTitle extends StatelessWidget {
  final String title;

  const MyTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: context.textTheme.headlineSmall?.copyWith(
          fontWeight: FontWeight.bold,
        ));
  }
}
