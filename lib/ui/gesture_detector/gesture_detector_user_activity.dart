import 'package:flutter/material.dart';

import '../core/_utilities.dart';
import '../core/extensions/context.dart';

class GestureDetectorUserActivityDetected extends StatelessWidget {
  final Widget? child;

  const GestureDetectorUserActivityDetected({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKey: (node, event) {
        UtilitySessionTimeout().userActivityDetected();

        return KeyEventResult.ignored;
      },
      canRequestFocus: false,
      child: GestureDetector(
        onTap: () {
          UtilitySessionTimeout().userActivityDetected();

          FocusScopeNode currentFocus = context.focusScope;

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        onPanDown: UtilitySessionTimeout().userActivityDetected,
        onScaleStart: UtilitySessionTimeout().userActivityDetected,
        child: child,
      ),
    );
  }
}
