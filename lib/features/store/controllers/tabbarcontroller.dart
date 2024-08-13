import 'package:get/get.dart';

class TabbarController extends GetxController {
  static TabbarController get instance => Get.find();

  RxInt currentTabIndex = 0.obs;

  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }
}
