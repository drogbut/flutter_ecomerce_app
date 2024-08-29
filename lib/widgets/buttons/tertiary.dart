import 'package:flutter/material.dart';

class TTertiaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? width;
  final TextStyle? style;

  const TTertiaryButton({
    required this.title,
    required this.onPressed,
    this.width,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        child: Text(title, style: style),
      ),
    );
  }
}
