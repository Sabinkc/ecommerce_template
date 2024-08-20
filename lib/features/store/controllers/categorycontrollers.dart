import 'package:get/get.dart';

class CategoryControllers extends GetxController {
  static CategoryControllers get instance => Get.find();

  RxInt tabIndex = 0.obs;
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
