import 'package:flutter/material.dart';

import '../../../core/extensions/context.dart';
import '../domain/sizing_info.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, SizingInfo sizingInfo) builder;

  const ResponsiveBuilder({
    required this.builder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        SizingInfo sizing = SizingInfo(
          deviceScreenType: context.deviceType,
          screenSize: context.mediaQuerySize,
          localWidgetSize: Size(constraints.maxWidth, constraints.maxHeight),
          constraints: constraints,
        );

        return builder(context, sizing);
      },
    );
  }
}
