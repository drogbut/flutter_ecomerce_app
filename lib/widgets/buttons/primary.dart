import 'package:flutter/material.dart';

class TPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final double? height;
  final Color? textButtonColor;
  final Color? backgroundColor;
  final BorderSide? side;
  final TextOverflow? textOverflow;
  final EdgeInsetsGeometry? padding;

  const TPrimaryButton({
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.textButtonColor,
    this.backgroundColor,
    this.side,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding,
          minimumSize: Size.fromHeight(height ?? 50),
          backgroundColor: backgroundColor,
          foregroundColor: textButtonColor,
          side: side,
        ),
        onPressed: onPressed,
        child: Text(title, overflow: textOverflow),
      ),
    );
  }
}
