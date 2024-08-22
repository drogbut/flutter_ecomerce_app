import 'package:flutter/material.dart';

class MyPrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final double? height;
  final Color? textButtonColor;
  final Color? backgroundColor;

  const MyPrimaryButton({
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
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
          minimumSize: Size.fromHeight(height ?? 50),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
