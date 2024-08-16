import 'package:get/get.dart';

class OrderControllers extends GetxController {
  static OrderControllers get instance => Get.find();

  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
