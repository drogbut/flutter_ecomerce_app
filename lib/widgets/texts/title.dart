import 'package:flutter/material.dart';

import '../../core/extensions/context.dart';

class TTitleText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final Color? color;

  const TTitleText(
    this.title, {
    this.textAlign,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.textTheme.headlineSmall?.copyWith(
        color: color,
      ),
    );
  }
}
