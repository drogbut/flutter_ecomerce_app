import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';

class TSecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final double? height;
  final Color? textButtonColor;
  final Color? backgroundColor;
  final Color borderColor;
  final TextStyle? textStyle;

  const TSecondaryButton({
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.textButtonColor,
    this.backgroundColor,
    this.borderColor = TColors.grey,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: OutlinedButton(
        style:
            OutlinedButton.styleFrom(minimumSize: Size.fromHeight(height ?? 50), side: BorderSide(color: borderColor)),
        onPressed: onPressed,
        child: Text(title, style: textStyle),
      ),
    );
  }
}
