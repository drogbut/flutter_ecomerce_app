import 'package:flutter/material.dart';

import '../../core/extensions/context.dart';
import '../../widgets/loaders/animation_loader.dart';

/// A utulity class to manage a full screen loading dialog.
class TFullScreenLoader {
  /// Open a full screen dialof with the giving text and animation
  static void openLoadingDialog(BuildContext context, String text, String animation) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: context.darkOrWhite,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 250),
                TAnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// stop the current open loading dialog.
  static void stopLoading(BuildContext context) {
    Navigator.of(context).pop();
  }
}
