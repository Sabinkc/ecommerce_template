import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  // Image mapping by color
  final Map<Color, List<String>> imageWithColor = {
    const Color(0xFF424E5A): [
      "assets/images/phonecase.jpg",
      "assets/images/phonecase_1.jpg",
      "assets/images/phonecase_2.jpg",
    ],
    const Color(0xFFFBA578): [
      "assets/images/phonecase_3.jpg",
      "assets/images/phonecase_4.jpg",
      "assets/images/phonecase_5.jpg",
    ],
    const Color(0xFFFDEAE6): [
      "assets/images/phonecase_6.jpg",
      "assets/images/phonecase_7.jpg",
      "assets/images/phonecase_8.jpg",
    ],
    const Color(0xFF323433): [
      "assets/images/phonecase_9.jpg",
      "assets/images/phonecase_10.jpg",
      "assets/images/phonecase_11.jpg",
    ],
  };

  RxInt selectedImageIndex = 0.obs;

  void changeImageIndex(int index) {
    selectedImageIndex.value = index;
  }
}
