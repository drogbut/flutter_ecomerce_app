import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

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

  /// Snackbar success
  static void successSnackbar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.green.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.copy_success, color: Colors.white),
    );
  }

  /// Snackbar warning
  static void warningSnackbar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.orange.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: Colors.white),
    );
  }

  /// Snackbar error
  static void errorSnackbar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2, color: Colors.white),
    );
  }

  /// stop the current open loading dialog.
  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
