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
    "assets/images/iPhoneBanner.jpg",
  ];
}
