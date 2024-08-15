import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class SQLoader {
  static hideSnackBar() => ScaffoldMessenger.of(Get.overlayContext!).hideCurrentMaterialBanner();

  static currentToast({required message}) {
    ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
      SnackBar(
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: SQColors.grey.withOpacity(0.9),
          ),
          child: Center(
              child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          )),
        ),
      ),
    );
  }

  static sucessSnackBar({required title, message = '', duration = 3, icon = Icons.check}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: SQColors.success,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  static warningSnackBar({required title, message = '', duration = 3, icon = Icons.warning}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: SQColors.warning,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      duration: Duration(seconds: duration),
      margin: const EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: Colors.red.shade500,
      snackStyle: SnackStyle.GROUNDED,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(0),
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.white,
      ),
    );
  }
}
