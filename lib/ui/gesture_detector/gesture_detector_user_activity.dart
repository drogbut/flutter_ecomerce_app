import 'package:flutter/material.dart';
import '../../core/extensions/context.dart';

class GestureDetectorUserActivityDetected extends StatelessWidget {
  final Widget? child;

  const GestureDetectorUserActivityDetected({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Focus(
      onKeyEvent: (node, event) {
        //UtilitySessionTimeout().userActivityDetected();

        return KeyEventResult.ignored;
      },
      canRequestFocus: false,
      child: GestureDetector(
        onTap: () {
          //UtilitySessionTimeout().userActivityDetected();

          FocusScopeNode currentFocus = context.focusScope;

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        //onPanDown: UtilitySessionTimeout().userActivityDetected,
        //onScaleStart: UtilitySessionTimeout().userActivityDetected,
        child: child,
      ),
    );
  }
}
