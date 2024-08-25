import 'package:get/get.dart';

class OrderControllers extends GetxController {
  /// This controller helps to change tab in Order Screen
  static OrderControllers get instance => Get.find();

  // inital tab index
  RxInt tabIndex = 0.obs;

  // func to change tab index, it take int value
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
