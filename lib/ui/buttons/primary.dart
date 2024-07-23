import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final Color? textButtonColor;
  final Color? backgroundColor;

  const MyPrimaryButton({
    required this.title,
    required this.onPressed,
    this.width,
    this.textButtonColor,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textButtonColor,
          backgroundColor: backgroundColor,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
