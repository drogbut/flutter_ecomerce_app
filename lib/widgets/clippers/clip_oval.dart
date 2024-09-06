import 'package:flutter/material.dart';

/// A circular container with a background and a child
class TCircularContainer extends StatelessWidget {
  final double width, height;
  final Widget? child;
  final Color backgroundColor;
  final double margin;

  const TCircularContainer({
    this.width = 400,
    this.height = 400,
    this.child,
    this.backgroundColor = Colors.white,
    this.margin = 8.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(margin),
      child: ClipOval(
        child: Container(
          height: height,
          width: width,
          color: backgroundColor,
          child: child,
        ),
      ),
    );
  }
}
