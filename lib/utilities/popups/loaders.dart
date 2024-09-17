import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/extensions/context.dart';

/// A utulity class to manage a full screen loading dialog.
class TLoaders {
  /// Open a full screen dialof with the giving text and animation
  static void customToast({required String message}) {
    final context = Get.overlayContext!;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false, // Disable poping with the back button
        child: Container(
          color: context.darkOrWhite,
          width: double.infinity,
          height: double.infinity,
          child: const Column(
            children: [
              SizedBox(height: 250),
              //TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// stop the current open loading dialog.
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
