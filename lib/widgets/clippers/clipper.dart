import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'footer.dart';
import 'header.dart';

/// The custom clipper design screen
class TCurvedEdgeWidget extends StatelessWidget {
  final Color? color;
  final Widget child;

  const TCurvedEdgeWidget({
    required this.child,
    this.color = TColors.primary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurvedEdge(),
      child: THeaderContainer(color: color, child: child),
    );
  }
}
