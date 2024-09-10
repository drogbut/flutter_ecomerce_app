import 'package:flutter/material.dart';
import '../../../core/extensions/context.dart';

class TProductPriceText extends StatelessWidget {
  final String currentSign;
  final String price;
  final TextAlign? textAlign;
  final Color? color;
  final bool isLarge, lineThrough;
  final int maxlines;

  const TProductPriceText({
    required this.price,
    this.currentSign = '\$',
    this.textAlign = TextAlign.left,
    this.isLarge = false,
    this.maxlines = 1,
    this.lineThrough = false,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$currentSign$price',
      textAlign: textAlign,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? context.textTheme.headlineMedium?.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : context.textTheme.titleMedium?.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            ),
    );
  }
}
