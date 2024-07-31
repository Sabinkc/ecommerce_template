import 'package:ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenLoader {
  static void openLoadingDialog() {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) {
        return const Center(
          child: CircularProgressIndicator(
            color: SQColors.primary,
          ),
        );
      },
    );
  }

  static stopLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
