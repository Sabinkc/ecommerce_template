import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchControllers extends GetxController {
  static SearchControllers get instance => Get.find();

  RxList recentlySearched = [
    "Laptop",
    "Iphone",
    "Air Tag",
    "Earphone",
  ].obs;

  TextEditingController search = TextEditingController();

  void addRecently(String query) {
    recentlySearched.add(query);
  }

  void clearRecently() {
    recentlySearched.clear();
  }
}
