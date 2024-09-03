import 'package:flutter/material.dart';

/// A circular container with a background and a child
class TClipOval extends StatelessWidget {
  final double size;
  final Widget? child;
  final Color backgroundColor;

  const TClipOval({
    this.size = 400,
    this.child,
    this.backgroundColor = Colors.white,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(height: size, width: size, color: backgroundColor, child: child),
    );
  }
}
