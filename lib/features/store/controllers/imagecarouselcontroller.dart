import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ImageCarouselController extends GetxController {
  static ImageCarouselController get instance => Get.find();
  final PageController pageController = PageController();
  final RxInt currentIndex = 0.obs;
  final List<String> imageLink = [
    "assets/images/HeadPhoneBanner.jpg",
    "assets/images/iPhoneBanner.jpg",
    "assets/images/HeadPhoneBanner.jpg",
  ];
  Timer? timer;

  @override
  void onInit() {
    super.onInit();
    startAutoScroll();
  }

  @override
  void onClose() {
    timer?.cancel();
    pageController.dispose();
    super.onClose();
  }

  void startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentIndex.value < imageLink.length - 1) {
        currentIndex.value++;
      } else {
        currentIndex.value = 0;
      }
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }
}
