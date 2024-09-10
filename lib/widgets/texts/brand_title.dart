import 'package:flutter/material.dart';

import '../../core/constants/enums.dart';
import '../../core/extensions/context.dart';

class TBrandTitleText extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final Color? color;
  final int maxLines;
  final TextSizes brandtextSizes;

  const TBrandTitleText(
    this.title, {
    this.textAlign = TextAlign.center,
    this.maxLines = 1,
    this.brandtextSizes = TextSizes.small,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: brandtextSizes == TextSizes.small
            ? context.textTheme.labelMedium?.apply(color: color)
            : brandtextSizes == TextSizes.medium
                ? context.textTheme.bodyLarge?.apply(color: color)
                : brandtextSizes == TextSizes.large
                    ? context.textTheme.titleLarge?.apply(color: color)
                    : context.textTheme.bodyMedium?.apply(color: color));
  }
}
