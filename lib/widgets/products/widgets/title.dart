import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';

class TProductTitleText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final Color? color;
  final bool isSmallSize;
  final int maxlines;

  const TProductTitleText({
    required this.title,
    this.textAlign = TextAlign.left,
    this.isSmallSize = false,
    this.maxlines = 2,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: isSmallSize ? context.textTheme.labelLarge : context.textTheme.titleSmall,
    );
  }
}
